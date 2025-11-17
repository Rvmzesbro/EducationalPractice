using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Avalonia.Media;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Xml.Linq;

namespace EducationalPractice;

public partial class Registration : UserControl
{
    public Registration()
    {
        InitializeComponent();
    }

    private void BTBack_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.MyContent.Content = new Main();
    }

    private void TBFullName_GotFocus(object? sender, Avalonia.Input.GotFocusEventArgs e)
    {
        if (TBFullName.Text == "Enter your fullname" || TBFullName.Text == "FullName incorected")
        {
            TBFullName.Text = "";
            TBFullName.Foreground = new SolidColorBrush(Color.Parse("#7a86a2"));
        }
    }

    private void TBFullName_LostFocus(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBFullName.Text))
        {
            TBFullName.Text = "Enter your fullname";
        }
    }

    private void TBLogin_GotFocus(object? sender, Avalonia.Input.GotFocusEventArgs e)
    {
        if (TBLogin.Text == "Enter your email" || TBLogin.Text == "Email incorected")
        {
            TBLogin.Text = "";
            TBLogin.Foreground = new SolidColorBrush(Color.Parse("#7a86a2"));
        }
    }

    private void TBLogin_LostFocus(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBLogin.Text))
        {
            TBLogin.Text = "Enter your email";
        }
    }

    private void TBPassword_GotFocus(object? sender, Avalonia.Input.GotFocusEventArgs e)
    {
        if (TBPassword.Text == "Enter your password" || TBPassword.Text == "Password incorected")
        {
            TBPassword.Text = "";
            TBPassword.PasswordChar = '*';
            TBPassword.Foreground = new SolidColorBrush(Color.Parse("#7a86a2"));
        }
    }

    private void TBPassword_LostFocus(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBPassword.Text))
        {
            TBPassword.Text = "Enter your password";
            TBPassword.PasswordChar = '\0';
        }
    }

    private async void BTSignGoogle_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBLogin.Text) || string.IsNullOrWhiteSpace(TBPassword.Text) || !TBLogin.Text.Contains('@') || !TBLogin.Text.Contains('.')
            || string.IsNullOrWhiteSpace(TBFullName.Text))
        {
            TBLogin.Text = "Email incorected";
            TBLogin.Foreground = new SolidColorBrush(Color.Parse("#800000"));
            TBPassword.Text = "Password incorected";
            TBPassword.Foreground = new SolidColorBrush(Color.Parse("#800000"));
            TBPassword.PasswordChar = '\0';
            TBFullName.Text = "FullName incorected";
            TBFullName.Foreground = new SolidColorBrush(Color.Parse("#800000"));
            return;
        }
        else
        {
            bool IsEmail = await App.db.Employees.AnyAsync(p => p.Login.ToLower() == TBLogin.Text.ToLower() && p.Login != null);
            if (IsEmail)
            {
                TBLogin.Text = "Email incorected";
                TBLogin.Foreground = new SolidColorBrush(Color.Parse("#800000"));
                return;
            }
            else
            {
                var employee = new Employee()
                {
                    Code = null,
                    FullName = TBFullName.Text,
                    Post = null,
                    Salary = null,
                    Director = null,
                    RoleId = 3,
                    Login = TBLogin.Text,
                    Password = TBPassword.Text
                };

                await App.db.Employees.AddAsync(employee);
                await App.db.SaveChangesAsync();
                App.MainWindow.MyContent.Content = new Main();
            }
        }
    }
}