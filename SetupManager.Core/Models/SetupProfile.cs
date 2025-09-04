using System.Text.Json.Serialization;

namespace SetupManager.Core.Models;

/// <summary>
/// Main profile configuration for terminal or kasse setup
/// Based on PowerShell JSON structure: profiles/terminal.json, profiles/kasse.json
/// </summary>
public sealed record SetupProfile
{
    [JsonPropertyName("profileName")]
    public string ProfileName { get; init; } = string.Empty;

    [JsonPropertyName("dmh")]
    public DeviceManagerConfig Dmh { get; init; } = new();

    [JsonPropertyName("printers")]
    public PrinterConfig Printers { get; init; } = new();

    [JsonPropertyName("scanners")]
    public ScannerConfig? Scanners { get; init; }

    [JsonPropertyName("scanner")]
    public ScannerConfig? Scanner { get; init; }

    [JsonPropertyName("cctalk")]
    public CCTalkConfig CCTalk { get; init; } = new();

    [JsonPropertyName("power")]
    public PowerConfig Power { get; init; } = new();

    [JsonPropertyName("teamviewer")]
    public TeamViewerConfig TeamViewer { get; init; } = new();

    [JsonPropertyName("web")]
    public WebConfig Web { get; init; } = new();

    [JsonPropertyName("display")]
    public DisplayConfig Display { get; init; } = new();

    [JsonPropertyName("kiosk")]
    public KioskConfig Kiosk { get; init; } = new();

    [JsonPropertyName("logging")]
    public LoggingConfig Logging { get; init; } = new();

    [JsonPropertyName("selftest")]
    public SelftestConfig Selftest { get; init; } = new();

    // Computed properties for easier access
    public bool IsTerminal => ProfileName.Equals("terminal", StringComparison.OrdinalIgnoreCase);
    public bool IsKasse => ProfileName.Equals("kasse", StringComparison.OrdinalIgnoreCase);
    
    // Handle both "scanner" and "scanners" keys from JSON
    public ScannerConfig? EffectiveScanner => Scanner ?? Scanners;
}

/// <summary>
/// DeviceManager (DMH) configuration
/// Maps to PowerShell: $profile.dmh
/// </summary>
public sealed record DeviceManagerConfig
{
    [JsonPropertyName("msiPath")]
    public string MsiPath { get; init; } = string.Empty;

    [JsonPropertyName("hostPath")]
    public string HostPath { get; init; } = string.Empty;

    [JsonPropertyName("installInfoPath")]
    public string InstallInfoPath { get; init; } = string.Empty;

    [JsonPropertyName("expectedSha256")]
    public string ExpectedSha256 { get; init; } = string.Empty;

    [JsonPropertyName("serviceName")]
    public string ServiceName { get; init; } = "devicemanager";

    [JsonPropertyName("preferredAction")]
    public string PreferredAction { get; init; } = "install";
}

/// <summary>
/// Printer configuration
/// Maps to PowerShell: $profile.printers
/// </summary>
public sealed record PrinterConfig
{
    [JsonPropertyName("preferredBrandOrder")]
    public List<string> PreferredBrandOrder { get; init; } = new();

    [JsonPropertyName("silent")]
    public bool Silent { get; init; } = true;

    [JsonPropertyName("setDefault")]
    public bool SetDefault { get; init; } = true;

    [JsonPropertyName("printTestPage")]
    public bool PrintTestPage { get; init; } = true;
}

/// <summary>
/// Scanner configuration (supports both terminal and kasse variants)
/// Maps to PowerShell: $profile.scanners or $profile.scanner
/// </summary>
public sealed record ScannerConfig
{
    // Terminal variant (generic scanner)
    [JsonPropertyName("mode")]
    public string? Mode { get; init; }

    [JsonPropertyName("requireEchoTest")]
    public bool RequireEchoTest { get; init; }

    [JsonPropertyName("echoTimeoutSec")]
    public int EchoTimeoutSec { get; init; } = 20;

    // Kasse variant (Desko scanner)
    [JsonPropertyName("vendor")]
    public string? Vendor { get; init; }

    [JsonPropertyName("defaultProfile")]
    public string? DefaultProfile { get; init; }

    [JsonPropertyName("allowQr")]
    public bool AllowQr { get; init; }

    [JsonPropertyName("allowOcr")]
    public bool AllowOcr { get; init; }

    // Computed properties
    public bool IsGenericMode => Mode?.Equals("generic", StringComparison.OrdinalIgnoreCase) == true;
    public bool IsDeskoVendor => Vendor?.Equals("desko", StringComparison.OrdinalIgnoreCase) == true;
}

/// <summary>
/// CCTalk configuration for coin/bill validators
/// Maps to PowerShell: $profile.cctalk
/// </summary>
public sealed record CCTalkConfig
{
    [JsonPropertyName("enabled")]
    public bool Enabled { get; init; } = true;

    [JsonPropertyName("port")]
    public string? Port { get; init; }

    [JsonPropertyName("baud")]
    public int Baud { get; init; } = 9600;

    [JsonPropertyName("parity")]
    public string Parity { get; init; } = "none";

    [JsonPropertyName("dataBits")]
    public int DataBits { get; init; } = 8;

    [JsonPropertyName("stopBits")]
    public int StopBits { get; init; } = 1;

    [JsonPropertyName("persistPath")]
    public string PersistPath { get; init; } = @"%ProgramData%\Tiptorro\ccTalk\settings.ini";
}

/// <summary>
/// Power management configuration
/// Maps to PowerShell: $profile.power
/// </summary>
public sealed record PowerConfig
{
    [JsonPropertyName("plan")]
    public string Plan { get; init; } = "HighPerformance";

    [JsonPropertyName("disableSleep")]
    public bool DisableSleep { get; init; } = true;

    [JsonPropertyName("disableDisplayOff")]
    public bool DisableDisplayOff { get; init; } = true;

    [JsonPropertyName("disableUsbPowerSaving")]
    public bool DisableUsbPowerSaving { get; init; } = true;

    [JsonPropertyName("disableScreensaver")]
    public bool DisableScreensaver { get; init; } = true;
}

/// <summary>
/// TeamViewer configuration
/// Maps to PowerShell: $profile.teamviewer
/// </summary>
public sealed record TeamViewerConfig
{
    [JsonPropertyName("manage")]
    public bool Manage { get; init; } = true;

    [JsonPropertyName("autostart")]
    public bool Autostart { get; init; } = true;

    [JsonPropertyName("rotationDays")]
    public int RotationDays { get; init; } = 30;

    [JsonPropertyName("passwordLength")]
    public int PasswordLength { get; init; } = 16;

    [JsonPropertyName("includeSymbols")]
    public bool IncludeSymbols { get; init; } = true;
}

/// <summary>
/// Web configuration (different URLs for terminal vs kasse)
/// Maps to PowerShell: $profile.web
/// </summary>
public sealed record WebConfig
{
    // Terminal variant
    [JsonPropertyName("terminalUrl")]
    public string? TerminalUrl { get; init; }

    [JsonPropertyName("adminUrl")]
    public string? AdminUrl { get; init; }

    // Kasse variant
    [JsonPropertyName("posUrl")]
    public string? PosUrl { get; init; }

    [JsonPropertyName("customerDisplayUrl")]
    public string? CustomerDisplayUrl { get; init; }

    [JsonPropertyName("loginPattern")]
    public string LoginPattern { get; init; } = "t<SHOP>-<TERMINAL>";

    // Computed properties
    public string? PrimaryUrl => TerminalUrl ?? PosUrl;
    public string? SecondaryUrl => AdminUrl ?? CustomerDisplayUrl;
}

/// <summary>
/// Display configuration for multi-monitor setup
/// Maps to PowerShell: $profile.display
/// </summary>
public sealed record DisplayConfig
{
    [JsonPropertyName("mode")]
    public string Mode { get; init; } = "extend";

    [JsonPropertyName("persist")]
    public bool Persist { get; init; } = true;

    // Terminal variant (TV display)
    [JsonPropertyName("tv")]
    public DisplayTargetConfig? Tv { get; init; }

    // Kasse variant (customer display)
    [JsonPropertyName("customerDisplay")]
    public DisplayTargetConfig? CustomerDisplay { get; init; }

    // Computed property
    public DisplayTargetConfig? PrimaryTarget => Tv ?? CustomerDisplay;
}

/// <summary>
/// Display target configuration
/// Maps to PowerShell: $profile.display.tv or $profile.display.customerDisplay
/// </summary>
public sealed record DisplayTargetConfig
{
    [JsonPropertyName("targetMonitor")]
    public int TargetMonitor { get; init; } = 2;

    [JsonPropertyName("urlName")]
    public string UrlName { get; init; } = string.Empty;

    [JsonPropertyName("fullscreen")]
    public bool Fullscreen { get; init; } = true;

    [JsonPropertyName("kioskMode")]
    public bool KioskMode { get; init; } = true;

    [JsonPropertyName("autostart")]
    public bool Autostart { get; init; } = true;

    [JsonPropertyName("watchdog")]
    public bool Watchdog { get; init; } = true;
}

/// <summary>
/// Kiosk mode configuration
/// Maps to PowerShell: $profile.kiosk
/// </summary>
public sealed record KioskConfig
{
    [JsonPropertyName("enableAutoLogin")]
    public bool EnableAutoLogin { get; init; }

    [JsonPropertyName("user")]
    public string? User { get; init; }

    [JsonPropertyName("shell")]
    public string? Shell { get; init; }
}

/// <summary>
/// Logging configuration
/// Maps to PowerShell: $profile.logging
/// </summary>
public sealed record LoggingConfig
{
    [JsonPropertyName("directory")]
    public string Directory { get; init; } = "logs";

    [JsonPropertyName("zipExport")]
    public bool ZipExport { get; init; } = true;

    [JsonPropertyName("redactSecrets")]
    public bool RedactSecrets { get; init; } = true;
}

/// <summary>
/// Self-test configuration
/// Maps to PowerShell: $profile.selftest
/// </summary>
public sealed record SelftestConfig
{
    [JsonPropertyName("enabled")]
    public bool Enabled { get; init; } = true;

    [JsonPropertyName("strict")]
    public bool Strict { get; init; } = true;
}