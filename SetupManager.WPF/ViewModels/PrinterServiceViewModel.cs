using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Core.Models;
using System.Collections.ObjectModel;

namespace SetupManager.WPF.ViewModels
{
    public partial class PrinterServiceViewModel : ObservableObject, IDisposable
    {
        private readonly IPrinterService _printerService;
        private readonly ILogger _logger;

        // === OBSERVABLE PROPERTIES ===

        [ObservableProperty]
        private ObservableCollection<PrinterInfo> _uninstalledPrinters = new();

        [ObservableProperty]
        private ObservableCollection<PrinterInfo> _installedPrinters = new();

        [ObservableProperty]
        private string _spoolerStatus = "Unbekannt";

        [ObservableProperty]
        private int _totalUninstalled = 0;

        [ObservableProperty]
        private int _totalInstalled = 0;

        [ObservableProperty]
        private bool _isWorking = false;

        [ObservableProperty]
        private string _workingProgress = "";

        [ObservableProperty]
        private PrinterInfo? _selectedPrinter;

        [ObservableProperty]
        private string _lastTestResult = "";

        public PrinterServiceViewModel(IPrinterService printerService, ILogger logger)
        {
            _printerService = printerService;
            _logger = logger;
        }

        // === COMMANDS ===

        [RelayCommand]
        public async Task RefreshAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "Aktualisiere Drucker-Status...";

            try
            {
                _logger.LogInformation("PrinterService: Aktualisiere Drucker-Status...");

                // Nicht installierte Drucker scannen (echte Interface-Methode)
                var uninstalled = await _printerService.ScanForUninstalledPrintersAsync();
                
                UninstalledPrinters.Clear();
                foreach (var printer in uninstalled)
                {
                    UninstalledPrinters.Add(printer);
                }

                // Installierte Drucker laden (echte Interface-Methode)
                var installed = await _printerService.GetInstalledPrintersAsync();
                
                InstalledPrinters.Clear();
                foreach (var printer in installed)
                {
                    InstalledPrinters.Add(printer);
                }

                // Statistiken aktualisieren
                TotalUninstalled = UninstalledPrinters.Count;
                TotalInstalled = InstalledPrinters.Count;

                // Spooler-Status prüfen (echte Interface-Methode)
                var spoolerRunning = await _printerService.IsSpoolerServiceRunningAsync();
                SpoolerStatus = spoolerRunning ? "✅ Aktiv" : "❌ Gestoppt";

                WorkingProgress = $"✅ {TotalInstalled} installiert, {TotalUninstalled} erkannt";

                _logger.LogInformation($"PrinterService: {TotalUninstalled} nicht installiert, {TotalInstalled} installiert");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Drucker-Status Update");
                SpoolerStatus = "❌ Fehler";
                WorkingProgress = $"❌ Fehler: {ex.Message}";
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand]
        private async Task InstallAllDetectedAsync()
        {
            if (IsWorking || UninstalledPrinters.Count == 0) return;

            IsWorking = true;
            var installedCount = 0;

            try
            {
                _logger.LogInformation("Starte Installation aller erkannten Drucker...");

                foreach (var printer in UninstalledPrinters.ToList())
                {
                    WorkingProgress = $"Installiere {printer.Name}...";

                    try
                    {
                        // Echte Interface-Methode verwenden
                        var result = await _printerService.InstallDetectedPrinterAsync(printer);

                        if (result)
                        {
                            installedCount++;
                            WorkingProgress = $"✅ {printer.Name} erfolgreich installiert";
                            _logger.LogInformation($"Drucker installiert: {printer.Name}");
                        }
                        else
                        {
                            WorkingProgress = $"❌ {printer.Name} Installation fehlgeschlagen";
                        }

                        // Kurze Pause zwischen Installationen
                        await Task.Delay(1000);
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, $"Fehler bei Installation von {printer.Name}");
                        WorkingProgress = $"❌ {printer.Name}: {ex.Message}";
                    }
                }

                WorkingProgress = $"✅ Installation abgeschlossen: {installedCount} von {UninstalledPrinters.Count} erfolgreich";
                
                // Status nach Installation aktualisieren
                await RefreshAsync();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler bei Batch-Installation");
                WorkingProgress = $"❌ Batch-Installation fehlgeschlagen: {ex.Message}";
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand(CanExecute = nameof(CanInstallSelected))]
        private async Task InstallSelectedAsync()
        {
            if (SelectedPrinter == null || IsWorking) return;

            IsWorking = true;
            WorkingProgress = $"Installiere {SelectedPrinter.Name}...";

            try
            {
                _logger.LogInformation($"Installiere Drucker: {SelectedPrinter.Name}");

                // Echte Interface-Methode verwenden
                var result = await _printerService.InstallDetectedPrinterAsync(SelectedPrinter);

                if (result)
                {
                    WorkingProgress = $"✅ {SelectedPrinter.Name} erfolgreich installiert";
                    await RefreshAsync(); // Status aktualisieren
                }
                else
                {
                    WorkingProgress = $"❌ Installation von {SelectedPrinter.Name} fehlgeschlagen";
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Fehler bei Installation von {SelectedPrinter.Name}");
                WorkingProgress = $"❌ Fehler: {ex.Message}";
            }
            finally
            {
                IsWorking = false;
            }
        }

        private bool CanInstallSelected() => 
            SelectedPrinter != null && !IsWorking && UninstalledPrinters.Contains(SelectedPrinter);

        [RelayCommand(CanExecute = nameof(CanTestPrint))]
        private async Task TestPrintAsync()
        {
            if (SelectedPrinter == null || IsWorking) return;

            IsWorking = true;
            WorkingProgress = $"Führe Testdruck auf {SelectedPrinter.Name} aus...";

            try
            {
                _logger.LogInformation($"Führe Testdruck auf {SelectedPrinter.Name} aus");

                // Echte Interface-Methode verwenden
                var result = await _printerService.TestPrinterAsync(SelectedPrinter.Name);

                if (result)
                {
                    LastTestResult = $"✅ Testdruck auf {SelectedPrinter.Name} erfolgreich";
                    WorkingProgress = LastTestResult;
                }
                else
                {
                    LastTestResult = $"❌ Testdruck auf {SelectedPrinter.Name} fehlgeschlagen";
                    WorkingProgress = LastTestResult;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Fehler bei Testdruck auf {SelectedPrinter?.Name}");
                LastTestResult = $"❌ Testdruck-Fehler: {ex.Message}";
                WorkingProgress = LastTestResult;
            }
            finally
            {
                IsWorking = false;
            }
        }

        private bool CanTestPrint() => 
            SelectedPrinter != null && 
            !IsWorking &&
            InstalledPrinters.Any(p => p.Name == SelectedPrinter.Name);

        [RelayCommand]
        private async Task RestartSpoolerAsync()
        {
            if (IsWorking) return;

            IsWorking = true;
            WorkingProgress = "Starte Print Spooler neu...";

            try
            {
                _logger.LogInformation("Starte Print Spooler neu...");
                
                // Echte Interface-Methode verwenden
                var result = await _printerService.RestartSpoolerServiceAsync();
                
                if (result)
                {
                    SpoolerStatus = "✅ Neugestartet";
                    WorkingProgress = "✅ Print Spooler erfolgreich neugestartet";
                    
                    // Nach Neustart den Status aktualisieren
                    await Task.Delay(2000); // Kurz warten
                    await RefreshAsync();
                }
                else
                {
                    SpoolerStatus = "❌ Neustart fehlgeschlagen";
                    WorkingProgress = "❌ Print Spooler Neustart fehlgeschlagen";
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Fehler beim Spooler-Neustart");
                SpoolerStatus = "❌ Fehler";
                WorkingProgress = $"❌ Spooler-Fehler: {ex.Message}";
            }
            finally
            {
                IsWorking = false;
            }
        }

        [RelayCommand(CanExecute = nameof(CanSetAsDefault))]
        private async Task SetAsDefaultAsync()
        {
            if (SelectedPrinter == null || IsWorking) return;

            IsWorking = true;
            WorkingProgress = $"Setze {SelectedPrinter.Name} als Standarddrucker...";

            try
            {
                // Echte Interface-Methode verwenden
                var result = await _printerService.SetDefaultPrinterAsync(SelectedPrinter.Name);

                if (result)
                {
                    WorkingProgress = $"✅ {SelectedPrinter.Name} ist jetzt Standarddrucker";
                }
                else
                {
                    WorkingProgress = $"❌ Konnte {SelectedPrinter.Name} nicht als Standard setzen";
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Fehler beim Setzen von {SelectedPrinter.Name} als Standard");
                WorkingProgress = $"❌ Fehler: {ex.Message}";
            }
            finally
            {
                IsWorking = false;
            }
        }

        private bool CanSetAsDefault() =>
            SelectedPrinter != null &&
            !IsWorking &&
            InstalledPrinters.Any(p => p.Name == SelectedPrinter.Name);

        [RelayCommand]
        private void ShowPrinterDetails()
        {
            if (SelectedPrinter == null) return;

            var details = $"Drucker: {SelectedPrinter.Name}\n" +
                         $"Status: {SelectedPrinter.Status}\n" +
                         $"Installiert: {(InstalledPrinters.Any(p => p.Name == SelectedPrinter.Name) ? "Ja" : "Nein")}\n\n" +
                         $"Weitere Informationen:\n" +
                         $"Name: {SelectedPrinter.Name}";

            System.Windows.MessageBox.Show(details, "Drucker-Details",
                System.Windows.MessageBoxButton.OK,
                System.Windows.MessageBoxImage.Information);
        }

        // === PROPERTY CHANGE HANDLERS ===

        partial void OnSelectedPrinterChanged(PrinterInfo? value)
        {
            // Commands neu bewerten
            InstallSelectedCommand.NotifyCanExecuteChanged();
            TestPrintCommand.NotifyCanExecuteChanged();
            SetAsDefaultCommand.NotifyCanExecuteChanged();
        }

        partial void OnIsWorkingChanged(bool value)
        {
            // Commands neu bewerten wenn Working-Status sich ändert
            InstallSelectedCommand.NotifyCanExecuteChanged();
            TestPrintCommand.NotifyCanExecuteChanged();
            SetAsDefaultCommand.NotifyCanExecuteChanged();
        }

        // === CLEANUP ===

        public void Dispose()
        {
            // Cleanup falls erforderlich
        }
    }
}