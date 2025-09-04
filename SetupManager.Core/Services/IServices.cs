using SetupManager.Core.Models;

namespace SetupManager.Core.Services;

/// <summary>
/// DeviceManager (DMH) service interface
/// Based on PowerShell: 10_dmh.ps1, MSI installation and service management
/// </summary>
public interface IDeviceManagerService
{
    Task<ValidationResult> ValidatePackageAsync(string msiPath, string expectedHash, CancellationToken cancellationToken = default);
    Task<InstallationResult> InstallAsync(string msiPath, string expectedHash, CancellationToken cancellationToken = default);
    Task<InstallationResult> RepairAsync(string msiPath, CancellationToken cancellationToken = default);
    Task<ServiceResult> EnsureServiceRunningAsync(string serviceName, TimeSpan timeout, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckHealthAsync(string serviceName, CancellationToken cancellationToken = default);
    Task<ServiceResult> ConfigureServiceStartupAsync(string serviceName, ServiceStartType startType, CancellationToken cancellationToken = default);
}

/// <summary>
/// Printer management service interface
/// Based on PowerShell: 20_printers.ps1, driver installation and configuration
/// </summary>
public interface IPrinterService
{
    Task<List<DeviceResult>> DetectPrintersAsync(CancellationToken cancellationToken = default);
    Task<InstallationResult> InstallDriverAsync(string driverPath, string printerName, bool silent = true, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> SetDefaultPrinterAsync(string printerName, CancellationToken cancellationToken = default);
    Task<DeviceResult> PrintTestPageAsync(string printerName, CancellationToken cancellationToken = default);
    Task<List<DeviceResult>> InstallPrintersWithPriorityAsync(List<string> brandPriority, bool setDefault = true, bool printTest = true, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckPrinterHealthAsync(string printerName, CancellationToken cancellationToken = default);
}

/// <summary>
/// Scanner management service interface
/// Based on PowerShell: 30_scanner.ps1, supports both generic and Desko scanners
/// </summary>
public interface IScannerService
{
    Task<List<DeviceResult>> DetectScannersAsync(CancellationToken cancellationToken = default);
    Task<ValidationResult> PerformEchoTestAsync(TimeSpan timeout, CancellationToken cancellationToken = default);
    Task<InstallationResult> ConfigureGenericScannerAsync(ScannerConfig config, CancellationToken cancellationToken = default);
    Task<InstallationResult> ConfigureDeskoScannerAsync(ScannerConfig config, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckScannerHealthAsync(CancellationToken cancellationToken = default);
}

/// <summary>
/// CCTalk communication service interface (coin/bill validators)
/// Based on PowerShell: 40_cctalk.ps1, serial communication with gaming hardware
/// </summary>
public interface ICCTalkService
{
    Task<List<DeviceResult>> DetectCCTalkDevicesAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ConfigureSerialPortAsync(CCTalkConfig config, CancellationToken cancellationToken = default);
    Task<ValidationResult> TestCommunicationAsync(string? portName = null, CancellationToken cancellationToken = default);
    Task<ServiceResult> StartCCTalkServiceAsync(CancellationToken cancellationToken = default);
    Task<HealthResult> CheckCCTalkHealthAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> PersistSettingsAsync(string persistPath, CCTalkConfig config, CancellationToken cancellationToken = default);
}

/// <summary>
/// Power management service interface
/// Based on PowerShell: 60_energy_shell.ps1, Windows power schemes and USB settings
/// </summary>
public interface IPowerManagementService
{
    Task<ConfigurationResult> SetPowerSchemeAsync(string schemeName, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> DisableSleepAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> DisableDisplayOffAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> DisableUsbPowerSavingAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> DisableScreensaverAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ApplyPowerConfigAsync(PowerConfig config, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckPowerSettingsAsync(PowerConfig expectedConfig, CancellationToken cancellationToken = default);
}

/// <summary>
/// TeamViewer management service interface
/// Based on PowerShell: 50_teamviewer.ps1, installation, configuration and password management
/// </summary>
public interface ITeamViewerService
{
    Task<InstallationResult> InstallTeamViewerAsync(string msiPath, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ConfigurePoliciesAsync(TeamViewerConfig config, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> SetPasswordAsync(string password, CancellationToken cancellationToken = default);
    Task<string> GeneratePasswordAsync(int length, bool includeSymbols, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> EnableAutostartAsync(bool enable, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckTeamViewerHealthAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> RotatePasswordAsync(TeamViewerConfig config, CancellationToken cancellationToken = default);
}

/// <summary>
/// Display management service interface
/// Based on PowerShell: Multi-monitor setup, Edge kiosk mode, TV displays
/// </summary>
public interface IDisplayService
{
    Task<List<DeviceResult>> DetectDisplaysAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ConfigureExtendedDesktopAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> SetDisplayResolutionAsync(int monitor, int width, int height, int scaling, CancellationToken cancellationToken = default);
    Task<ServiceResult> StartKioskApplicationAsync(int targetMonitor, string url, string urlName, bool kioskMode, CancellationToken cancellationToken = default);
    Task<ServiceResult> StopKioskApplicationAsync(int targetMonitor, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ConfigureAutostartAsync(DisplayTargetConfig config, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckDisplayHealthAsync(DisplayConfig config, CancellationToken cancellationToken = default);
}

/// <summary>
/// Kiosk mode service interface
/// Based on PowerShell: Auto-login, shell replacement, assigned access
/// </summary>
public interface IKioskService
{
    Task<ConfigurationResult> EnableAutoLoginAsync(string username, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> DisableAutoLoginAsync(CancellationToken cancellationToken = default);
    Task<ConfigurationResult> SetKioskShellAsync(string shellPath, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ConfigureAssignedAccessAsync(string username, string applicationPath, CancellationToken cancellationToken = default);
    Task<ServiceResult> StartEdgeKioskAsync(string url, string userDataDir, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckKioskHealthAsync(KioskConfig config, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> CreateKioskUserAsync(string username, string password, CancellationToken cancellationToken = default);
}

/// <summary>
/// Health monitoring service interface
/// Based on PowerShell: System health checks, audit system
/// </summary>
public interface IHealthService
{
    Task<HealthResult> CheckSystemHealthAsync(CancellationToken cancellationToken = default);
    Task<HealthResult> CheckServiceHealthAsync(string serviceName, CancellationToken cancellationToken = default);
    Task<HealthResult> CheckHardwareHealthAsync(CancellationToken cancellationToken = default);
    Task<HealthResult> CheckNetworkHealthAsync(CancellationToken cancellationToken = default);
    Task<Dictionary<string, HealthResult>> CheckAllHealthAsync(SetupProfile profile, CancellationToken cancellationToken = default);
    Task<ConfigurationResult> ExportHealthReportAsync(string outputPath, CancellationToken cancellationToken = default);
    Task<List<HealthResult>> GetHealthHistoryAsync(TimeSpan period, CancellationToken cancellationToken = default);
}

/// <summary>
/// Setup orchestration service interface
/// Based on PowerShell: Overall setup workflow and profile management
/// </summary>
public interface ISetupOrchestrationService
{
    Task<SetupProfile> LoadProfileAsync(string profilePath, CancellationToken cancellationToken = default);
    Task<ValidationResult> ValidateProfileAsync(SetupProfile profile, CancellationToken cancellationToken = default);
    Task<List<SetupStepResult>> ExecuteSetupAsync(SetupProfile profile, IProgress<SetupStepResult>? progress = null, CancellationToken cancellationToken = default);
    Task<SetupStepResult> ExecuteStepAsync(string stepName, SetupProfile profile, CancellationToken cancellationToken = default);
    Task<List<SetupStepResult>> RollbackSetupAsync(SetupProfile profile, CancellationToken cancellationToken = default);
    Task<HealthResult> ValidateSetupCompletionAsync(SetupProfile profile, CancellationToken cancellationToken = default);
}

/// <summary>
/// Common service interface that all services should implement
/// Provides logging, configuration and base functionality
/// </summary>
public interface IBaseService
{
    string ServiceName { get; }
    bool IsInitialized { get; }
    
    Task<ValidationResult> InitializeAsync(CancellationToken cancellationToken = default);
    Task<ValidationResult> ValidatePrerequisitesAsync(CancellationToken cancellationToken = default);
    Task<HealthResult> CheckHealthAsync(CancellationToken cancellationToken = default);
    Task DisposeAsync();
}

/// <summary>
/// Service factory interface for dependency injection
/// </summary>
public interface IServiceFactory
{
    T CreateService<T>() where T : class, IBaseService;
    IEnumerable<IBaseService> CreateAllServices();
    Task<ValidationResult> ValidateServicesAsync(CancellationToken cancellationToken = default);
}