using SetupManager.Core.Models;

namespace SetupManager.Core.Interfaces
{
    /// <summary>
    /// Service interface for printer detection, installation, and management
    /// </summary>
    public interface IPrinterService
    {
        /// <summary>
        /// Get all installed printers on the system
        /// </summary>
        Task<IEnumerable<PrinterInfo>> GetInstalledPrintersAsync();

        /// <summary>
        /// Get detailed information about a specific printer
        /// </summary>
        Task<PrinterInfo?> GetPrinterInfoAsync(string printerName);

        /// <summary>
        /// Detect available printer drivers on the system
        /// </summary>
        Task<IEnumerable<PrinterDriverInfo>> GetAvailableDriversAsync();

        /// <summary>
        /// Install a printer with specified driver and connection details
        /// </summary>
        Task<bool> InstallPrinterAsync(string printerName, string driverName, string portName, PrinterConnectionType connectionType);

        /// <summary>
        /// Install printer driver from INF file or driver package
        /// </summary>
        Task<bool> InstallDriverAsync(string driverPath, string driverName);

        /// <summary>
        /// Set printer as default system printer
        /// </summary>
        Task<bool> SetDefaultPrinterAsync(string printerName);

        /// <summary>
        /// Test printer connectivity and print a test page
        /// </summary>
        Task<bool> TestPrinterAsync(string printerName);

        /// <summary>
        /// Get printer status and health information
        /// </summary>
        Task<Dictionary<string, object>> GetPrinterHealthAsync(string printerName);

        /// <summary>
        /// Detect USB/Network printers that are connected but not installed
        /// Specifically looks for: Hwasung HMK072, Star TSP143, Epson TM-T88V, Epson TM-T88IV
        /// </summary>
        Task<IEnumerable<PrinterInfo>> ScanForUninstalledPrintersAsync();

        /// <summary>
        /// Install a specific detected printer (only the one that was found)
        /// </summary>
        Task<bool> InstallDetectedPrinterAsync(PrinterInfo detectedPrinter);

        /// <summary>
        /// Remove/uninstall a printer from the system
        /// </summary>
        Task<bool> RemovePrinterAsync(string printerName);

        /// <summary>
        /// Get print spooler service status
        /// </summary>
        Task<bool> IsSpoolerServiceRunningAsync();

        /// <summary>
        /// Restart print spooler service
        /// </summary>
        Task<bool> RestartSpoolerServiceAsync();
    }

    /// <summary>
    /// Printer connection types
    /// </summary>
    public enum PrinterConnectionType
    {
        Local,
        Network,
        USB,
        Parallel,
        Serial,
        Bluetooth,
        WiFiDirect
    }
}