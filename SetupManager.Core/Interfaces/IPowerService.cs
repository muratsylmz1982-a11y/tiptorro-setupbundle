using SetupManager.Core.Models;

namespace SetupManager.Core.Interfaces
{
    /// <summary>
    /// Interface for power management and kiosk energy optimization
    /// Handles power plans, USB selective suspend, hibernation, and screensaver settings
    /// </summary>
    public interface IPowerService
    {
        /// <summary>
        /// Configures power settings for kiosk operation (high performance, no timeouts)
        /// </summary>
        /// <param name="profile">Setup profile (terminal/kasse)</param>
        /// <returns>Result of power configuration</returns>
        Task<InstallationResult> ConfigurePowerSettingsAsync(SetupProfile profile);

        /// <summary>
        /// Applies high performance power plan (Ultimate Performance preferred)
        /// </summary>
        /// <returns>Result of power plan activation</returns>
        Task<InstallationResult> SetHighPerformancePlanAsync();

        /// <summary>
        /// Disables all power timeouts for AC operation (monitor, disk, standby, hibernate)
        /// </summary>
        /// <returns>Result of timeout configuration</returns>
        Task<InstallationResult> DisablePowerTimeoutsAsync();

        /// <summary>
        /// Disables hibernation completely and removes hiberfil.sys
        /// </summary>
        /// <returns>Result of hibernation disable</returns>
        Task<InstallationResult> DisableHibernationAsync();

        /// <summary>
        /// Disables screensaver for current user
        /// </summary>
        /// <returns>Result of screensaver configuration</returns>
        Task<InstallationResult> DisableScreensaverAsync();

        /// <summary>
        /// Disables USB selective suspend globally (critical for hardware devices)
        /// </summary>
        /// <returns>Result of USB configuration</returns>
        Task<InstallationResult> DisableUsbSelectiveSuspendAsync();

        /// <summary>
        /// Gets current power plan information
        /// </summary>
        /// <returns>Current active power plan details</returns>
        Task<PowerInfo> GetCurrentPowerPlanAsync();

        /// <summary>
        /// Validates current power configuration against kiosk requirements
        /// </summary>
        /// <returns>Validation result with details</returns>
        Task<ValidationResult> ValidatePowerConfigurationAsync();

        /// <summary>
        /// Restores default power settings (useful for testing/development)
        /// </summary>
        /// <returns>Result of power settings restoration</returns>
        Task<InstallationResult> RestoreDefaultPowerSettingsAsync();
    }
}