using System.Text.Json.Serialization;

namespace SetupManager.Core.Models
{
    /// <summary>
    /// Information about current power plan and settings
    /// </summary>
    public class PowerInfo
    {
        public string PowerPlanId { get; set; } = string.Empty;
        public string PowerPlanName { get; set; } = string.Empty;
        public bool IsHighPerformance { get; set; }
        public bool IsUltimatePerformance { get; set; }
        public bool HibernationEnabled { get; set; }
        public bool ScreensaverActive { get; set; }
        public bool UsbSelectiveSuspendEnabled { get; set; }
        public int MonitorTimeoutAC { get; set; }
        public int DiskTimeoutAC { get; set; }
        public int StandbyTimeoutAC { get; set; }
        public int HibernateTimeoutAC { get; set; }
        public DateTime LastUpdated { get; set; } = DateTime.Now;

        /// <summary>
        /// Checks if current configuration meets kiosk requirements
        /// </summary>
        public bool IsKioskOptimized => 
            (IsHighPerformance || IsUltimatePerformance) &&
            !HibernationEnabled &&
            !ScreensaverActive &&
            !UsbSelectiveSuspendEnabled &&
            MonitorTimeoutAC == 0 &&
            DiskTimeoutAC == 0 &&
            StandbyTimeoutAC == 0 &&
            HibernateTimeoutAC == 0;

        public override string ToString()
        {
            return $"PowerPlan: {PowerPlanName} | Kiosk-Optimized: {IsKioskOptimized} | " +
                   $"Hibernation: {(HibernationEnabled ? "ON" : "OFF")} | " +
                   $"USB-SelectiveSuspend: {(UsbSelectiveSuspendEnabled ? "ON" : "OFF")}";
        }
    }
}