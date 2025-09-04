using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Logging;

namespace SetupManager.Core.Common;

public static class SetupLogger
{
    private static readonly Dictionary<string, ILogger> _loggers = new();
    private static ILoggerFactory? _loggerFactory;

    public static void Initialize(ILoggerFactory loggerFactory)
    {
        _loggerFactory = loggerFactory ?? throw new ArgumentNullException(nameof(loggerFactory));
    }

    public static ILogger GetLogger(string categoryName)
    {
        if (_loggerFactory == null)
            throw new InvalidOperationException("SetupLogger not initialized. Call Initialize() first.");

        if (!_loggers.TryGetValue(categoryName, out var logger))
        {
            logger = _loggerFactory.CreateLogger(categoryName);
            _loggers[categoryName] = logger;
        }
        return logger;
    }

    public static ILogger<T> GetLogger<T>() => (ILogger<T>)GetLogger(typeof(T).FullName ?? typeof(T).Name);
}

public static class SecurityHelper
{
    private static readonly Regex SecretPattern = new(
        @"(password|secret|key|token|credential|pwd|pass)\s*[:=]\s*['""]?([^'"";\s]+)['""]?",
        RegexOptions.IgnoreCase | RegexOptions.Compiled);

    public static bool IsRunningAsAdministrator()
    {
        try
        {
            using var identity = WindowsIdentity.GetCurrent();
            var principal = new WindowsPrincipal(identity);
            return principal.IsInRole(WindowsBuiltInRole.Administrator);
        }
        catch
        {
            return false;
        }
    }

    public static void EnsureAdministrator()
    {
        if (!IsRunningAsAdministrator())
        {
            throw new UnauthorizedAccessException("Administrator privileges required.");
        }
    }

    public static string RedactSecrets(string input)
    {
        if (string.IsNullOrEmpty(input))
            return input;

        return SecretPattern.Replace(input, match => 
            $"{match.Groups[1].Value}: ***REDACTED***");
    }

    public static string GenerateSecurePassword(int length = 16, bool includeSymbols = true)
    {
        const string letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const string numbers = "0123456789";
        const string symbols = "!@#$%^&*()-_=+[]{}|;:,.<>?";

        var chars = letters + numbers;
        if (includeSymbols)
            chars += symbols;

        using var rng = RandomNumberGenerator.Create();
        var result = new StringBuilder(length);
        var buffer = new byte[4];

        for (int i = 0; i < length; i++)
        {
            rng.GetBytes(buffer);
            var randomValue = BitConverter.ToUInt32(buffer, 0);
            result.Append(chars[(int)(randomValue % chars.Length)]);
        }

        return result.ToString();
    }
}