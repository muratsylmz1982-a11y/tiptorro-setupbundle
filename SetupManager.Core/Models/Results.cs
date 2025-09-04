namespace SetupManager.Core.Models;

public abstract record BaseResult
{
    public bool Success { get; init; }
    public string Message { get; init; } = string.Empty;
    public DateTime Timestamp { get; init; } = DateTime.UtcNow;
    public TimeSpan Duration { get; init; }
    public Exception? Exception { get; init; }
}

public sealed record InstallationResult : BaseResult
{
    public int? ExitCode { get; init; }
    public string? ProductName { get; init; }
    public string? ProductVersion { get; init; }

    public static InstallationResult CreateSuccess(string message) => new() { Success = true, Message = message };
    public static InstallationResult CreateFailure(string message) => new() { Success = false, Message = message };
}

public sealed record ValidationResult : BaseResult
{
    public string? ValidationType { get; init; }
    public string? ExpectedValue { get; init; }
    public string? ActualValue { get; init; }

    public static ValidationResult CreateSuccess(string message) => new() { Success = true, Message = message };
    public static ValidationResult CreateFailure(string message) => new() { Success = false, Message = message };
}

public sealed record HealthResult : BaseResult
{
    public bool Healthy { get; init; }
    public string Details { get; init; } = string.Empty;

    public static HealthResult CreateHealthy(string details) => new() { Success = true, Healthy = true, Details = details };
    public static HealthResult CreateUnhealthy(string details) => new() { Success = false, Healthy = false, Details = details };
}

public sealed record ServiceResult : BaseResult
{
    public string ServiceName { get; init; } = string.Empty;
    public ServiceStatus Status { get; init; }

    public static ServiceResult CreateSuccess(string serviceName) => new() { Success = true, ServiceName = serviceName };
    public static ServiceResult CreateFailure(string serviceName) => new() { Success = false, ServiceName = serviceName };
}

public sealed record ConfigurationResult : BaseResult
{
    public string ConfigurationType { get; init; } = string.Empty;
    
    public static ConfigurationResult CreateSuccess(string type) => new() { Success = true, ConfigurationType = type };
    public static ConfigurationResult CreateFailure(string type) => new() { Success = false, ConfigurationType = type };
}

public sealed record DeviceResult : BaseResult
{
    public string DeviceType { get; init; } = string.Empty;
    public string? DeviceName { get; init; }
    
    public static DeviceResult CreateSuccess(string deviceType) => new() { Success = true, DeviceType = deviceType };
    public static DeviceResult CreateFailure(string deviceType) => new() { Success = false, DeviceType = deviceType };
}

public sealed record SetupStepResult : BaseResult
{
    public string StepName { get; init; } = string.Empty;
    public int StepNumber { get; init; }
    public int TotalSteps { get; init; }
    
    public static SetupStepResult CreateSuccess(string stepName) => new() { Success = true, StepName = stepName };
    public static SetupStepResult CreateFailure(string stepName) => new() { Success = false, StepName = stepName };
}

public enum ServiceStatus { Unknown, Stopped, Starting, Running, Stopping, Paused }
public enum ServiceStartType { Unknown, Automatic, Manual, Disabled }
public enum HealthSeverity { Info, Warning, Error, Critical }