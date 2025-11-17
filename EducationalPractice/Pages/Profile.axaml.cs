using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Tmds.DBus.Protocol;

namespace EducationalPractice;

public partial class Profile : UserControl
{
    public Employee employee { get; set; }
    public Profile(Employee selected_employee)
    {
        InitializeComponent();
        employee = selected_employee;
        DataContext = employee;
    }

    private void BTBack_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.MyContent.Content = new Admin(employee);
    }

    private async void BTEdit_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        var TransitionView = new EditProfile(employee);
        var parent = this.VisualRoot as Window;
        await TransitionView.ShowDialog(parent);

        DataContext = null;
        DataContext = employee;
    }
}