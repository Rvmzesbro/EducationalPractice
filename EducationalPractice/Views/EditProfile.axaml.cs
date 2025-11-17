using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Xml.Linq;

namespace EducationalPractice;

public partial class EditProfile : Window
{
    public Employee employee {  get; set; }
    public EditProfile(Employee selected_employee)
    {
        InitializeComponent();
        employee = selected_employee;
        DataContext = selected_employee;
    }
    private async void BTEdit_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBFullName.Text) || string.IsNullOrWhiteSpace(TBLogin.Text) || string.IsNullOrWhiteSpace(TBPassword.Text) || !TBLogin.Text.Contains('@') || !TBLogin.Text.Contains('.'))
        {
            return;
        }
        else
        {
            bool IsEmail = await App.db.Employees.AnyAsync(p => p.Login.ToLower() == TBLogin.Text.ToLower() && p.Id != employee.Id);
            if (IsEmail)
            {
                return;
            }
            else
            {
                if (employee != null)
                {
                    App.db.Update(employee);
                }
                await App.db.SaveChangesAsync();
                this.Close();
            }
        }
    }
}