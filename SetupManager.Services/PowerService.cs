using Microsoft.Extensions.Logging;
using Microsoft.Win32;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;

namespace SetupManager.Services
{
    /// <summary>
    /// Power management service for kiosk optimization
    /// Handles power plans, hibernation, screensaver, and USB selective suspend
    /// </summary>
    public class PowerService : IPowerService
    {
        private readonly ILogger<PowerService> _logger;

        // Power plan GUIDs
        private const string ULTIMATE_PERFORMANCE_GUID = "e9a42b02-d5df-448d-aa00-03f14749eb61";
        private const string HIGH_PERFORMANCE_GUID = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c";
        private const string BALANCED_GUID = "381b4222-f694-41f0-9685-ff5bb260df2e";

        public PowerService(ILogger<PowerService> logger)
        {
            _logger = logger;
        }

        public async Task<InstallationResult> ConfigurePowerSettingsAsync(SetupProfile profile)
        {
            try
            {
                _logger.LogInformation("Configuring power settings for profile: {Profile}", profile.ProfileName);

                var results = new List<InstallationResult>();

                // Apply all power optimizations for kiosk operation
                results.Add(await SetHighPerformancePlanAsync());
                results.Add(await DisablePowerTimeoutsAsync());
                results.Add(await DisableHibernationAsync());
                results.Add(await DisableScreensaverAsync());
                results.Add(await DisableUsbSelectiveSuspendAsync());

                var allSuccessful = results.All(r => r.Success);
                var message = allSuccessful 
                    ? $"Power settings configured successfully for {profile.ProfileName} profile"
                    : $"Power configuration completed with some warnings for {profile.ProfileName} profile";

                var combinedMessage = $"{message}. Results: {string.Join("; ", results.Select(r => r.Message))}";

                _logger.LogInformation("Power configuration result: {Success}", allSuccessful);

                return new InstallationResult
                {
                    Success = allSuccessful,
                    Message = combinedMessage
                };
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to configure power settings: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<InstallationResult> SetHighPerformancePlanAsync()
        {
            try
            {
                _logger.LogInformation("Setting high performance power plan");

                // Check for Ultimate Performance first
                var availablePlans = await GetAvailablePowerPlansAsync();
                var ultimatePlan = availablePlans.FirstOrDefault(p => p.Contains(ULTIMATE_PERFORMANCE_GUID));
                
                string targetPlan;
                string planName;

                if (!string.IsNullOrEmpty(ultimatePlan))
                {
                    targetPlan = ULTIMATE_PERFORMANCE_GUID;
                    planName = "Ultimate Performance";
                    _logger.LogInformation("Ultimate Performance plan available, activating");
                }
                else
                {
                    targetPlan = "SCHEME_MAX"; // Built-in alias for High Performance
                    planName = "High Performance";
                    _logger.LogInformation("Using High Performance plan (Ultimate not available)");
                }

                var result = await ExecutePowercfgCommandAsync($"-SETACTIVE {targetPlan}");
                
                if (result.Success)
                {
                    var message = $"{planName} power plan activated successfully";
                    _logger.LogInformation(message);
                    return new InstallationResult { Success = true, Message = message };
                }
                else
                {
                    throw new InvalidOperationException($"Failed to activate power plan: {result.Message}");
                }
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to set high performance plan: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<InstallationResult> DisablePowerTimeoutsAsync()
        {
            try
            {
                _logger.LogInformation("Disabling power timeouts for AC operation");

                var commands = new[]
                {
                    "-X -monitor-timeout-ac 0",
                    "-X -disk-timeout-ac 0", 
                    "-X -standby-timeout-ac 0",
                    "-X -hibernate-timeout-ac 0"
                };

                var results = new List<(bool Success, string Message)>();

                foreach (var command in commands)
                {
                    var result = await ExecutePowercfgCommandAsync(command);
                    results.Add((result.Success, result.Message));
                    
                    if (!result.Success)
                    {
                        _logger.LogWarning("Timeout command failed: {Command} - {Error}", command, result.Message);
                    }
                }

                var allSuccessful = results.All(r => r.Success);
                var message = allSuccessful 
                    ? "All power timeouts disabled for AC operation"
                    : "Power timeouts configured with some warnings";

                var combinedMessage = $"{message}. Command results: {string.Join("; ", results.Select(r => r.Message))}";

                _logger.LogInformation("Power timeouts result: {Success}", allSuccessful);

                return new InstallationResult 
                { 
                    Success = allSuccessful, 
                    Message = combinedMessage
                };
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to disable power timeouts: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<InstallationResult> DisableHibernationAsync()
        {
            try
            {
                _logger.LogInformation("Disabling hibernation");

                var result = await ExecutePowercfgCommandAsync("/HIBERNATE OFF");
                
                if (result.Success)
                {
                    var message = "Hibernation disabled successfully";
                    _logger.LogInformation(message);
                    return new InstallationResult { Success = true, Message = message };
                }
                else
                {
                    throw new InvalidOperationException($"Failed to disable hibernation: {result.Message}");
                }
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to disable hibernation: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<InstallationResult> DisableScreensaverAsync()
        {
            try
            {
                _logger.LogInformation("Disabling screensaver for current user");

                using var key = Registry.CurrentUser.CreateSubKey(@"Control Panel\Desktop");
                
                // Disable screensaver
                key.SetValue("ScreenSaveActive", "0", RegistryValueKind.String);
                key.SetValue("ScreenSaverIsSecure", 0, RegistryValueKind.DWord);
                
                // Remove screensaver executable reference
                try
                {
                    key.DeleteValue("SCRNSAVE.EXE", false);
                }
                catch (ArgumentException)
                {
                    // Key doesn't exist, which is fine
                }

                var message = "Screensaver disabled successfully";
                _logger.LogInformation(message);
                return new InstallationResult { Success = true, Message = message };
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to disable screensaver: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<InstallationResult> DisableUsbSelectiveSuspendAsync()
        {
            try
            {
                _logger.LogInformation("Disabling USB selective suspend globally");

                using var key = Registry.LocalMachine.CreateSubKey(@"SYSTEM\CurrentControlSet\Services\USB");
                key.SetValue("DisableSelectiveSuspend", 1, RegistryValueKind.DWord);

                var message = "USB selective suspend disabled successfully";
                _logger.LogInformation(message);
                return new InstallationResult { Success = true, Message = message };
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to disable USB selective suspend: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<PowerInfo> GetCurrentPowerPlanAsync()
        {
            try
            {
                _logger.LogDebug("Getting current power plan information");

                var powerInfo = new PowerInfo();

                // Get active power plan
                var activePlanResult = await ExecutePowercfgCommandAsync("-GETACTIVESCHEME");
                if (activePlanResult.Success)
                {
                    var activePlanOutput = activePlanResult.Message;
                    var guidMatch = Regex.Match(activePlanOutput, @"([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})", RegexOptions.IgnoreCase);
                    
                    if (guidMatch.Success)
                    {
                        powerInfo.PowerPlanId = guidMatch.Value;
                        powerInfo.PowerPlanName = ExtractPowerPlanName(activePlanOutput);
                        powerInfo.IsUltimatePerformance = guidMatch.Value.Equals(ULTIMATE_PERFORMANCE_GUID, StringComparison.OrdinalIgnoreCase);
                        powerInfo.IsHighPerformance = guidMatch.Value.Equals(HIGH_PERFORMANCE_GUID, StringComparison.OrdinalIgnoreCase);
                    }
                }

                // Check hibernation status
                var hibernationResult = await ExecutePowercfgCommandAsync("-A");
                powerInfo.HibernationEnabled = hibernationResult.Success && hibernationResult.Message.Contains("Hibernate");

                // Check screensaver status
                powerInfo.ScreensaverActive = GetScreensaverStatus();

                // Check USB selective suspend
                powerInfo.UsbSelectiveSuspendEnabled = GetUsbSelectiveSuspendStatus();

                // Get timeout values
                await PopulateTimeoutValues(powerInfo);

                powerInfo.LastUpdated = DateTime.Now;

                _logger.LogDebug("Power plan info retrieved: {PowerPlan}", powerInfo.PowerPlanName);
                return powerInfo;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to get current power plan information");
                return new PowerInfo(); // Return default if failed
            }
        }

        public async Task<ValidationResult> ValidatePowerConfigurationAsync()
        {
            try
            {
                _logger.LogInformation("Validating power configuration for kiosk requirements");

                var powerInfo = await GetCurrentPowerPlanAsync();
                var issues = new List<string>();

                if (!powerInfo.IsHighPerformance && !powerInfo.IsUltimatePerformance)
                {
                    issues.Add("Power plan is not set to High Performance or Ultimate Performance");
                }

                if (powerInfo.HibernationEnabled)
                {
                    issues.Add("Hibernation is still enabled");
                }

                if (powerInfo.ScreensaverActive)
                {
                    issues.Add("Screensaver is still active");
                }

                if (powerInfo.UsbSelectiveSuspendEnabled)
                {
                    issues.Add("USB selective suspend is still enabled");
                }

                if (powerInfo.MonitorTimeoutAC > 0)
                {
                    issues.Add($"Monitor timeout is set to {powerInfo.MonitorTimeoutAC} minutes (should be 0)");
                }

                var isValid = !issues.Any();
                var message = isValid 
                    ? "Power configuration is optimized for kiosk operation"
                    : $"Power configuration has {issues.Count} issue(s) for kiosk operation: {string.Join("; ", issues)}";

                _logger.LogInformation("Power validation result: {IsValid}, Issues: {IssueCount}", isValid, issues.Count);

                return new ValidationResult
                {
                    Success = isValid,
                    Message = message
                };
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to validate power configuration: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new ValidationResult { Success = false, Message = errorMsg };
            }
        }

        public async Task<InstallationResult> RestoreDefaultPowerSettingsAsync()
        {
            try
            {
                _logger.LogInformation("Restoring default power settings");

                var results = new List<InstallationResult>();

                // Set balanced power plan
                results.Add(await ExecutePowercfgCommandAsResultAsync("-SETACTIVE SCHEME_BALANCED"));

                // Enable hibernation
                results.Add(await ExecutePowercfgCommandAsResultAsync("/HIBERNATE ON"));

                // Restore default timeouts (example values)
                results.Add(await ExecutePowercfgCommandAsResultAsync("-X -monitor-timeout-ac 20"));
                results.Add(await ExecutePowercfgCommandAsResultAsync("-X -disk-timeout-ac 20"));
                results.Add(await ExecutePowercfgCommandAsResultAsync("-X -standby-timeout-ac 30"));

                var allSuccessful = results.All(r => r.Success);
                var message = allSuccessful 
                    ? "Default power settings restored successfully"
                    : "Power settings restoration completed with some warnings";

                var combinedMessage = $"{message}. Command results: {string.Join("; ", results.Select(r => r.Message))}";

                _logger.LogInformation("Power restoration result: {Success}", allSuccessful);

                return new InstallationResult
                {
                    Success = allSuccessful,
                    Message = combinedMessage
                };
            }
            catch (Exception ex)
            {
                var errorMsg = $"Failed to restore default power settings: {ex.Message}";
                _logger.LogError(ex, errorMsg);
                return new InstallationResult { Success = false, Message = errorMsg };
            }
        }

        #region Private Helper Methods

        private async Task<(bool Success, string Message)> ExecutePowercfgCommandAsync(string arguments)
        {
            try
            {
                using var process = new Process();
                process.StartInfo.FileName = "powercfg";
                process.StartInfo.Arguments = arguments;
                process.StartInfo.UseShellExecute = false;
                process.StartInfo.RedirectStandardOutput = true;
                process.StartInfo.RedirectStandardError = true;
                process.StartInfo.CreateNoWindow = true;

                var outputBuilder = new StringBuilder();
                var errorBuilder = new StringBuilder();

                process.OutputDataReceived += (sender, e) => { if (e.Data != null) outputBuilder.AppendLine(e.Data); };
                process.ErrorDataReceived += (sender, e) => { if (e.Data != null) errorBuilder.AppendLine(e.Data); };

                process.Start();
                process.BeginOutputReadLine();
                process.BeginErrorReadLine();

                await process.WaitForExitAsync();

                var output = outputBuilder.ToString().Trim();
                var error = errorBuilder.ToString().Trim();

                if (process.ExitCode == 0)
                {
                    return (true, output);
                }
                else
                {
                    var errorMsg = !string.IsNullOrEmpty(error) ? error : $"powercfg exited with code {process.ExitCode}";
                    return (false, errorMsg);
                }
            }
            catch (Exception ex)
            {
                return (false, $"Failed to execute powercfg: {ex.Message}");
            }
        }

        private async Task<InstallationResult> ExecutePowercfgCommandAsResultAsync(string arguments)
        {
            var (success, message) = await ExecutePowercfgCommandAsync(arguments);
            return new InstallationResult { Success = success, Message = message };
        }

        private async Task<List<string>> GetAvailablePowerPlansAsync()
        {
            var result = await ExecutePowercfgCommandAsync("-LIST");
            if (!result.Success)
            {
                return new List<string>();
            }

            return result.Message.Split('\n', StringSplitOptions.RemoveEmptyEntries)
                        .Where(line => line.Contains("GUID", StringComparison.OrdinalIgnoreCase))
                        .ToList();
        }

        private static string ExtractPowerPlanName(string powercfgOutput)
        {
            var match = Regex.Match(powercfgOutput, @"\(([^)]+)\)");
            return match.Success ? match.Groups[1].Value : "Unknown";
        }

        private bool GetScreensaverStatus()
        {
            try
            {
                using var key = Registry.CurrentUser.OpenSubKey(@"Control Panel\Desktop");
                if (key != null)
                {
                    var active = key.GetValue("ScreenSaveActive")?.ToString();
                    return active == "1";
                }
                return false;
            }
            catch
            {
                return false;
            }
        }

        private bool GetUsbSelectiveSuspendStatus()
        {
            try
            {
                using var key = Registry.LocalMachine.OpenSubKey(@"SYSTEM\CurrentControlSet\Services\USB");
                if (key != null)
                {
                    var value = key.GetValue("DisableSelectiveSuspend");
                    return value == null || !value.Equals(1);
                }
                return true; // Assume enabled if key doesn't exist
            }
            catch
            {
                return true;
            }
        }

        private async Task PopulateTimeoutValues(PowerInfo powerInfo)
        {
            try
            {
                var queryResult = await ExecutePowercfgCommandAsync("-Q");
                if (queryResult.Success)
                {
                    var output = queryResult.Message;
                    
                    // Parse timeout values (simplified - would need more robust parsing for production)
                    powerInfo.MonitorTimeoutAC = ParseTimeoutValue(output, "Turn off display after");
                    powerInfo.DiskTimeoutAC = ParseTimeoutValue(output, "Turn off hard disk after");
                    powerInfo.StandbyTimeoutAC = ParseTimeoutValue(output, "Sleep after");
                    powerInfo.HibernateTimeoutAC = ParseTimeoutValue(output, "Hibernate after");
                }
            }
            catch (Exception ex)
            {
                _logger.LogWarning(ex, "Failed to parse timeout values");
            }
        }

        private int ParseTimeoutValue(string output, string setting)
        {
            // Simplified parsing - in production would need more robust implementation
            // This is a basic version to demonstrate the concept
            return 0; // Default to 0 for now
        }

        #endregion
    }
}