using System.Collections.Generic;
using System.Threading.Tasks;
using SetupManager.Core.Models;

namespace SetupManager.Core.Interfaces
{
    /// <summary>
    /// Interface für DeviceManager Service - Hardware Management & CCTalk Integration
    /// </summary>
    public interface IDeviceManager
    {
        /// <summary>
        /// Scannt alle verfügbaren Hardware-Geräte im System
        /// </summary>
        /// <returns>Liste aller erkannten Devices</returns>
        Task<IEnumerable<DeviceInfo>> GetAvailableDevicesAsync();

        /// <summary>
        /// Prüft ob ein spezifisches Gerät verfügbar ist
        /// </summary>
        /// <param name="deviceId">Eindeutige Device ID</param>
        /// <returns>True wenn Device verfügbar</returns>
        Task<bool> IsDeviceAvailableAsync(string deviceId);

        /// <summary>
        /// Holt detaillierte Informationen zu einem spezifischen Gerät
        /// </summary>
        /// <param name="deviceId">Eindeutige Device ID</param>
        /// <returns>Detaillierte Device-Informationen</returns>
        Task<DeviceInfo> GetDeviceInfoAsync(string deviceId);
    }
}