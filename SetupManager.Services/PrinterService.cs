using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;                    // ← KRITISCH WICHTIG
using System.Linq;
using System.Management;
using System.ServiceProcess;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;

namespace SetupManager.Services
{
    /// <summary>
    /// Service for managing printer detection, installation, and configuration
    /// Migrated from PowerShell printer management scripts with modern .NET implementation
    /// </summary>
    public class PrinterService : IPrinterService
    {
        private readonly ILogger<PrinterService> _logger;

        public PrinterService(ILogger<PrinterService> logger)
        {
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        public async Task<IEnumerable<PrinterInfo>> GetInstalledPrintersAsync()
        {
            _logger.LogInformation("Retrieving installed printers");
            var printers = new List<PrinterInfo>();

            try
            {
                await Task.Run(() =>
                {
                    using var searcher = new ManagementObjectSearcher("SELECT * FROM Win32_Printer");
                    using var collection = searcher.Get();

                    foreach (ManagementObject printer in collection)
                    {
                        var printerInfo = new PrinterInfo
                        {
                            Name = printer["Name"]?.ToString() ?? "Unknown",
                            DriverName = printer["DriverName"]?.ToString() ?? "Unknown",
                            PortName = printer["PortName"]?.ToString() ?? "Unknown",
                            IsDefault = Convert.ToBoolean(printer["Default"]),
                            IsOnline = !Convert.ToBoolean(printer["WorkOffline"]),
                            ShareName = printer["ShareName"]?.ToString(),
                            Location = printer["Location"]?.ToString(),
                            Comment = printer["Comment"]?.ToString(),
                            Status = ParsePrinterStatus(printer["PrinterStatus"])
                        };

                        // Determine connection type based on port name
                        printerInfo.ConnectionType = DetermineConnectionType(printerInfo.PortName);

                        // Add extended properties
                        printerInfo.Properties["DeviceID"] = printer["DeviceID"]?.ToString() ?? "";
                        printerInfo.Properties["PrintJobDataType"] = printer["PrintJobDataType"]?.ToString() ?? "";
                        printerInfo.Properties["ServerName"] = printer["ServerName"]?.ToString() ?? "";
                        printerInfo.Properties["PrinterState"] = printer["PrinterState"]?.ToString() ?? "";

                        // Health information
                        printerInfo.Health["LastError"] = printer["LastErrorCode"]?.ToString() ?? "0";
                        printerInfo.Health["JobCount"] = printer["JobCountSinceLastReset"]?.ToString() ?? "0";
                        printerInfo.Health["PageCount"] = printer["PagesPrinted"]?.ToString() ?? "0";

                        printers.Add(printerInfo);
                    }
                });

                _logger.LogInformation("Found {Count} installed printers", printers.Count);
                return printers;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving installed printers");
                return printers;
            }
        }

        public async Task<PrinterInfo?> GetPrinterInfoAsync(string printerName)
        {
            if (string.IsNullOrWhiteSpace(printerName))
                return null;

            _logger.LogInformation("Getting printer info for: {PrinterName}", printerName);

            try
            {
                var printers = await GetInstalledPrintersAsync();
                return printers.FirstOrDefault(p => 
                    string.Equals(p.Name, printerName, StringComparison.OrdinalIgnoreCase));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting printer info for {PrinterName}", printerName);
                return null;
            }
        }

        public async Task<IEnumerable<PrinterDriverInfo>> GetAvailableDriversAsync()
        {
            _logger.LogInformation("Retrieving available printer drivers");
            var drivers = new List<PrinterDriverInfo>();

            try
            {
                await Task.Run(() =>
                {
                    using var searcher = new ManagementObjectSearcher("SELECT * FROM Win32_PrinterDriver");
                    using var collection = searcher.Get();

                    foreach (ManagementObject driver in collection)
                    {
                        var driverInfo = new PrinterDriverInfo
                        {
                            Name = driver["Name"]?.ToString() ?? "Unknown",
                            Version = driver["Version"]?.ToString() ?? "Unknown",
                            Architecture = DetermineArchitecture(driver["SupportedPlatform"]?.ToString()),
                            Provider = driver["Provider"]?.ToString() ?? "Unknown",
                            InfFile = driver["InfName"]?.ToString()
                        };

                        // Parse driver date if available
                        if (DateTime.TryParse(driver["DriverDate"]?.ToString(), out var driverDate))
                        {
                            driverInfo.DriverDate = driverDate;
                        }

                        drivers.Add(driverInfo);
                    }
                });

                _logger.LogInformation("Found {Count} available printer drivers", drivers.Count);
                return drivers;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving printer drivers");
                return drivers;
            }
        }

        public async Task<bool> InstallPrinterAsync(string printerName, string driverName, string portName, PrinterConnectionType connectionType)
        {
            _logger.LogInformation("Installing printer: {PrinterName} with driver: {DriverName} on port: {PortName}", 
                printerName, driverName, portName);

            try
            {
                return await Task.Run(() =>
                {
                    // Use WMI to create printer instance
                    using var printerClass = new ManagementClass("Win32_Printer");
                    using var printer = printerClass.CreateInstance();
                    
                    if (printer != null)
                    {
                        printer["DeviceID"] = printerName;
                        printer["Name"] = printerName;
                        printer["DriverName"] = driverName;
                        printer["PortName"] = portName;

                        var result = printer.Put();
                        var success = result.Path != null;

                        if (success)
                        {
                            _logger.LogInformation("Successfully installed printer: {PrinterName}", printerName);
                        }
                        else
                        {
                            _logger.LogWarning("Failed to install printer: {PrinterName}", printerName);
                        }

                        return success;
                    }

                    return false;
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error installing printer {PrinterName}", printerName);
                return false;
            }
        }

        public async Task<bool> InstallDriverAsync(string driverPath, string driverName)
        {
            _logger.LogInformation("Installing printer driver: {DriverName} from path: {DriverPath}", driverName, driverPath);

            try
            {
                // This would typically involve calling Windows API or using PnPUtil
                // For now, we'll simulate the operation
                await Task.Delay(100);
                
                _logger.LogInformation("Driver installation attempted for: {DriverName}", driverName);
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error installing driver {DriverName}", driverName);
                return false;
            }
        }

        public async Task<bool> SetDefaultPrinterAsync(string printerName)
        {
            _logger.LogInformation("Setting default printer: {PrinterName}", printerName);

            try
            {
                return await Task.Run(() =>
                {
                    using var searcher = new ManagementObjectSearcher($"SELECT * FROM Win32_Printer WHERE Name = '{printerName}'");
                    using var collection = searcher.Get();

                    foreach (ManagementObject printer in collection)
                    {
                        var result = printer.InvokeMethod("SetDefaultPrinter", null);
                        var success = Convert.ToUInt32(result) == 0;
                        
                        if (success)
                        {
                            _logger.LogInformation("Successfully set default printer: {PrinterName}", printerName);
                        }
                        
                        return success;
                    }

                    return false;
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error setting default printer {PrinterName}", printerName);
                return false;
            }
        }

        public async Task<bool> TestPrinterAsync(string printerName)
        {
            _logger.LogInformation("Testing printer: {PrinterName}", printerName);

            try
            {
                return await Task.Run(() =>
                {
                    using var searcher = new ManagementObjectSearcher($"SELECT * FROM Win32_Printer WHERE Name = '{printerName}'");
                    using var collection = searcher.Get();

                    foreach (ManagementObject printer in collection)
                    {
                        var result = printer.InvokeMethod("PrintTestPage", null);
                        var success = Convert.ToUInt32(result) == 0;
                        
                        if (success)
                        {
                            _logger.LogInformation("Test page sent successfully to: {PrinterName}", printerName);
                        }
                        else
                        {
                            _logger.LogWarning("Failed to send test page to: {PrinterName}", printerName);
                        }
                        
                        return success;
                    }

                    return false;
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error testing printer {PrinterName}", printerName);
                return false;
            }
        }

        public async Task<Dictionary<string, object>> GetPrinterHealthAsync(string printerName)
        {
            _logger.LogInformation("Getting health status for printer: {PrinterName}", printerName);
            var health = new Dictionary<string, object>();

            try
            {
                var printer = await GetPrinterInfoAsync(printerName);
                if (printer != null)
                {
                    health["PrinterName"] = printerName;
                    health["Status"] = printer.Status.ToString();
                    health["IsOnline"] = printer.IsOnline;
                    health["IsDefault"] = printer.IsDefault;
                    health["LastChecked"] = DateTime.Now;
                    
                    // Add health metrics from printer properties
                    foreach (var kvp in printer.Health)
                    {
                        health[kvp.Key] = kvp.Value;
                    }
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error getting printer health for {PrinterName}", printerName);
                health["Error"] = ex.Message;
            }

            return health;
        }

        public async Task<IEnumerable<PrinterInfo>> ScanForUninstalledPrintersAsync()
        {
            _logger.LogInformation("Scanning for uninstalled USB printers (Hwasung, Star, Epson)");
            var uninstalledPrinters = new List<PrinterInfo>();

            try
            {
                await Task.Run(() =>
                {
                    // Scan USB devices for our specific printer models
                    using var searcher = new ManagementObjectSearcher("SELECT * FROM Win32_PnPEntity WHERE ClassGuid='{4d36e979-e325-11ce-bfc1-08002be10318}'");
                    using var collection = searcher.Get();

                    foreach (ManagementObject device in collection)
                    {
                        var deviceName = device["Name"]?.ToString() ?? "";
                        var deviceId = device["DeviceID"]?.ToString() ?? "";
                        var hardwareId = device["HardwareID"]?.ToString() ?? "";

                        // Check for our specific printer models
                        var detectedPrinter = DetectSpecificPrinterModel(deviceName, deviceId, hardwareId);
                        if (detectedPrinter != null)
                        {
                            _logger.LogInformation("Detected USB printer: {PrinterModel} - Device: {DeviceName}", 
                                detectedPrinter.Name, deviceName);
                            uninstalledPrinters.Add(detectedPrinter);
                        }
                    }
                });

                _logger.LogInformation("Found {Count} uninstalled printers", uninstalledPrinters.Count);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error scanning for uninstalled printers");
            }

            return uninstalledPrinters;
        }

        /// <summary>
        /// Detect specific printer models based on USB device information
        /// </summary>
        private PrinterInfo? DetectSpecificPrinterModel(string deviceName, string deviceId, string hardwareId)
        {
            var name = deviceName.ToLower();
            var id = deviceId.ToLower();
            var hwId = hardwareId.ToLower();

            // Hwasung HMK072
            if (name.Contains("hwasung") || name.Contains("hmk072") || 
                id.Contains("hwasung") || hwId.Contains("hmk072"))
            {
                return new PrinterInfo
                {
                    Name = "Hwasung HMK072",
                    DriverName = "Hwasung HMK072 Thermal Printer",
                    ConnectionType = PrinterConnectionType.USB,
                    Properties = { ["DriverPath"] = "Drivers\\Printers\\Hwasung\\HMK072", ["Model"] = "HMK072" }
                };
            }

            // Star TSP143
            if (name.Contains("star") || name.Contains("tsp143") || name.Contains("tsp-143") ||
                id.Contains("star") || hwId.Contains("tsp143"))
            {
                return new PrinterInfo
                {
                    Name = "Star TSP143",
                    DriverName = "Star TSP143 Thermal Printer",
                    ConnectionType = PrinterConnectionType.USB,
                    Properties = { ["DriverPath"] = "Drivers\\Printers\\Star\\TSP143", ["Model"] = "TSP143" }
                };
            }

            // Epson TM-T88V
            if (name.Contains("epson") && (name.Contains("tm-t88v") || name.Contains("t88v")) ||
                id.Contains("epson") && id.Contains("t88v"))
            {
                return new PrinterInfo
                {
                    Name = "Epson TM-T88V",
                    DriverName = "Epson TM-T88V Thermal Printer",
                    ConnectionType = PrinterConnectionType.USB,
                    Properties = { ["DriverPath"] = "Drivers\\Printers\\Epson\\TM-T88V", ["Model"] = "TM-T88V" }
                };
            }

            // Epson TM-T88IV
            if (name.Contains("epson") && (name.Contains("tm-t88iv") || name.Contains("t88iv")) ||
                id.Contains("epson") && id.Contains("t88iv"))
            {
                return new PrinterInfo
                {
                    Name = "Epson TM-T88IV",
                    DriverName = "Epson TM-T88IV Thermal Printer", 
                    ConnectionType = PrinterConnectionType.USB,
                    Properties = { ["DriverPath"] = "Drivers\\Printers\\Epson\\TM-T88IV", ["Model"] = "TM-T88IV" }
                };
            }

            return null; // Unknown/unsupported printer
        }

        /// <summary>
        /// Install specific detected printer with its driver
        /// </summary>
        public async Task<bool> InstallDetectedPrinterAsync(PrinterInfo detectedPrinter)
        {
            if (detectedPrinter == null)
            {
                _logger.LogError("Cannot install null printer");
                return false;
            }

            _logger.LogInformation("Installing detected printer: {PrinterName}", detectedPrinter.Name);

            try
            {
                var driverPath = detectedPrinter.Properties.GetValueOrDefault("DriverPath")?.ToString();
                if (string.IsNullOrEmpty(driverPath))
                {
                    _logger.LogError("No driver path specified for printer: {PrinterName}", detectedPrinter.Name);
                    return false;
                }

                // Install driver first
                var driverInstalled = await InstallDriverFromPathAsync(driverPath, detectedPrinter.Name);
                if (!driverInstalled)
                {
                    _logger.LogError("Failed to install driver for: {PrinterName}", detectedPrinter.Name);
                    return false;
                }

                // Wait a bit for driver to be available
                await Task.Delay(2000);

                // Create appropriate USB port name
                var portName = GenerateUsbPortName(detectedPrinter.Name);

                // Install printer
                var printerInstalled = await InstallPrinterAsync(
                    detectedPrinter.Name, 
                    detectedPrinter.DriverName, 
                    portName, 
                    PrinterConnectionType.USB);

                if (printerInstalled)
                {
                    _logger.LogInformation("Successfully installed printer: {PrinterName}", detectedPrinter.Name);
                    
                    // Set as default (only one printer should be detected at a time)
                    await SetDefaultPrinterAsync(detectedPrinter.Name);
                    
                    // Test printer if possible
                    _logger.LogInformation("Testing printer installation...");
                    await TestPrinterAsync(detectedPrinter.Name);
                }

                return printerInstalled;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error installing detected printer: {PrinterName}", detectedPrinter.Name);
                return false;
            }
        }

        private async Task<bool> InstallDriverFromPathAsync(string driverPath, string printerName)
        {
            try
            {
                var fullDriverPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, driverPath);
                var infFile = Directory.GetFiles(fullDriverPath, "*.inf").FirstOrDefault();

                if (string.IsNullOrEmpty(infFile))
                {
                    _logger.LogError("No INF file found in driver path: {DriverPath}", fullDriverPath);
                    return false;
                }

                _logger.LogInformation("Installing driver from INF: {InfFile}", infFile);
                
                // Use PnPUtil to install driver
                var process = new System.Diagnostics.Process
                {
                    StartInfo = new System.Diagnostics.ProcessStartInfo
                    {
                        FileName = "pnputil.exe",
                        Arguments = $"/add-driver \"{infFile}\" /install",
                        UseShellExecute = false,
                        RedirectStandardOutput = true,
                        RedirectStandardError = true,
                        CreateNoWindow = true
                    }
                };

                process.Start();
                await process.WaitForExitAsync();

                var success = process.ExitCode == 0;
                if (success)
                {
                    _logger.LogInformation("Driver installed successfully for: {PrinterName}", printerName);
                }
                else
                {
                    var error = await process.StandardError.ReadToEndAsync();
                    _logger.LogError("Driver installation failed: {Error}", error);
                }

                return success;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error installing driver from path: {DriverPath}", driverPath);
                return false;
            }
        }

        private static string GenerateUsbPortName(string printerName)
        {
            return printerName switch
            {
                "Hwasung HMK072" => "USB001",
                "Star TSP143" => "USB002", 
                "Epson TM-T88V" => "USB003",
                "Epson TM-T88IV" => "USB004",
                _ => "USB001"
            };
        }

        public async Task<bool> RemovePrinterAsync(string printerName)
        {
            _logger.LogInformation("Removing printer: {PrinterName}", printerName);

            try
            {
                return await Task.Run(() =>
                {
                    using var searcher = new ManagementObjectSearcher($"SELECT * FROM Win32_Printer WHERE Name = '{printerName}'");
                    using var collection = searcher.Get();

                    foreach (ManagementObject printer in collection)
                    {
                        printer.Delete();
                        _logger.LogInformation("Successfully removed printer: {PrinterName}", printerName);
                        return true;
                    }

                    return false;
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error removing printer {PrinterName}", printerName);
                return false;
            }
        }

        public async Task<bool> IsSpoolerServiceRunningAsync()
        {
            try
            {
                return await Task.Run(() =>
                {
                    using var spoolerService = new ServiceController("Spooler");
                    return spoolerService.Status == ServiceControllerStatus.Running;
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error checking spooler service status");
                return false;
            }
        }

        public async Task<bool> RestartSpoolerServiceAsync()
        {
            _logger.LogInformation("Restarting print spooler service");

            try
            {
                return await Task.Run(() =>
                {
                    using var spoolerService = new ServiceController("Spooler");
                    
                    if (spoolerService.Status == ServiceControllerStatus.Running)
                    {
                        spoolerService.Stop();
                        spoolerService.WaitForStatus(ServiceControllerStatus.Stopped, TimeSpan.FromSeconds(30));
                    }

                    spoolerService.Start();
                    spoolerService.WaitForStatus(ServiceControllerStatus.Running, TimeSpan.FromSeconds(30));

                    var success = spoolerService.Status == ServiceControllerStatus.Running;
                    if (success)
                    {
                        _logger.LogInformation("Print spooler service restarted successfully");
                    }

                    return success;
                });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error restarting spooler service");
                return false;
            }
        }

        private static PrinterStatus ParsePrinterStatus(object? status)
        {
            if (status == null) return PrinterStatus.Unknown;

            return Convert.ToUInt32(status) switch
            {
                1 => PrinterStatus.Ready,
                2 => PrinterStatus.Error,
                3 => PrinterStatus.Offline,
                4 => PrinterStatus.PaperJam,
                5 => PrinterStatus.OutOfPaper,
                6 => PrinterStatus.OutOfToner,
                _ => PrinterStatus.Unknown
            };
        }

        private static PrinterConnectionType DetermineConnectionType(string portName)
        {
            if (string.IsNullOrWhiteSpace(portName))
                return PrinterConnectionType.Local;

            return portName.ToUpper() switch
            {
                var p when p.StartsWith("USB") => PrinterConnectionType.USB,
                var p when p.StartsWith("LPT") => PrinterConnectionType.Parallel,
                var p when p.StartsWith("COM") => PrinterConnectionType.Serial,
                var p when p.Contains("IP_") => PrinterConnectionType.Network,
                var p when p.Contains("WSD") => PrinterConnectionType.WiFiDirect,
                _ => PrinterConnectionType.Local
            };
        }

        private static string DetermineArchitecture(string? platform)
        {
            if (string.IsNullOrWhiteSpace(platform))
                return "Unknown";

            return platform.ToLower() switch
            {
                var p when p.Contains("x64") => "x64",
                var p when p.Contains("x86") => "x86",
                var p when p.Contains("arm") => "ARM",
                _ => "Unknown"
            };
        }
    }
}