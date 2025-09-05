// ===========================
// PowerServiceViewModel.cs - KORRIGIERT
// ===========================
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;

namespace SetupManager.WPF.ViewModels
{
    public partial class PowerServiceViewModel : ObservableObject, IDisposable
    {
        private readonly IPowerService _powerService;
        private readonly ILogger _logger;

        // === OBSERVABLE PROPERTIES ===

        [ObservableProperty]
        private string _currentPowerPlan = "Unbekannt";

        [ObservableProperty]
        private bool _isKioskOptimized = false;

        [ObservableProperty]
        private bool _hibernationEnabled = true;

        [ObservableProperty]
        private bool _screensaverActive = true;

        [ObservableProperty]
        private bool _usbSelectiveSuspendEnabled = true;

        [ObservableProperty]
        private string _monitorTimeout = "Unbekannt";

        [ObservableProperty]
        private string _diskTimeout = "Unbekannt";

        [ObservableProperty]
        private string _standbyTimeout = "Unbekannt";

        [ObservableProperty]
        private string _hibernateTimeout = "Unbekannt";

        [ObservableProperty]
        private bool _isWorking = false;

        [ObservableProperty]
        private string _workingProgress = "";

        [ObservableProperty]
        private PowerInfo? _currentPowerInfo;

        [ObservableProperty]
        private string _lastOperationResult = "";

        public PowerServiceViewModel(IPowerService powerService, ILogger logger)
        {
            _powerService = powerService;
            _logger = logger;
        }

        // === COMMANDS ===

        [RelayCommand]
        public async Task RefreshAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "Aktualisiere Energie-Status...";

            try
            {
                _logger.LogInformation("PowerService: Aktualisiere Energie-Status...");

                var powerInfo = await _powerService.GetCurrentPowerPlanAsync();
                CurrentPowerInfo = powerInfo;

                if (powerInfo != null)
                {
                    // Verwende echte Properties aus PowerInfo
                    CurrentPowerPlan = powerInfo.PowerPlanName;
                    IsKioskOptimized = powerInfo.IsKioskOptimized;
                    HibernationEnabled = powerInfo.HibernationEnabled;
                    ScreensaverActive = powerInfo.ScreensaverActive;
                    UsbSelectiveSuspendEnabled = powerInfo.UsbSelectiveSuspendEnabled;

                    // Timeout-Werte formatieren
                    MonitorTimeout = FormatTimeout(powerInfo.MonitorTimeoutAC);
                    DiskTimeout = FormatTimeout(powerInfo.DiskTimeoutAC);
                    StandbyTimeout = FormatTimeout(powerInfo.StandbyTimeoutAC);
                    HibernateTimeout = FormatTimeout(powerInfo.HibernateTimeoutAC);
                }

                WorkingProgress = "✅ Energie-Status aktualisiert";
                _logger.LogInformation($"PowerService: Plan: {CurrentPowerPlan}, Kiosk-optimiert: {IsKioskOptimized}");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Power-Status Update");
                WorkingProgress = $"❌ Status-Fehler: {ex.Message}";
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private async Task ConfigureKioskPowerAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "🚀 Starte Kiosk-Energiekonfiguration...";

            try
            {
                _logger.LogInformation("Starte Kiosk-Energiekonfiguration...");

                // Erstelle echtes SetupProfile
                var profile = new SetupProfile { ProfileName = "terminal" };
                var result = await _powerService.ConfigurePowerSettingsAsync(profile);

                if (result != null)
                {
                    LastOperationResult = "✅ Kiosk-Energiekonfiguration erfolgreich angewendet";
                    WorkingProgress = LastOperationResult;
                    await RefreshAsync();
                }
                else
                {
                    LastOperationResult = "❌ Kiosk-Konfiguration fehlgeschlagen";
                    WorkingProgress = LastOperationResult;
                }

                _logger.LogInformation("Kiosk-Energiekonfiguration abgeschlossen");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Kiosk-Energiekonfiguration");
                LastOperationResult = $"❌ Fehler: {ex.Message}";
                WorkingProgress = LastOperationResult;
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private async Task SetHighPerformanceAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "⚡ Setze High Performance Power Plan...";

            try
            {
                var result = await _powerService.SetHighPerformancePlanAsync();

                if (result != null)
                {
                    LastOperationResult = "✅ High Performance Plan aktiviert";
                    WorkingProgress = LastOperationResult;
                    await RefreshAsync();
                }
                else
                {
                    LastOperationResult = "❌ High Performance Plan Aktivierung fehlgeschlagen";
                    WorkingProgress = LastOperationResult;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim High Performance Plan");
                LastOperationResult = $"❌ Fehler: {ex.Message}";
                WorkingProgress = LastOperationResult;
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private async Task DisableHibernationAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "❄️ Deaktiviere Hibernation...";

            try
            {
                var result = await _powerService.DisableHibernationAsync();

                if (result != null)
                {
                    LastOperationResult = "✅ Hibernation deaktiviert";
                    WorkingProgress = LastOperationResult;
                    await RefreshAsync();
                }
                else
                {
                    LastOperationResult = "❌ Hibernation-Deaktivierung fehlgeschlagen";
                    WorkingProgress = LastOperationResult;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Hibernation-Deaktivierung");
                LastOperationResult = $"❌ Fehler: {ex.Message}";
                WorkingProgress = LastOperationResult;
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private async Task DisableScreensaverAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "🖥️ Deaktiviere Screensaver...";

            try
            {
                var result = await _powerService.DisableScreensaverAsync();

                if (result != null)
                {
                    LastOperationResult = "✅ Screensaver deaktiviert";
                    WorkingProgress = LastOperationResult;
                    await RefreshAsync();
                }
                else
                {
                    LastOperationResult = "❌ Screensaver-Deaktivierung fehlgeschlagen";
                    WorkingProgress = LastOperationResult;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Screensaver-Deaktivierung");
                LastOperationResult = $"❌ Fehler: {ex.Message}";
                WorkingProgress = LastOperationResult;
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private async Task RestoreDefaultsAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "🔄 Stelle Standard-Energieeinstellungen wieder her...";

            try
            {
                var result = await _powerService.RestoreDefaultPowerSettingsAsync();

                if (result != null)
                {
                    LastOperationResult = "✅ Standard-Einstellungen wiederhergestellt";
                    WorkingProgress = LastOperationResult;
                    await RefreshAsync();
                }
                else
                {
                    LastOperationResult = "❌ Wiederherstellung fehlgeschlagen";
                    WorkingProgress = LastOperationResult;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Einstellungs-Wiederherstellung");
                LastOperationResult = $"❌ Fehler: {ex.Message}";
                WorkingProgress = LastOperationResult;
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private void ShowPowerDetails()
        {
            var details = "=== AKTUELLE ENERGIE-KONFIGURATION ===\n\n";

            if (CurrentPowerInfo != null)
            {
                details += $"Energieplan: {CurrentPowerInfo.PowerPlanName}\n";
                details += $"Kiosk-optimiert: {(CurrentPowerInfo.IsKioskOptimized ? "Ja" : "Nein")}\n";
                details += $"Hibernation: {(CurrentPowerInfo.HibernationEnabled ? "Aktiviert" : "Deaktiviert")}\n";
                details += $"Screensaver: {(CurrentPowerInfo.ScreensaverActive ? "Aktiviert" : "Deaktiviert")}\n";
                details += $"USB Selective Suspend: {(CurrentPowerInfo.UsbSelectiveSuspendEnabled ? "Aktiviert" : "Deaktiviert")}\n\n";
                details += $"Timeouts:\n";
                details += $"• Monitor: {FormatTimeout(CurrentPowerInfo.MonitorTimeoutAC)}\n";
                details += $"• Festplatte: {FormatTimeout(CurrentPowerInfo.DiskTimeoutAC)}\n";
                details += $"• Standby: {FormatTimeout(CurrentPowerInfo.StandbyTimeoutAC)}\n";
                details += $"• Hibernation: {FormatTimeout(CurrentPowerInfo.HibernateTimeoutAC)}\n";
            }
            else
            {
                details += "Energieplan: Keine Informationen verfügbar\n";
            }

            if (!string.IsNullOrEmpty(LastOperationResult))
            {
                details += $"\nLetzte Operation: {LastOperationResult}\n";
            }

            System.Windows.MessageBox.Show(details, "Energie-Details",
                System.Windows.MessageBoxButton.OK,
                System.Windows.MessageBoxImage.Information);
        }

        // === HILFSMETHODEN ===

        private static string FormatTimeout(int minutes)
        {
            return minutes == 0 ? "Deaktiviert" : 
                   minutes == int.MaxValue ? "Unbekannt" : 
                   $"{minutes} Minuten";
        }

        // === CLEANUP ===

        public void Dispose()
        {
            // Cleanup falls erforderlich
        }
    }
}