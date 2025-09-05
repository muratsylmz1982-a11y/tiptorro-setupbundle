// ===========================
// MainViewModel.cs - KORRIGIERT
// ===========================
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;
using System.Collections.ObjectModel;
using System.Windows;

namespace SetupManager.WPF.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        private readonly IDeviceManager _deviceManager;
        private readonly IPrinterService _printerService;
        private readonly IPowerService _powerService;
        private readonly ILogger<MainViewModel> _logger;
        private readonly System.Timers.Timer _statusUpdateTimer;

        // === OBSERVABLE PROPERTIES ===
        
        [ObservableProperty]
        private string _currentProfile = "Terminal/Kasse Setup";

        [ObservableProperty]
        private string _systemStatus = "Initialisiere...";

        [ObservableProperty]
        private bool _isSystemOptimized = false;

        [ObservableProperty]
        private int _connectedDevices = 0;

        [ObservableProperty]
        private int _installedPrinters = 0;

        [ObservableProperty]
        private string _powerPlan = "Unbekannt";

        [ObservableProperty]
        private ObservableCollection<string> _statusMessages = new();

        [ObservableProperty]
        private bool _isRefreshing = false;

        // === CHILD VIEWMODELS ===
        public DeviceManagerViewModel DeviceManagerVM { get; }
        public PrinterServiceViewModel PrinterServiceVM { get; }
        public PowerServiceViewModel PowerServiceVM { get; }

        public MainViewModel(
            IDeviceManager deviceManager,
            IPrinterService printerService,
            IPowerService powerService,
            ILogger<MainViewModel> logger)
        {
            _deviceManager = deviceManager;
            _printerService = printerService;
            _powerService = powerService;
            _logger = logger;

            // Child ViewModels initialisieren
            DeviceManagerVM = new DeviceManagerViewModel(_deviceManager, logger);
            PrinterServiceVM = new PrinterServiceViewModel(_printerService, logger);
            PowerServiceVM = new PowerServiceViewModel(_powerService, logger);

            // Status-Update Timer (alle 10 Sekunden)
            _statusUpdateTimer = new System.Timers.Timer(10000);
            _statusUpdateTimer.Elapsed += async (s, e) => await RefreshStatusAsync();
            _statusUpdateTimer.AutoReset = true;
            _statusUpdateTimer.Start();

            // Initiale Daten laden
            _ = Task.Run(InitializeAsync);
        }

        // === COMMANDS ===

        [RelayCommand]
        private async Task RefreshAllAsync()
        {
            if (IsRefreshing) return;
            
            IsRefreshing = true;
            AddStatusMessage("🔄 Aktualisiere alle Services...");

            try
            {
                await RefreshStatusAsync();
                await DeviceManagerVM.RefreshAsync();
                await PrinterServiceVM.RefreshAsync();
                await PowerServiceVM.RefreshAsync();
                
                AddStatusMessage("✅ Alle Services aktualisiert");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Aktualisieren der Services");
                AddStatusMessage($"❌ Fehler: {ex.Message}");
            }
            finally
            {
                IsRefreshing = false;
            }
        }

        [RelayCommand]
        private async Task OptimizeSystemAsync()
        {
            AddStatusMessage("🚀 Starte Systemoptimierung...");
            
            try
            {
                // Power-Konfiguration - erstelle echtes SetupProfile
                var profile = new SetupProfile { ProfileName = "terminal" };
                var powerResult = await _powerService.ConfigurePowerSettingsAsync(profile);
                if (powerResult != null)
                {
                    AddStatusMessage("✅ Energiekonfiguration angewendet");
                }

                // Drucker-Installation
                var uninstalledPrinters = await _printerService.ScanForUninstalledPrintersAsync();
                foreach (var printer in uninstalledPrinters)
                {
                    try
                    {
                        var installResult = await _printerService.InstallDetectedPrinterAsync(printer);
                        if (installResult)
                        {
                            AddStatusMessage($"✅ {printer.Name} installiert");
                        }
                    }
                    catch (Exception ex)
                    {
                        AddStatusMessage($"⚠️ {printer.Name} Installation fehlgeschlagen: {ex.Message}");
                    }
                }

                await RefreshStatusAsync();
                AddStatusMessage("🎉 Systemoptimierung abgeschlossen!");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Systemoptimierung");
                AddStatusMessage($"❌ Optimierung fehlgeschlagen: {ex.Message}");
            }
        }

        [RelayCommand]
        private void ShowAbout()
        {
            MessageBox.Show(
                "SetupManager v1.0\n" +
                "Tiptorro System Setup Tool\n" +
                "© 2025 - .NET 8 + WPF + MVVM\n\n" +
                "M3 Service Integration mit echten M2 Services",
                "Über SetupManager",
                MessageBoxButton.OK,
                MessageBoxImage.Information);
        }

        // === PRIVATE METHODEN ===

        private async Task InitializeAsync()
        {
            try
            {
                AddStatusMessage("🔧 Initialisiere SetupManager...");
                
                await RefreshStatusAsync();
                AddStatusMessage("✅ Initialisierung abgeschlossen");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei der Initialisierung");
                AddStatusMessage($"❌ Initialisierung fehlgeschlagen: {ex.Message}");
            }
        }

        private async Task RefreshStatusAsync()
        {
            try
            {
                // Device Status
                var devices = await _deviceManager.GetAvailableDevicesAsync();
                ConnectedDevices = devices.Count();

                // Printer Status  
                var printers = await _printerService.GetInstalledPrintersAsync();
                InstalledPrinters = printers.Count();

                // Power Status - verwende echte Properties
                var powerInfo = await _powerService.GetCurrentPowerPlanAsync();
                PowerPlan = powerInfo?.PowerPlanName ?? "Unbekannt";

                // Power Validation für System-Status - falls ValidationResult nicht existiert, verwende IsKioskOptimized
                IsSystemOptimized = powerInfo?.IsKioskOptimized ?? false;

                // System Status zusammenfassen
                SystemStatus = IsSystemOptimized ? 
                    "✅ System optimiert" : 
                    "⚠️ Optimierung erforderlich";
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Status-Update");
                SystemStatus = "❌ Status-Fehler";
            }
        }

        private void AddStatusMessage(string message)
        {
            Application.Current.Dispatcher.Invoke(() =>
            {
                StatusMessages.Insert(0, $"{DateTime.Now:HH:mm:ss} - {message}");
                
                // Nur letzte 50 Nachrichten behalten
                while (StatusMessages.Count > 50)
                {
                    StatusMessages.RemoveAt(StatusMessages.Count - 1);
                }
            });
        }

        // === CLEANUP ===
        
        public void Dispose()
        {
            _statusUpdateTimer?.Stop();
            _statusUpdateTimer?.Dispose();
            DeviceManagerVM?.Dispose();
            PrinterServiceVM?.Dispose();
            PowerServiceVM?.Dispose();
        }
    }
}