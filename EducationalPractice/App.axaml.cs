using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using HarfBuzzSharp;
using Microsoft.EntityFrameworkCore;
using System.Net.NetworkInformation;
using Application = Avalonia.Application;

namespace EducationalPractice
{
    public partial class App : Application
    {
        public static MainWindow MainWindow;
        public static AppDbContext db {  get; set; } = new AppDbContext();
        public override void Initialize()
        {
            AvaloniaXamlLoader.Load(this);
        }

        public override void OnFrameworkInitializationCompleted()
        {
            if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
            {
                desktop.MainWindow = new MainWindow();
            }

            base.OnFrameworkInitializationCompleted();
        }
    }
}