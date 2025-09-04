using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Management;
using System.Security.Cryptography;
using System.ServiceProcess;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;

namespace SetupManager.Services
{
    /// <summary>
    /// DeviceManager Service - Service Management & CCTalk Integration
    /// Migriert Logic aus PowerShell DMH Scripts (10_dmh.ps1, install-dmh.ps1)
    /// </summary>
    public class DeviceManagerService : IDeviceManager
    {
        private readonly ILogger<DeviceManagerService> _logger;
        private readonly string[] _candidateServiceNames = { 
            "devicemanager", "DeviceManager", "DeviceManager.Service", 
            "DeviceManagerService", "DMH" 
        };

        public DeviceManagerService(ILogger<DeviceManagerService> logger)
        {
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        /// <summary>
        /// Holt verfügbare Hardware-Devices (CCTalk fokussiert)
        /// </summary>
        public async Task<IEnumerable<DeviceInfo>> GetAvailableDevicesAsync()
        {
            _logger.LogInformation("Starting device scan (CCTalk focused)...");
            
            var devices = new List<DeviceInfo>();
            
            try
            {
                // 1. DeviceManager Service Status
                var serviceInfo = await GetDeviceManagerServiceInfoAsync();
                devices.Add(serviceInfo);

                // 2. CCTalk COM Ports Detection
                var comPorts = await GetCCTalkDevicesAsync();
                devices.AddRange(comPorts);

                // 3. Money System Paths
                var moneySystems = await GetMoneySystemDevicesAsync();
                devices.AddRange(moneySystems);

                _logger.LogInformation($"Device scan completed. Found {devices.Count} devices");
                return devices;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error during device scan");
                throw;
            }
        }

        /// <summary>
        /// Prüft ob DeviceManager Service verfügbar ist
        /// </summary>
        public async Task<bool> IsDeviceAvailableAsync(string deviceId)
        {
            if (string.IsNullOrWhiteSpace(deviceId))
                return false;

            try
            {
                if (deviceId.Equals("DeviceManagerService", StringComparison.OrdinalIgnoreCase))
                {
                    var service = GetDeviceManagerService();
                    return service != null;
                }

                var devices = await GetAvailableDevicesAsync();
                return devices.Any(d => d.DeviceId.Equals(deviceId, StringComparison.OrdinalIgnoreCase));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Error checking device availability: {deviceId}");
                return false;
            }
        }

        /// <summary>
        /// Holt detaillierte DeviceManager Service Informationen
        /// </summary>
        public async Task<DeviceInfo> GetDeviceInfoAsync(string deviceId)
        {
            if (string.IsNullOrWhiteSpace(deviceId))
                throw new ArgumentException("DeviceId cannot be null or empty", nameof(deviceId));

            var devices = await GetAvailableDevicesAsync();
            var device = devices.FirstOrDefault(d => d.DeviceId.Equals(deviceId, StringComparison.OrdinalIgnoreCase));
            
            if (device == null)
                throw new InvalidOperationException($"Device not found: {deviceId}");

            return device;
        }

        #region DeviceManager Service Management

        /// <summary>
        /// Findet DeviceManager Service (mit Heuristik aus install-dmh.ps1)
        /// </summary>
        public ServiceController GetDeviceManagerService()
        {
            try
            {
                // Direkte Suche nach bekannten Namen
                foreach (var serviceName in _candidateServiceNames)
                {
                    try
                    {
                        var service = new ServiceController(serviceName);
                        // Test ob Service existiert
                        _ = service.Status;
                        _logger.LogDebug($"Found DeviceManager service: {serviceName}");
                        return service;
                    }
                    catch (InvalidOperationException)
                    {
                        // Service existiert nicht - weiter suchen
                    }
                }

                // Heuristik: Suche nach DeviceManager Pattern
                var services = ServiceController.GetServices();
                var candidate = services.FirstOrDefault(s => 
                    s.ServiceName.Contains("devicemanager", StringComparison.OrdinalIgnoreCase) ||
                    s.DisplayName.Contains("Device", StringComparison.OrdinalIgnoreCase) && 
                    s.DisplayName.Contains("Manager", StringComparison.OrdinalIgnoreCase));

                if (candidate != null)
                {
                    _logger.LogWarning($"DeviceManager service found via heuristic: {candidate.ServiceName}");
                    return candidate;
                }

                _logger.LogWarning("DeviceManager service not found");
                return null;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error finding DeviceManager service");
                return null;
            }
        }

        /// <summary>
        /// Startet DeviceManager Service sicher (mit Timeout)
        /// </summary>
        public async Task<bool> StartDeviceManagerServiceAsync(int timeoutSeconds = 45)
        {
            try
            {
                var service = GetDeviceManagerService();
                if (service == null)
                {
                    _logger.LogError("DeviceManager service not found - cannot start");
                    return false;
                }

                if (service.Status == ServiceControllerStatus.Running)
                {
                    _logger.LogInformation($"DeviceManager service '{service.ServiceName}' already running");
                    return true;
                }

                _logger.LogInformation($"Starting DeviceManager service: {service.ServiceName}");
                
                // Ensure Auto Start
                await EnsureServiceAutoStartAsync(service.ServiceName);
                
                service.Start();
                service.WaitForStatus(ServiceControllerStatus.Running, TimeSpan.FromSeconds(timeoutSeconds));
                
                _logger.LogInformation($"DeviceManager service started successfully: {service.Status}");
                return service.Status == ServiceControllerStatus.Running;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to start DeviceManager service");
                return false;
            }
        }

        /// <summary>
        /// Stoppt DeviceManager Service
        /// </summary>
        public async Task<bool> StopDeviceManagerServiceAsync(int timeoutSeconds = 60)
        {
            try
            {
                var service = GetDeviceManagerService();
                if (service == null)
                {
                    _logger.LogWarning("DeviceManager service not found");
                    return false;
                }

                if (service.Status == ServiceControllerStatus.Stopped)
                {
                    _logger.LogInformation($"DeviceManager service '{service.ServiceName}' already stopped");
                    return true;
                }

                _logger.LogInformation($"Stopping DeviceManager service: {service.ServiceName}");
                
                service.Stop();
                service.WaitForStatus(ServiceControllerStatus.Stopped, TimeSpan.FromSeconds(timeoutSeconds));
                
                _logger.LogInformation($"DeviceManager service stopped: {service.Status}");
                return service.Status == ServiceControllerStatus.Stopped;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to stop DeviceManager service");
                return false;
            }
        }

        /// <summary>
        /// DeviceManager Health Check (aus Tiptorro.Setup.Common.psm1)
        /// </summary>
        public async Task<(bool Healthy, string Details)> TestDeviceManagerHealthAsync()
        {
            try
            {
                var service = GetDeviceManagerService();
                if (service == null)
                    return (false, "Service not installed");

                service.Refresh();
                if (service.Status != ServiceControllerStatus.Running)
                    return (false, "Service not running");

                // Check für recent Service Events (Event ID 7036)
                try
                {
                    var recentEvents = await CheckServiceEventsAsync(service.ServiceName);
                    var details = recentEvents ? "Running (recent events detected)" : "Running";
                    return (true, details);
                }
                catch
                {
                    return (true, "Running (event check skipped)");
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error during DeviceManager health check");
                return (false, $"Health check failed: {ex.Message}");
            }
        }

        #endregion

        #region CCTalk Device Detection

        /// <summary>
        /// Erkennt CCTalk Geräte auf COM Ports (aus cctalk-maintenance.ps1)
        /// </summary>
        private async Task<IEnumerable<DeviceInfo>> GetCCTalkDevicesAsync()
        {
            return await Task.Run(() =>
            {
                var devices = new List<DeviceInfo>();
                
                try
                {
                    // COM Ports via WMI abfragen
                    using var searcher = new ManagementObjectSearcher(
                        "SELECT * FROM Win32_SerialPort WHERE PNPDeviceID IS NOT NULL");
                    using var results = searcher.Get();
                    
                    foreach (ManagementObject obj in results)
                    {
                        var deviceId = GetStringValue(obj, "DeviceID") ?? "COM_UNKNOWN";
                        var description = GetStringValue(obj, "Description") ?? "Serial Port";
                        
                        // CCTalk typische Baud Rates: 9600, 19200, 38400, 57600, 115200
                        var possibleBaudRates = new[] { 9600, 19200, 38400, 57600, 115200 };
                        
                        devices.Add(new DeviceInfo
                        {
                            DeviceId = deviceId,
                            Name = $"CCTalk Device ({deviceId})",
                            Category = "CCTalk",
                            Manufacturer = GetStringValue(obj, "Manufacturer") ?? "Unknown",
                            Status = "Available",
                            Properties = new Dictionary<string, object>
                            {
                                ["Description"] = description,
                                ["PNPDeviceID"] = GetStringValue(obj, "PNPDeviceID"),
                                ["MaxBaudRate"] = GetUInt32Value(obj, "MaxBaudRate"),
                                ["SupportedBaudRates"] = possibleBaudRates,
                                ["IsCCTalkCandidate"] = IsCCTalkCandidate(description, deviceId)
                            }
                        });
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogWarning(ex, "Failed to query CCTalk devices");
                }

                return devices;
            });
        }

        /// <summary>
        /// Heuristik für CCTalk Device Detection
        /// </summary>
        private bool IsCCTalkCandidate(string description, string deviceId)
        {
            var ccTalkIndicators = new[] 
            { 
                "ftdi", "ch340", "cp210", "usb", "serial",
                "coin", "note", "validator", "acceptor" 
            };
            
            var text = $"{description} {deviceId}".ToLowerInvariant();
            return ccTalkIndicators.Any(indicator => text.Contains(indicator));
        }

        #endregion

        #region Money System Detection

        /// <summary>
        /// Findet Money System Paths (aus install-dmh.ps1)
        /// </summary>
        private async Task<IEnumerable<DeviceInfo>> GetMoneySystemDevicesAsync()
        {
            return await Task.Run(() =>
            {
                var devices = new List<DeviceInfo>();
                
                try
                {
                    var moneySystemPaths = FindMoneySystemPaths();
                    
                    foreach (var path in moneySystemPaths)
                    {
                        var pathInfo = new DirectoryInfo(path);
                        if (pathInfo.Exists)
                        {
                            devices.Add(new DeviceInfo
                            {
                                DeviceId = $"MoneySystem_{pathInfo.Name}",
                                Name = $"Money System ({pathInfo.Name})",
                                Category = "MoneySystem",
                                Manufacturer = "System",
                                Status = "Available",
                                Properties = new Dictionary<string, object>
                                {
                                    ["Path"] = path,
                                    ["LastModified"] = pathInfo.LastWriteTime,
                                    ["FileCount"] = pathInfo.GetFiles("*", SearchOption.AllDirectories).Length,
                                    ["Size"] = CalculateDirectorySize(pathInfo)
                                }
                            });
                        }
                    }
                }
                catch (Exception ex)
                {
                    _logger.LogWarning(ex, "Failed to scan Money System paths");
                }

                return devices;
            });
        }

        /// <summary>
        /// Findet Money System Pfade (aus install-dmh.ps1 migriert)
        /// </summary>
        private List<string> FindMoneySystemPaths()
        {
            var roots = new[] 
            { 
                @"C:\ProgramData", 
                @"C:\Program Files", 
                @"C:\Program Files (x86)" 
            };
            
            var foundPaths = new List<string>();
            
            foreach (var root in roots)
            {
                if (!Directory.Exists(root)) continue;
                
                try
                {
                    var directories = Directory.GetDirectories(root, "*", SearchOption.AllDirectories)
                        .Where(dir => 
                            dir.Contains("DeviceManager", StringComparison.OrdinalIgnoreCase) ||
                            dir.Contains("DMH", StringComparison.OrdinalIgnoreCase))
                        .Where(dir =>
                            dir.Contains("MoneySystem", StringComparison.OrdinalIgnoreCase) ||
                            dir.Contains("Geld", StringComparison.OrdinalIgnoreCase) ||
                            dir.Contains("Money", StringComparison.OrdinalIgnoreCase));
                    
                    foundPaths.AddRange(directories);
                }
                catch (Exception ex)
                {
                    _logger.LogDebug(ex, $"Could not scan directory: {root}");
                }
            }
            
            return foundPaths.Distinct().ToList();
        }

        #endregion

        #region Service Info Generation

        /// <summary>
        /// Holt DeviceManager Service als DeviceInfo
        /// </summary>
        private async Task<DeviceInfo> GetDeviceManagerServiceInfoAsync()
        {
            var service = GetDeviceManagerService();
            var health = await TestDeviceManagerHealthAsync();
            
            return new DeviceInfo
            {
                DeviceId = "DeviceManagerService",
                Name = service?.DisplayName ?? "DeviceManager Service (Not Found)",
                Category = "Service",
                Manufacturer = "System",
                Status = service?.Status.ToString() ?? "NotFound",
                Properties = new Dictionary<string, object>
                {
                    ["ServiceName"] = service?.ServiceName ?? "Unknown",
                    ["StartType"] = service?.StartType.ToString() ?? "Unknown",
                    ["CanStop"] = service?.CanStop ?? false,
                    ["CanPauseAndContinue"] = service?.CanPauseAndContinue ?? false,
                    ["Healthy"] = health.Healthy,
                    ["HealthDetails"] = health.Details
                }
            };
        }

        #endregion

        #region Helper Methods

        /// <summary>
        /// Service auf AutoStart setzen (aus Tiptorro.Setup.Common.psm1)
        /// </summary>
        private async Task EnsureServiceAutoStartAsync(string serviceName)
        {
            try
            {
                // Versuche mit .NET Service API
                var service = new ServiceController(serviceName);
                // Leider ist StartType read-only in .NET, also sc.exe verwenden
                
                await RunCommandAsync("sc.exe", $"config {serviceName} start= auto");
                _logger.LogDebug($"Set service {serviceName} to auto start");
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, $"Could not set auto start for service: {serviceName}");
            }
        }

        /// <summary>
        /// Prüft Service Events (Event ID 7036)
        /// </summary>
        private async Task<bool> CheckServiceEventsAsync(string serviceName)
        {
            return await Task.Run(() =>
            {
                try
                {
                    var since = DateTime.Now.AddMinutes(-10);
                    
                    // PowerShell Äquivalent: Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$since; Id=7036}
                    using var eventLog = new EventLog("System");
                    var recentEvents = eventLog.Entries.Cast<EventLogEntry>()
                        .Where(e => e.TimeGenerated >= since)
                        .Where(e => e.InstanceId == 7036)
                        .Where(e => e.Message.Contains(serviceName, StringComparison.OrdinalIgnoreCase));
                    
                    return recentEvents.Any();
                }
                catch
                {
                    return false;
                }
            });
        }

        /// <summary>
        /// Führt System-Befehl aus
        /// </summary>
        private async Task<string> RunCommandAsync(string fileName, string arguments)
        {
            var startInfo = new ProcessStartInfo
            {
                FileName = fileName,
                Arguments = arguments,
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true
            };

            using var process = Process.Start(startInfo);
            var output = await process.StandardOutput.ReadToEndAsync();
            var error = await process.StandardError.ReadToEndAsync();
            
            await process.WaitForExitAsync();
            
            if (process.ExitCode != 0)
                throw new InvalidOperationException($"Command failed: {fileName} {arguments}\nError: {error}");
                
            return output;
        }

        /// <summary>
        /// Berechnet Directory Size
        /// </summary>
        private long CalculateDirectorySize(DirectoryInfo directory)
        {
            try
            {
                return directory.GetFiles("*", SearchOption.AllDirectories)
                    .Sum(file => file.Length);
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// Sicher String-Wert aus WMI-Objekt extrahieren
        /// </summary>
        private string GetStringValue(ManagementObject obj, string propertyName)
        {
            try
            {
                return obj[propertyName]?.ToString();
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Sicher UInt32-Wert aus WMI-Objekt extrahieren
        /// </summary>
        private uint GetUInt32Value(ManagementObject obj, string propertyName)
        {
            try
            {
                return Convert.ToUInt32(obj[propertyName] ?? 0);
            }
            catch
            {
                return 0;
            }
        }

        #endregion
    }
}