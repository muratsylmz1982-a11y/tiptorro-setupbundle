using SetupManager.Core.Interfaces;

namespace SetupManager.Core.Models
{
    /// <summary>
    /// Model representing printer information and status
    /// </summary>
    public class PrinterInfo
    {
        public string Name { get; set; } = string.Empty;
        public string DriverName { get; set; } = string.Empty;
        public string PortName { get; set; } = string.Empty;
        public PrinterConnectionType ConnectionType { get; set; }
        public bool IsDefault { get; set; }
        public bool IsOnline { get; set; }
        public PrinterStatus Status { get; set; }
        public string? ShareName { get; set; }
        public string? Location { get; set; }
        public string? Comment { get; set; }
        public DateTime? InstallDate { get; set; }

        /// <summary>
        /// Extended properties for additional printer information
        /// </summary>
        public Dictionary<string, object> Properties { get; set; } = new();

        /// <summary>
        /// Health status information
        /// </summary>
        public Dictionary<string, object> Health { get; set; } = new();

        /// <summary>
        /// Print capabilities and features
        /// </summary>
        public PrinterCapabilities Capabilities { get; set; } = new();

        public override string ToString()
        {
            return $"Printer: {Name} | Driver: {DriverName} | Port: {PortName} | Status: {Status} | Default: {IsDefault}";
        }
    }

    /// <summary>
    /// Printer driver information
    /// </summary>
    public class PrinterDriverInfo
    {
        public string Name { get; set; } = string.Empty;
        public string Version { get; set; } = string.Empty;
        public string Architecture { get; set; } = string.Empty;
        public string Provider { get; set; } = string.Empty;
        public DateTime? DriverDate { get; set; }
        public string? InfFile { get; set; }
        public bool IsInbox { get; set; }

        public override string ToString()
        {
            return $"Driver: {Name} v{Version} ({Architecture}) by {Provider}";
        }
    }

    /// <summary>
    /// Printer status enumeration
    /// </summary>
    public enum PrinterStatus
    {
        Unknown,
        Ready,
        Printing,
        Offline,
        Error,
        PaperJam,
        OutOfPaper,
        OutOfToner,
        Busy,
        DoorOpen,
        Warming,
        TonerLow,
        PaperLow
    }

    /// <summary>
    /// Printer capabilities and features
    /// </summary>
    public class PrinterCapabilities
    {
        public bool CanPrintColor { get; set; }
        public bool CanDuplex { get; set; }
        public bool CanCollate { get; set; }
        public bool CanStaple { get; set; }
        public int MaxResolutionDPI { get; set; }
        public List<string> SupportedPaperSizes { get; set; } = new();
        public List<string> SupportedMediaTypes { get; set; } = new();
        public int MaxCopies { get; set; } = 1;

        public override string ToString()
        {
            var features = new List<string>();
            if (CanPrintColor) features.Add("Color");
            if (CanDuplex) features.Add("Duplex");
            if (CanCollate) features.Add("Collate");
            if (CanStaple) features.Add("Staple");
            
            return $"Capabilities: {string.Join(", ", features)} | Max DPI: {MaxResolutionDPI}";
        }
    }
}