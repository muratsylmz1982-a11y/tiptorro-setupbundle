using FluentAssertions;
using Microsoft.Extensions.Logging;
using Moq;
using SetupManager.Core.Models;
using SetupManager.Services;
using Xunit;

namespace SetupManager.Tests.Services
{
    public class PowerServiceTests
    {
        private readonly Mock<ILogger<PowerService>> _mockLogger;
        private readonly PowerService _powerService;

        public PowerServiceTests()
        {
            _mockLogger = new Mock<ILogger<PowerService>>();
            _powerService = new PowerService(_mockLogger.Object);
        }

        [Fact]
        public void PowerService_Constructor_ShouldCreateInstance()
        {
            // Arrange & Act
            var service = new PowerService(_mockLogger.Object);

            // Assert
            service.Should().NotBeNull();
        }

        [Fact]
        public async Task ConfigurePowerSettingsAsync_WithTerminalProfile_ShouldReturnResult()
        {
            // Arrange
            var profile = new SetupProfile { ProfileName = "terminal" };

            // Act
            var result = await _powerService.ConfigurePowerSettingsAsync(profile);

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task ConfigurePowerSettingsAsync_WithKasseProfile_ShouldReturnResult()
        {
            // Arrange
            var profile = new SetupProfile { ProfileName = "kasse" };

            // Act
            var result = await _powerService.ConfigurePowerSettingsAsync(profile);

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task ConfigurePowerSettingsAsync_WithUnknownProfile_ShouldUseDefault()
        {
            // Arrange
            var profile = new SetupProfile { ProfileName = "unknown" };

            // Act
            var result = await _powerService.ConfigurePowerSettingsAsync(profile);

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task SetHighPerformancePlanAsync_ShouldReturnResult()
        {
            // Act
            var result = await _powerService.SetHighPerformancePlanAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task DisablePowerTimeoutsAsync_ShouldReturnResult()
        {
            // Act
            var result = await _powerService.DisablePowerTimeoutsAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task DisableHibernationAsync_ShouldReturnResult()
        {
            // Act
            var result = await _powerService.DisableHibernationAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task DisableScreensaverAsync_ShouldReturnResult()
        {
            // Act
            var result = await _powerService.DisableScreensaverAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task DisableUsbSelectiveSuspendAsync_ShouldReturnResult()
        {
            // Act  
            var result = await _powerService.DisableUsbSelectiveSuspendAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Fact]
        public async Task GetCurrentPowerPlanAsync_ShouldReturnPowerInfo()
        {
            // Act
            var result = await _powerService.GetCurrentPowerPlanAsync();

            // Assert
            result.Should().NotBeNull();
            result.LastUpdated.Should().BeCloseTo(DateTime.Now, TimeSpan.FromMinutes(1));
        }

        [Fact]
        public async Task ValidatePowerConfigurationAsync_ShouldReturnValidationResult()
        {
            // Act
            var result = await _powerService.ValidatePowerConfigurationAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
            result.Should().BeAssignableTo<ValidationResult>();
        }

        [Fact]
        public async Task RestoreDefaultPowerSettingsAsync_ShouldReturnResult()
        {
            // Act
            var result = await _powerService.RestoreDefaultPowerSettingsAsync();

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().NotBeNullOrEmpty();
        }

        [Theory]
        [InlineData("terminal")]
        [InlineData("kasse")]
        [InlineData("default")]
        public async Task ConfigurePowerSettingsAsync_WithDifferentProfiles_ShouldHandleAll(string profileName)
        {
            // Arrange
            var profile = new SetupProfile { ProfileName = profileName };

            // Act
            var result = await _powerService.ConfigurePowerSettingsAsync(profile);

            // Assert
            result.Should().NotBeNull();
            result.Message.Should().Contain(profileName);
        }

        #region PowerInfo Tests

        [Fact]
        public void PowerInfo_IsKioskOptimized_WhenAllConditionsMet_ShouldReturnTrue()
        {
            // Arrange - Create PowerInfo with all optimal conditions
            var powerInfo = new PowerInfo
            {
                IsUltimatePerformance = true,
                HibernationEnabled = false,
                ScreensaverActive = false,
                UsbSelectiveSuspendEnabled = false,
                MonitorTimeoutAC = 0,
                DiskTimeoutAC = 0,
                StandbyTimeoutAC = 0,
                HibernateTimeoutAC = 0
            };

            // Act & Assert - IsKioskOptimized is computed automatically
            powerInfo.IsKioskOptimized.Should().BeTrue();
        }

        [Fact]
        public void PowerInfo_IsKioskOptimized_WhenHighPerformance_ShouldReturnTrue()
        {
            // Arrange - Create PowerInfo with high performance settings
            var powerInfo = new PowerInfo
            {
                IsHighPerformance = true,
                IsUltimatePerformance = false,
                HibernationEnabled = false,
                ScreensaverActive = false,
                UsbSelectiveSuspendEnabled = false,
                MonitorTimeoutAC = 0,
                DiskTimeoutAC = 0,
                StandbyTimeoutAC = 0,
                HibernateTimeoutAC = 0
            };

            // Act & Assert - IsKioskOptimized is computed automatically
            powerInfo.IsKioskOptimized.Should().BeTrue();
        }

        [Fact]
        public void PowerInfo_IsKioskOptimized_WhenHibernationEnabled_ShouldReturnFalse()
        {
            // Arrange - Create PowerInfo with hibernation enabled (non-optimal)
            var powerInfo = new PowerInfo
            {
                IsUltimatePerformance = true,
                HibernationEnabled = true, // This makes it non-optimal
                ScreensaverActive = false,
                UsbSelectiveSuspendEnabled = false,
                MonitorTimeoutAC = 0,
                DiskTimeoutAC = 0,
                StandbyTimeoutAC = 0,
                HibernateTimeoutAC = 0
            };

            // Act & Assert - IsKioskOptimized is computed automatically
            powerInfo.IsKioskOptimized.Should().BeFalse();
        }

        [Fact]
        public void PowerInfo_ToString_ShouldContainKeyInformation()
        {
            // Arrange - Create PowerInfo with specific values
            var powerInfo = new PowerInfo
            {
                PowerPlanName = "Ultimate Performance",
                HibernationEnabled = false,
                UsbSelectiveSuspendEnabled = false,
                IsUltimatePerformance = true,
                ScreensaverActive = false,
                MonitorTimeoutAC = 0,
                DiskTimeoutAC = 0,
                StandbyTimeoutAC = 0,
                HibernateTimeoutAC = 0
            };

            // Act
            var result = powerInfo.ToString();

            // Assert
            result.Should().Contain("Ultimate Performance");
            result.Should().Contain("Kiosk-Optimized: True"); // Computed property
            result.Should().Contain("Hibernation: OFF");
            result.Should().Contain("USB-SelectiveSuspend: OFF");
        }

        #endregion

        #region Logger Verification Tests

        [Fact]
        public async Task SetHighPerformancePlanAsync_ShouldLogInformation()
        {
            // Act
            await _powerService.SetHighPerformancePlanAsync();

            // Assert - Fixed nullable warning
            _mockLogger.Verify(
                x => x.Log(
                    LogLevel.Information,
                    It.IsAny<EventId>(),
                    It.Is<It.IsAnyType>((v, t) => v.ToString()!.Contains("Setting high performance power plan")),
                    It.IsAny<Exception?>(),
                    It.IsAny<Func<It.IsAnyType, Exception?, string>>()),
                Times.AtLeastOnce);
        }

        [Fact]
        public async Task ConfigurePowerSettingsAsync_ShouldLogConfiguration()
        {
            // Arrange
            var profile = new SetupProfile { ProfileName = "terminal" };

            // Act
            await _powerService.ConfigurePowerSettingsAsync(profile);

            // Assert - Fixed nullable warning
            _mockLogger.Verify(
                x => x.Log(
                    LogLevel.Information,
                    It.IsAny<EventId>(),
                    It.Is<It.IsAnyType>((v, t) => v.ToString()!.Contains("Configuring power settings for profile")),
                    It.IsAny<Exception?>(),
                    It.IsAny<Func<It.IsAnyType, Exception?, string>>()),
                Times.AtLeastOnce);
        }

        #endregion

        #region InstallationResult Tests

        [Fact]
        public void InstallationResult_Success_ShouldHaveCorrectProperties()
        {
            // Arrange
            var result = new InstallationResult 
            { 
                Success = true, 
                Message = "Test successful" 
            };

            // Act & Assert
            result.Success.Should().BeTrue();
            result.Message.Should().Be("Test successful");
        }

        [Fact]
        public void InstallationResult_Failure_ShouldHaveCorrectProperties()
        {
            // Arrange
            var result = new InstallationResult 
            { 
                Success = false, 
                Message = "Test failed" 
            };

            // Act & Assert
            result.Success.Should().BeFalse();
            result.Message.Should().Be("Test failed");
        }

        #endregion

        #region ValidationResult Tests

        [Fact]
        public void ValidationResult_Success_ShouldHaveCorrectProperties()
        {
            // Arrange
            var result = new ValidationResult 
            { 
                Success = true, 
                Message = "Validation passed" 
            };

            // Act & Assert
            result.Success.Should().BeTrue();
            result.Message.Should().Be("Validation passed");
        }

        [Fact]
        public void ValidationResult_Failure_ShouldHaveCorrectProperties()
        {
            // Arrange
            var result = new ValidationResult 
            { 
                Success = false, 
                Message = "Validation failed" 
            };

            // Act & Assert
            result.Success.Should().BeFalse();
            result.Message.Should().Be("Validation failed");
        }

        #endregion
    }
}