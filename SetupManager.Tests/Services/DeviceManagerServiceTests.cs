using Xunit;
using FluentAssertions;
using Moq;
using SetupManager.Services;
using Microsoft.Extensions.Logging;

namespace SetupManager.Tests.Services
{
    public class DeviceManagerServiceTests
    {
        private readonly Mock<ILogger<DeviceManagerService>> _loggerMock;
        private readonly DeviceManagerService _deviceManagerService;

        public DeviceManagerServiceTests()
        {
            _loggerMock = new Mock<ILogger<DeviceManagerService>>();
            _deviceManagerService = new DeviceManagerService(_loggerMock.Object);
        }

        [Fact]
        public void DeviceManagerService_Constructor_ShouldInitializeSuccessfully()
        {
            // Assert
            _deviceManagerService.Should().NotBeNull();
            _deviceManagerService.Should().BeOfType<DeviceManagerService>();
        }

        [Fact]
        public void DeviceManagerService_ShouldImplementIDeviceManager()
        {
            // Assert
            _deviceManagerService.Should().BeAssignableTo<SetupManager.Core.Interfaces.IDeviceManager>();
        }

        [Fact]
        public void Logger_ShouldBeInjectedCorrectly()
        {
            // Act & Assert - Constructor should not throw with valid logger
            var service = new DeviceManagerService(_loggerMock.Object);
            service.Should().NotBeNull();
        }

        // Placeholder test that will always pass - for basic compilation validation
        [Fact]
        public void BasicTest_ShouldPass()
        {
            // Assert
            true.Should().BeTrue();
        }
    }
}