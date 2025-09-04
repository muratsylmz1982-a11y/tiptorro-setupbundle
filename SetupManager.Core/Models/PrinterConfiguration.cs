namespace SetupManager.Core.Models
{
    /// <summary>
    /// Configuration for supported thermal/POS printers
    /// </summary>
    public static class PrinterConfiguration
    {
        /// <summary>
        /// Supported printer models with their detection patterns and driver info
        /// </summary>
        public static readonly Dictionary<string, PrinterModel> SupportedPrinters = new()
        {
            ["Hwasung HMK072"] = new PrinterModel
            {
                Name = "Hwasung HMK072",
                Manufacturer = "Hwasung",
                Model = "HMK072",
                Type = PrinterType.Thermal,
                DetectionPatterns = new[] { "hwasung", "hmk072", "hmk-072" },
                DriverPath = "Drivers\\Printers\\Hwasung\\HMK072",
                UsbPortPrefix = "USB001",
                DefaultSettings = new PrinterSettings
                {
                    PaperWidth = 80, // mm
                    PrintSpeed = PrintSpeed.Fast,
                    Density = PrintDensity.Medium,
                    CutterEnabled = true
                }
            },
            
            ["Star TSP143"] = new PrinterModel
            {
                Name = "Star TSP143",
                Manufacturer = "Star Micronics", 
                Model = "TSP143",
                Type = PrinterType.Thermal,
                DetectionPatterns = new[] { "star", "tsp143", "tsp-143", "micronics" },
                DriverPath = "Drivers\\Printers\\Star\\TSP143",
                UsbPortPrefix = "USB002",
                DefaultSettings = new PrinterSettings
                {
                    PaperWidth = 80, // mm
                    PrintSpeed = PrintSpeed.Fast,
                    Density = PrintDensity.Medium,
                    CutterEnabled = true
                }
            },
            
            ["Epson TM-T88V"] = new PrinterModel
            {
                Name = "Epson TM-T88V",
                Manufacturer = "Epson",
                Model = "TM-T88V", 
                Type = PrinterType.Thermal,
                DetectionPatterns = new[] { "epson", "tm-t88v", "t88v", "tm t88v" },
                DriverPath = "Drivers\\Printers\\Epson\\TM-T88V",
                UsbPortPrefix = "USB003",
                DefaultSettings = new PrinterSettings
                {
                    PaperWidth = 80, // mm
                    PrintSpeed = PrintSpeed.Medium,
                    Density = PrintDensity.High,
                    CutterEnabled = true
                }
            },
            
            ["Epson TM-T88IV"] = new PrinterModel
            {
                Name = "Epson TM-T88IV",
                Manufacturer = "Epson",
                Model = "TM-T88IV",
                Type = PrinterType.Thermal,
                DetectionPatterns = new[] { "epson", "tm-t88iv", "t88iv", "tm t88iv", "tm-t88-iv" },
                DriverPath = "Drivers\\Printers\\Epson\\TM-T88IV", 
                UsbPortPrefix = "USB004",
                DefaultSettings = new PrinterSettings
                {
                    PaperWidth = 80, // mm
                    PrintSpeed = PrintSpeed.Medium,
                    Density = PrintDensity.High,
                    CutterEnabled = true
                }
            }
        };

        /// <summary>
        /// Get printer model by detection pattern
        /// </summary>
        public static PrinterModel? GetPrinterByDetection(string deviceName, string deviceId, string hardwareId)
        {
            var searchText = $"{deviceName} {deviceId} {hardwareId}".ToLower();
            
            return SupportedPrinters.Values.FirstOrDefault(printer =>
                printer.DetectionPatterns.Any(pattern => searchText.Contains(pattern.ToLower())));
        }
    }

    /// <summary>
    /// Printer model definition
    /// </summary>
    public class PrinterModel
    {
        public string Name { get; set; } = string.Empty;
        public string Manufacturer { get; set; } = string.Empty;
        public string Model { get; set; } = string.Empty;
        public PrinterType Type { get; set; }
        public string[] DetectionPatterns { get; set; } = Array.Empty<string>();
        public string DriverPath { get; set; } = string.Empty;
        public string UsbPortPrefix { get; set; } = string.Empty;
        public DriverFiles DriverFiles { get; set; } = new();
        public PrinterSettings DefaultSettings { get; set; } = new();

        public override string ToString()
        {
            return $"{Manufacturer} {Model} ({Type})";
        }
    }

    /// <summary>
    /// Driver files for a printer model
    /// </summary>
    public class DriverFiles
    {
        public string? ExecutableInstaller { get; set; }
        public string? InfFile { get; set; }
        public string? CatalogFile { get; set; }
        public string? DescriptionFile { get; set; }
        public string? SystemFile { get; set; }

        /// <summary>
        /// Check if driver has executable installer
        /// </summary>
        public bool HasExecutableInstaller => !string.IsNullOrEmpty(ExecutableInstaller);

        /// <summary>
        /// Check if driver has INF-based installation files
        /// </summary>
        public bool HasInfInstaller => !string.IsNullOrEmpty(InfFile);

        /// <summary>
        /// Get the primary installation method
        /// </summary>
        public DriverInstallMethod GetInstallMethod()
        {
            if (HasExecutableInstaller) return DriverInstallMethod.Executable;
            if (HasInfInstaller) return DriverInstallMethod.InfFile;
            return DriverInstallMethod.Unknown;
        }
    }

    /// <summary>
    /// Driver installation methods
    /// </summary>
    public enum DriverInstallMethod
    {
        Unknown,
        Executable,
        InfFile,
        WindowsUpdate
    }

    /// <summary>
    /// Printer settings for thermal/POS printers
    /// </summary>
    public class PrinterSettings
    {
        public int PaperWidth { get; set; } = 80; // mm
        public PrintSpeed PrintSpeed { get; set; } = PrintSpeed.Medium;
        public PrintDensity Density { get; set; } = PrintDensity.Medium;
        public bool CutterEnabled { get; set; } = true;
        public bool CashDrawerEnabled { get; set; } = false;
        public int CashDrawerPin { get; set; } = 2; // Pin 2 or 5
    }

    /// <summary>
    /// Printer types
    /// </summary>
    public enum PrinterType
    {
        Unknown,
        Thermal,
        Impact,
        Inkjet,
        Laser,
        Label
    }

    /// <summary>
    /// Print speed settings
    /// </summary>
    public enum PrintSpeed
    {
        Slow,
        Medium,
        Fast,
        Maximum
    }

    /// <summary>
    /// Print density settings
    /// </summary>
    public enum PrintDensity
    {
        Light,
        Medium,
        High,
        Maximum
    }
}