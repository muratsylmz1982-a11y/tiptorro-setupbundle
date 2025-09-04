using System.Windows;
using System.Windows.Controls;

namespace SetupManager.WPF;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }

    private void TestServicesButton_Click(object sender, RoutedEventArgs e)
    {
        var button = sender as Button;
        button!.Content = "Clicked!";

        MessageBox.Show("🎉 M3 GUI läuft!\n\n" +
                       "✅ WPF Application erfolgreich\n" +
                       "✅ UI-Framework funktioniert\n" +
                       "✅ Bereit für Service-Integration!\n\n" +
                       "Next: Interface-Kompatibilität prüfen",
                       "M3 Test erfolgreich", 
                       MessageBoxButton.OK, 
                       MessageBoxImage.Information);

        button.Content = "Test Services";
    }
}