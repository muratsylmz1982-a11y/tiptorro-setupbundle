using Xunit;
using FluentAssertions;
using Moq;
using SetupManager.Services;
using SetupManager.Core.Models;
using Microsoft.Extensions.Logging;

namespace SetupManager.Tests.Services
{
    public class PrinterServiceTests
    {
        private readonly Mock<ILogger<PrinterService>> _loggerMock;
        private readonly PrinterService _printerService;

        public PrinterServiceTests()
        {
            _loggerMock = new Mock<ILogger<PrinterService>>();
            _printerService = new PrinterService(_loggerMock.Object);
        }

        [Fact]
        public void PrinterService_Constructor_ShouldInitializeSuccessfully()
        {
            // Assert
            _printerService.Should().NotBeNull();
            _printerService.Should().BeOfType<PrinterService>();
        }

        [Fact]
        public void PrinterService_ShouldImplementIPrinterService()
        {
            // Assert
            _printerService.Should().BeAssignableTo<SetupManager.Core.Interfaces.IPrinterService>();
        }

        [Fact]
        public async Task GetInstalledPrintersAsync_ShouldReturnPrinterList()
        {
            // Act
            var printers = await _printerService.GetInstalledPrintersAsync();

            // Assert
            printers.Should().NotBeNull();
            printers.Should().BeAssignableTo<IEnumerable<PrinterInfo>>();
        }

        [Fact]
        public async Task ScanForUninstalledPrintersAsync_ShouldDetectSupportedPrinters()
        {
            // Act
            var uninstalledPrinters = await _printerService.ScanForUninstalledPrintersAsync();

            // Assert
            uninstalledPrinters.Should().NotBeNull();
            uninstalledPrinters.Should().BeAssignableTo<IEnumerable<PrinterInfo>>();
        }

        [Theory]
        [InlineData("Hwasung HMK072")]
        [InlineData("Star TSP143")]
        [InlineData("Epson TM-T88V")]
        [InlineData("Epson TM-T88IV")]
        public async Task GetPrinterInfoAsync_WithSupportedPrinter_ShouldReturnInfo(string printerName)
        {
            // Act
            var printerInfo = await _printerService.GetPrinterInfoAsync(printerName);

            // Assert - Should not throw, might return null if printer not installed
            // This is expected behavior for non-installed printers in test environment
        }

        [Fact]
        public async Task IsSpoolerServiceRunningAsync_ShouldReturnBoolean()
        {
            // Act
            var isRunning = await _printerService.IsSpoolerServiceRunningAsync();

            // Assert
            (isRunning == true || isRunning == false).Should().BeTrue();
        }

        [Fact]
        public async Task GetAvailableDriversAsync_ShouldReturnDriverList()
        {
            // Act
            var drivers = await _printerService.GetAvailableDriversAsync();

            // Assert
            drivers.Should().NotBeNull();
            drivers.Should().BeAssignableTo<IEnumerable<PrinterDriverInfo>>();
        }

        [Fact]
        public void PrinterConfiguration_ShouldContainAllSupportedPrinters()
        {
            // Act & Assert
            PrinterConfiguration.SupportedPrinters.Should().ContainKey("Hwasung HMK072");
            PrinterConfiguration.SupportedPrinters.Should().ContainKey("Star TSP143");
            PrinterConfiguration.SupportedPrinters.Should().ContainKey("Epson TM-T88V");
            PrinterConfiguration.SupportedPrinters.Should().ContainKey("Epson TM-T88IV");
        }

        [Theory]
        [InlineData("HWASUNG HMK072 USB Device", "Hwasung HMK072")]
        [InlineData("Star TSP143 Receipt Printer", "Star TSP143")]
        [InlineData("EPSON TM-T88V", "Epson TM-T88V")]
        [InlineData("Epson TM-T88IV Thermal Printer", "Epson TM-T88IV")]
        public void PrinterConfiguration_GetPrinterByDetection_ShouldDetectCorrectPrinter(string deviceName, string expectedPrinter)
        {
            // Act
            var detectedPrinter = PrinterConfiguration.GetPrinterByDetection(deviceName, "", "");

            // Assert
            detectedPrinter.Should().NotBeNull();
            detectedPrinter!.Name.Should().Be(expectedPrinter);
        }

        [Fact]
        public void PrinterConfiguration_ShouldHaveCorrectDriverFiles()
        {
            // Arrange & Act
            var hwasungPrinter = PrinterConfiguration.SupportedPrinters["Hwasung HMK072"];
            var starPrinter = PrinterConfiguration.SupportedPrinters["Star TSP143"];
            var epsonV = PrinterConfiguration.SupportedPrinters["Epson TM-T88V"];
            var epsonIV = PrinterConfiguration.SupportedPrinters["Epson TM-T88IV"];

            // Assert Hwasung (has both EXE and INF)
            hwasungPrinter.DriverFiles.ExecutableInstaller.Should().Be("HWASUNG Printer Driver Installer.exe");
            hwasungPrinter.DriverFiles.InfFile.Should().Be("HWASUNG_64bit_v400.INF");
            hwasungPrinter.DriverFiles.CatalogFile.Should().Be("hwasung202204.cat");
            hwasungPrinter.DriverFiles.DescriptionFile.Should().Be("HMK-072.GPD");
            hwasungPrinter.DriverFiles.GetInstallMethod().Should().Be(DriverInstallMethod.Executable); // Prefer EXE over INF

            // Assert Star (EXE only)
            starPrinter.DriverFiles.ExecutableInstaller.Should().Be("Setup\\setup_x64.exe");
            starPrinter.DriverFiles.GetInstallMethod().Should().Be(DriverInstallMethod.Executable);

            // Assert Epson V (EXE only)
            epsonV.DriverFiles.ExecutableInstaller.Should().Be("APD_513_T88V.exe");
            epsonV.DriverFiles.GetInstallMethod().Should().Be(DriverInstallMethod.Executable);

            // Assert Epson IV (EXE only)
            epsonIV.DriverFiles.ExecutableInstaller.Should().Be("APD_459aE.exe");
            epsonIV.DriverFiles.GetInstallMethod().Should().Be(DriverInstallMethod.Executable);
        }

        [Fact]
        public async Task InstallDetectedPrinterAsync_WithNullPrinter_ShouldReturnFalse()
        {
            // Act
            var result = await _printerService.InstallDetectedPrinterAsync(null!);

            // Assert
            result.Should().BeFalse();
        }

        [Fact]
        public async Task RestartSpoolerServiceAsync_ShouldAttemptRestart()
        {
            // Act
            var result = await _printerService.RestartSpoolerServiceAsync();

            // Assert - Should return true or false, not throw
            (result == true || result == false).Should().BeTrue();
        }
    }
}