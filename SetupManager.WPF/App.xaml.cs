using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using SetupManager.Core.Interfaces;
using SetupManager.Services;
using SetupManager.WPF.ViewModels;
using System.Windows;

namespace SetupManager.WPF
{
    public partial class App : Application
    {
        private IHost? _host;

        protected override void OnStartup(StartupEventArgs e)
        {
            // Host-Builder für Dependency Injection konfigurieren
            _host = Host.CreateDefaultBuilder()
                .ConfigureServices((context, services) =>
                {
                    // === LOGGING KONFIGURATION ===
                    services.AddLogging(builder =>
                    {
                        builder.AddConsole();
                        builder.AddDebug();
                        builder.SetMinimumLevel(LogLevel.Information);
                    });

                    // === CORE SERVICES REGISTRIERUNG ===
                    // M2 Services als Singletons registrieren
                    services.AddSingleton<IDeviceManager, DeviceManagerService>();
                    services.AddSingleton<IPrinterService, PrinterService>();
                    services.AddSingleton<IPowerService, PowerService>();

                    // === VIEWMODELS REGISTRIERUNG ===
                    // ViewModels als Transient (neue Instanz bei jeder Anfrage)
                    services.AddTransient<MainViewModel>();
                    services.AddTransient<DeviceManagerViewModel>();
                    services.AddTransient<PrinterServiceViewModel>();
                    services.AddTransient<PowerServiceViewModel>();

                    // === WINDOWS REGISTRIERUNG ===
                    services.AddTransient<MainWindow>();
                })
                .Build();

            // Host starten
            _host.Start();

            // MainWindow mit DI erstellen und anzeigen
            var mainWindow = _host.Services.GetRequiredService<MainWindow>();
            mainWindow.Show();

            base.OnStartup(e);
        }

        protected override void OnExit(ExitEventArgs e)
        {
            // Host ordnungsgemäß herunterfahren
            _host?.Dispose();
            base.OnExit(e);
        }

        /// <summary>
        /// Statischer Zugriff auf Services für ViewModels
        /// </summary>
        public static T GetService<T>() where T : notnull
        {
            if (Current is App app && app._host != null)
            {
                return app._host.Services.GetRequiredService<T>();
            }
            throw new InvalidOperationException("Host ist nicht initialisiert.");
        }
    }
}