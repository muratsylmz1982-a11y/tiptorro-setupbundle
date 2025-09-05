using Microsoft.Extensions.DependencyInjection;
using SetupManager.WPF.ViewModels;
using System.Windows;

namespace SetupManager.WPF
{
    public partial class MainWindow : Window
    {
        public MainViewModel ViewModel { get; }

        public MainWindow(MainViewModel viewModel)
        {
            InitializeComponent();
            
            // ViewModel über Dependency Injection erhalten
            ViewModel = viewModel;
            DataContext = ViewModel;
            
            // Window-Events abonnieren
            Loaded += MainWindow_Loaded;
            Closing += MainWindow_Closing;
        }

        private async void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                // Initiale Datenladung
                await ViewModel.RefreshAllCommand.ExecuteAsync(null);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Fehler beim Laden der Anwendung: {ex.Message}", 
                               "Initialisierungsfehler", 
                               MessageBoxButton.OK, 
                               MessageBoxImage.Warning);
            }
        }

        private void MainWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            try
            {
                // ViewModel ordnungsgemäß freigeben
                ViewModel?.Dispose();
            }
            catch (Exception ex)
            {
                // Fehler beim Cleanup nicht kritisch - nur loggen
                System.Diagnostics.Debug.WriteLine($"Cleanup-Fehler: {ex.Message}");
            }
        }
    }
}