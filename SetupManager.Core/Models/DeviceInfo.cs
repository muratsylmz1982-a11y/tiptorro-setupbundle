using System;
using System.Collections.Generic;

namespace SetupManager.Core.Models
{
    /// <summary>
    /// Device Information Model - Hardware-Gerät Datenstruktur
    /// </summary>
    public class DeviceInfo
    {
        /// <summary>
        /// Eindeutige Device ID
        /// </summary>
        public string DeviceId { get; set; } = string.Empty;

        /// <summary>
        /// Display Name des Geräts
        /// </summary>
        public string Name { get; set; } = string.Empty;

        /// <summary>
        /// Device Kategorie (CCTalk, Service, Storage, Network, etc.)
        /// </summary>
        public string Category { get; set; } = string.Empty;

        /// <summary>
        /// Hersteller des Geräts
        /// </summary>
        public string Manufacturer { get; set; } = string.Empty;

        /// <summary>
        /// Aktueller Status (Available, Running, Stopped, Error, etc.)
        /// </summary>
        public string Status { get; set; } = string.Empty;

        /// <summary>
        /// Zusätzliche Device-spezifische Properties
        /// </summary>
        public Dictionary<string, object> Properties { get; set; } = new Dictionary<string, object>();

        /// <summary>
        /// Zeitstempel der letzten Aktualisierung
        /// </summary>
        public DateTime LastUpdated { get; set; } = DateTime.Now;

        /// <summary>
        /// Optional: Device Driver Information
        /// </summary>
        public string DriverVersion { get; set; } = string.Empty;

        /// <summary>
        /// Optional: Device Vendor ID
        /// </summary>
        public string VendorId { get; set; } = string.Empty;

        /// <summary>
        /// Optional: Device Product ID
        /// </summary>
        public string ProductId { get; set; } = string.Empty;

        /// <summary>
        /// Gibt an ob das Device momentan gesund/funktionsfähig ist
        /// </summary>
        public bool IsHealthy => Status.Equals("Available", StringComparison.OrdinalIgnoreCase) ||
                                Status.Equals("Running", StringComparison.OrdinalIgnoreCase) ||
                                Status.Equals("Connected", StringComparison.OrdinalIgnoreCase);

        /// <summary>
        /// Override ToString für Debug/Logging
        /// </summary>
        /// <returns>String Repräsentation</returns>
        public override string ToString()
        {
            return $"{Category}: {Name} ({DeviceId}) - {Status}";
        }

        /// <summary>
        /// Helper: Holt Property Value sicher
        /// </summary>
        /// <typeparam name="T">Type des erwarteten Werts</typeparam>
        /// <param name="propertyName">Property Name</param>
        /// <param name="defaultValue">Default Wert falls nicht vorhanden</param>
        /// <returns>Property Wert oder Default</returns>
        public T GetProperty<T>(string propertyName, T defaultValue = default)
        {
            if (Properties.TryGetValue(propertyName, out var value))
            {
                try
                {
                    if (value is T directValue)
                        return directValue;
                    
                    return (T)Convert.ChangeType(value, typeof(T));
                }
                catch
                {
                    return defaultValue;
                }
            }
            
            return defaultValue;
        }

        /// <summary>
        /// Helper: Setzt Property Value
        /// </summary>
        /// <param name="propertyName">Property Name</param>
        /// <param name="value">Wert</param>
        public void SetProperty(string propertyName, object value)
        {
            Properties[propertyName] = value;
        }
    }
}