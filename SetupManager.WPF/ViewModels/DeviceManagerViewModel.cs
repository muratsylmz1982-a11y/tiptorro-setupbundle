// ===========================
// DeviceManagerViewModel.cs - KORRIGIERT  
// ===========================
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;
using System.Collections.ObjectModel;

namespace SetupManager.WPF.ViewModels
{
    public partial class DeviceManagerViewModel : ObservableObject, IDisposable
    {
        private readonly IDeviceManager _deviceManager;
        private readonly ILogger _logger;

        // === OBSERVABLE PROPERTIES ===

        [ObservableProperty]
        private ObservableCollection<DeviceInfo> _devices = new();

        [ObservableProperty]
        private string _serviceStatus = "Unbekannt";

        [ObservableProperty]
        private int _totalDevices = 0;

        [ObservableProperty]
        private int _availableDevices = 0;

        [ObservableProperty]
        private bool _isScanning = false;

        [ObservableProperty]
        private DeviceInfo? _selectedDevice;

        [ObservableProperty]
        private string _scanningProgress = "";

        public DeviceManagerViewModel(IDeviceManager deviceManager, ILogger logger)
        {
            _deviceManager = deviceManager;
            _logger = logger;
        }

        // === COMMANDS ===

        [RelayCommand]
        public async Task RefreshAsync()
        {
            if (IsScanning) return;

            IsScanning = true;
            ScanningProgress = "Scanne verfügbare Geräte...";
            
            try
            {
                _logger.LogInformation("DeviceManager: Starte Geräte-Scan...");

                var availableDevices = await _deviceManager.GetAvailableDevicesAsync();
                
                Devices.Clear();
                var deviceList = availableDevices.ToList();
                
                foreach (var device in deviceList)
                {
                    Devices.Add(device);
                }

                // Statistiken aktualisieren
                TotalDevices = Devices.Count;
                AvailableDevices = Devices.Count;

                ServiceStatus = "✅ Aktiv";
                ScanningProgress = $"✅ {TotalDevices} Geräte gefunden";

                _logger.LogInformation($"DeviceManager: {TotalDevices} Geräte gefunden");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Geräte-Scan");
                ServiceStatus = "❌ Fehler";
                ScanningProgress = $"❌ Scan fehlgeschlagen: {ex.Message}";
            }
            finally
            {
                IsScanning = false;
            }
        }

        [RelayCommand(CanExecute = nameof(CanCheckDevice))]
        private async Task CheckDeviceAvailabilityAsync()
        {
            if (SelectedDevice == null) return;

            try
            {
                _logger.LogInformation($"Prüfe Verfügbarkeit von Gerät: {SelectedDevice.Name}");
                
                // Verwende echte Property: DeviceId statt Id
                var isAvailable = await _deviceManager.IsDeviceAvailableAsync(SelectedDevice.DeviceId);
                
                var status = isAvailable ? "✅ Verfügbar" : "❌ Nicht verfügbar";
                System.Windows.MessageBox.Show(
                    $"Gerät: {SelectedDevice.Name}\nStatus: {status}",
                    "Geräte-Verfügbarkeit",
                    System.Windows.MessageBoxButton.OK,
                    isAvailable ? System.Windows.MessageBoxImage.Information : System.Windows.MessageBoxImage.Warning);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Geräte-Verfügbarkeitsprüfung");
                System.Windows.MessageBox.Show($"Fehler: {ex.Message}", "Verfügbarkeitsprüfung Fehler", 
                    System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
            }
        }

        private bool CanCheckDevice() => SelectedDevice != null && !IsScanning;

        [RelayCommand(CanExecute = nameof(CanShowDeviceDetails))]
        private async Task ShowDeviceDetailsAsync()
        {
            if (SelectedDevice == null) return;

            try
            {
                // Verwende echte Property: DeviceId
                var deviceInfo = await _deviceManager.GetDeviceInfoAsync(SelectedDevice.DeviceId);
                
                var details = $"Gerät: {deviceInfo.Name}\n" +
                             $"Device ID: {deviceInfo.DeviceId}\n" +
                             $"Kategorie: {deviceInfo.Category}\n" +
                             $"Hersteller: {deviceInfo.Manufacturer}\n" +
                             $"Status: {deviceInfo.Status}\n\n" +
                             $"Eigenschaften:\n";

                if (deviceInfo.Properties != null && deviceInfo.Properties.Any())
                {
                    foreach (var prop in deviceInfo.Properties)
                    {
                        details += $"  • {prop.Key}: {prop.Value}\n";
                    }
                }
                else
                {
                    details += "  • Keine zusätzlichen Eigenschaften verfügbar\n";
                }

                System.Windows.MessageBox.Show(details, "Geräte-Details", 
                    System.Windows.MessageBoxButton.OK, 
                    System.Windows.MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Laden der Geräte-Details");
                System.Windows.MessageBox.Show($"Fehler beim Laden der Details: {ex.Message}", 
                    "Details-Fehler", 
                    System.Windows.MessageBoxButton.OK, 
                    System.Windows.MessageBoxImage.Error);
            }
        }

        private bool CanShowDeviceDetails() => SelectedDevice != null && !IsScanning;

        // === PROPERTY CHANGE HANDLERS ===

        partial void OnSelectedDeviceChanged(DeviceInfo? value)
        {
            ShowDeviceDetailsCommand.NotifyCanExecuteChanged();
            CheckDeviceAvailabilityCommand.NotifyCanExecuteChanged();
        }

        partial void OnIsScanningChanged(bool value)
        {
            ShowDeviceDetailsCommand.NotifyCanExecuteChanged();
            CheckDeviceAvailabilityCommand.NotifyCanExecuteChanged();
        }

        // === CLEANUP ===

        public void Dispose()
        {
            // Cleanup falls erforderlich
        }
    }
}
