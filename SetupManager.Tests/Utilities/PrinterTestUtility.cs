using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;
using SetupManager.Services;

namespace SetupManager.Tests.Utilities
{
    /// <summary>
    /// Test utility for manual printer service testing
    /// </summary>
    public class PrinterTestUtility
    {
        private readonly IPrinterService _printerService;
        private readonly ILogger<PrinterTestUtility> _logger;

        public PrinterTestUtility(ILogger<PrinterTestUtility> logger)
        {
            _logger = logger;
            
            // Create printer service with console logger for testing
            var printerLogger = LoggerFactory.Create(builder => 
                builder.AddConsole().SetMinimumLevel(LogLevel.Information))
                .CreateLogger<PrinterService>();
                
            _printerService = new PrinterService(printerLogger);
        }

        /// <summary>
        /// Run complete printer detection and installation test
        /// </summary>
        public async Task<bool> RunCompleteTestAsync()
        {
            _logger.LogInformation("=== STARTING COMPLETE PRINTER TEST ===");

            try
            {
                // Step 1: Check spooler service
                _logger.LogInformation("Step 1: Checking Print Spooler service...");
                var spoolerRunning = await _printerService.IsSpoolerServiceRunningAsync();
                _logger.LogInformation("Print Spooler running: {SpoolerStatus}", spoolerRunning ? "✅ YES" : "❌ NO");

                if (!spoolerRunning)
                {
                    _logger.LogWarning("Attempting to restart Print Spooler...");
                    var restarted = await _printerService.RestartSpoolerServiceAsync();
                    _logger.LogInformation("Spooler restart: {RestartStatus}", restarted ? "✅ SUCCESS" : "❌ FAILED");
                }

                // Step 2: List currently installed printers
                _logger.LogInformation("\nStep 2: Listing currently installed printers...");
                var installedPrinters = await _printerService.GetInstalledPrintersAsync();
                _logger.LogInformation("Found {Count} installed printers:", installedPrinters.Count());
                
                foreach (var printer in installedPrinters)
                {
                    _logger.LogInformation("  📄 {PrinterInfo}", printer.ToString());
                }

                // Step 3: Scan for uninstalled printers
                _logger.LogInformation("\nStep 3: Scanning for uninstalled USB printers...");
                var uninstalledPrinters = await _printerService.ScanForUninstalledPrintersAsync();
                _logger.LogInformation("Found {Count} uninstalled printers:", uninstalledPrinters.Count());

                if (!uninstalledPrinters.Any())
                {
                    _logger.LogInformation("No supported printers detected. Connect one of:");
                    _logger.LogInformation("  - Hwasung HMK072");
                    _logger.LogInformation("  - Star TSP143");
                    _logger.LogInformation("  - Epson TM-T88V");
                    _logger.LogInformation("  - Epson TM-T88IV");
                    return true; // Not a failure - just no printers connected
                }

                // Step 4: Install detected printer (only first one found)
                var printerToInstall = uninstalledPrinters.First();
                _logger.LogInformation("\nStep 4: Installing detected printer: {PrinterName}", printerToInstall.Name);
                
                var installResult = await _printerService.InstallDetectedPrinterAsync(printerToInstall);
                _logger.LogInformation("Installation result: {InstallStatus}", installResult ? "✅ SUCCESS" : "❌ FAILED");

                if (!installResult)
                {
                    _logger.LogError("Printer installation failed!");
                    return false;
                }

                // Step 5: Verify installation
                _logger.LogInformation("\nStep 5: Verifying printer installation...");
                await Task.Delay(3000); // Wait for system to register printer

                var verifyPrinter = await _printerService.GetPrinterInfoAsync(printerToInstall.Name);
                if (verifyPrinter != null)
                {
                    _logger.LogInformation("✅ Printer successfully installed and verified!");
                    _logger.LogInformation("Printer details: {PrinterDetails}", verifyPrinter.ToString());

                    // Step 6: Print test page
                    _logger.LogInformation("\nStep 6: Attempting to print test page...");
                    var testResult = await _printerService.TestPrinterAsync(printerToInstall.Name);
                    _logger.LogInformation("Test page result: {TestStatus}", testResult ? "✅ SUCCESS" : "⚠️ ATTEMPTED");
                }
                else
                {
                    _logger.LogError("❌ Printer installation verification failed!");
                    return false;
                }

                _logger.LogInformation("\n=== PRINTER TEST COMPLETED SUCCESSFULLY ===");
                return true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error during printer test execution");
                return false;
            }
        }

        /// <summary>
        /// Test printer configuration accuracy
        /// </summary>
        public void TestPrinterConfiguration()
        {
            _logger.LogInformation("=== TESTING PRINTER CONFIGURATION ===");

            foreach (var (printerName, printerModel) in PrinterConfiguration.SupportedPrinters)
            {
                _logger.LogInformation("\n📄 {PrinterName}:", printerName);
                _logger.LogInformation("  Manufacturer: {Manufacturer}", printerModel.Manufacturer);
                _logger.LogInformation("  Model: {Model}", printerModel.Model);
                _logger.LogInformation("  Type: {Type}", printerModel.Type);
                _logger.LogInformation("  Driver Path: {DriverPath}", printerModel.DriverPath);
                _logger.LogInformation("  Install Method: {InstallMethod}", printerModel.DriverFiles.GetInstallMethod());
                
                if (printerModel.DriverFiles.HasExecutableInstaller)
                {
                    _logger.LogInformation("  Executable: {Executable}", printerModel.DriverFiles.ExecutableInstaller);
                }
                
                if (printerModel.DriverFiles.HasInfInstaller)
                {
                    _logger.LogInformation("  INF File: {InfFile}", printerModel.DriverFiles.InfFile);
                }

                _logger.LogInformation("  Detection Patterns: {Patterns}", string.Join(", ", printerModel.DetectionPatterns));
            }

            _logger.LogInformation("\n=== CONFIGURATION TEST COMPLETED ===");
        }

        /// <summary>
        /// Test printer detection with sample device names
        /// </summary>
        public void TestPrinterDetection()
        {
            _logger.LogInformation("=== TESTING PRINTER DETECTION LOGIC ===");

            var testDevices = new[]
            {
                ("HWASUNG HMK072 USB Printer", "USB\\VID_1234&PID_5678", "hwasung_hmk072"),
                ("Star TSP143 Receipt Printer", "USB\\VID_0519&PID_0001", "star_tsp143"),
                ("EPSON TM-T88V", "USB\\VID_04B8&PID_0202", "epson_t88v"),
                ("Epson TM-T88IV Thermal Printer", "USB\\VID_04B8&PID_0199", "epson_t88iv"),
                ("Unknown USB Device", "USB\\VID_9999&PID_9999", "unknown_device")
            };

            foreach (var (deviceName, deviceId, hardwareId) in testDevices)
            {
                var detected = PrinterConfiguration.GetPrinterByDetection(deviceName, deviceId, hardwareId);
                
                if (detected != null)
                {
                    _logger.LogInformation("✅ '{DeviceName}' -> {DetectedPrinter}", deviceName, detected.Name);
                }
                else
                {
                    _logger.LogInformation("❌ '{DeviceName}' -> Not detected", deviceName);
                }
            }

            _logger.LogInformation("\n=== DETECTION TEST COMPLETED ===");
        }
    }

    /// <summary>
    /// Console application entry point for manual testing
    /// </summary>
    public class Program
    {
        public static async Task Main(string[] args)
        {
            using var loggerFactory = LoggerFactory.Create(builder =>
                builder.AddConsole().SetMinimumLevel(LogLevel.Information));

            var logger = loggerFactory.CreateLogger<PrinterTestUtility>();
            var testUtility = new PrinterTestUtility(logger);

            Console.WriteLine("=== PRINTERSERVICE TEST UTILITY ===");
            Console.WriteLine("1. Configuration Test");
            Console.WriteLine("2. Detection Logic Test");
            Console.WriteLine("3. Complete Integration Test");
            Console.WriteLine("4. All Tests");
            Console.Write("Select test (1-4): ");

            var choice = Console.ReadLine();

            switch (choice)
            {
                case "1":
                    testUtility.TestPrinterConfiguration();
                    break;
                case "2":
                    testUtility.TestPrinterDetection();
                    break;
                case "3":
                    var success = await testUtility.RunCompleteTestAsync();
                    Console.WriteLine($"Complete test result: {(success ? "SUCCESS" : "FAILED")}");
                    break;
                case "4":
                    testUtility.TestPrinterConfiguration();
                    testUtility.TestPrinterDetection();
                    var allSuccess = await testUtility.RunCompleteTestAsync();
                    Console.WriteLine($"All tests result: {(allSuccess ? "SUCCESS" : "FAILED")}");
                    break;
                default:
                    Console.WriteLine("Invalid choice. Exiting.");
                    break;
            }

            Console.WriteLine("\nPress any key to exit...");
            Console.ReadKey();
        }
    }
}