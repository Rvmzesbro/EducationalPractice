using Avalonia;
using Avalonia.Controls;
using Avalonia.Layout;
using Avalonia.Markup.Xaml;
using Avalonia.Media;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Net;
using System.Xml.Linq;

namespace EducationalPractice;

public partial class EmployeeAddEdit : Window
{
    public Employee employee;
    public short director;
    public EmployeeAddEdit(Employee selected_employee)
    {
        InitializeComponent();
        Bindings();
        employee = selected_employee;
        if (employee == null) return;
        DataContext = employee;
    }

    private void Bindings()
    {
        CBRole.ItemsSource = App.db.Roles.ToList();
    }

    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBLogin.Text) || string.IsNullOrWhiteSpace(TBPassword.Text) || CBRole.SelectedItem == null || string.IsNullOrWhiteSpace(TBSalary.Text) || string.IsNullOrWhiteSpace(TBFullName.Text) || !TBLogin.Text.Contains('@') || !TBLogin.Text.Contains('.'))
        {
            return;
        }
        else
        {
            if (!decimal.TryParse(TBSalary.Text, out decimal result)) return;


            if (employee == null)
            {
                bool IsEmail = await App.db.Employees.AnyAsync(p => p.Login.ToLower() == TBLogin.Text.ToLower() && p.Login != null);
                if (IsEmail)
                {
                    return;
                }
                if (TBDirector.Text != null)
                {
                    director = short.Parse(TBDirector.Text);
                }
                else
                {
                    director = 0;
                }

                var new_employee = new Employee()
                {
                    Code = TBCode.Text,
                    FullName = TBFullName.Text,
                    Post = TBPost.Text,
                    Salary = decimal.Parse(TBSalary.Text),
                    Director = director,
                    RoleId = CBRole.SelectedIndex + 1,
                    Login = TBLogin.Text,
                    Password = TBPassword.Text
                };

                await App.db.Employees.AddAsync(new_employee);
            }
            else
            {
                bool IsEmail1 = await App.db.Employees.AnyAsync(p => p.Login.ToLower() == TBLogin.Text.ToLower() && p.Login != null && p.Id != employee.Id);
                if (IsEmail1)
                {
                    return;
                }
                App.db.Employees.Update(employee);
            }

            await App.db.SaveChangesAsync();
            this.Close();
        }

    }
}