using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Linq;

namespace EducationalPractice;

public partial class ManagerStudent : UserControl
{
    public Employee employee { get; set; }
    public ManagerStudent(Employee selected_employee)
    {
        InitializeComponent();
        Bindings();
        employee = selected_employee;
        DataContext = employee;
    }
    private void Filter()
    {
        if (TIStudent.IsSelected)
        {
            if (DGStudent == null) return;
            var searchText = TBSearch.Text?.ToLower() ?? string.Empty;
            var selectedNumber = CBNumber.SelectedItem?.ToString().ToLower();
            var allEmployee = App.db.Students.ToList();

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                allEmployee = allEmployee.Where(p => p.FullName?.ToLower().Contains(searchText) == true).ToList();
            }
            if (selectedNumber != null)
            {
                allEmployee = allEmployee.Where(p => p.Number == selectedNumber).ToList();
            }

            DGStudent.ItemsSource = allEmployee;
        }

    }

    private void Bindings()
    {
        DGStudent.ItemsSource = App.db.Students.ToList();
        CBNumber.ItemsSource = App.db.Students.Where(p => !string.IsNullOrWhiteSpace(p.Number)).Select(p => p.Number).Distinct().ToList();
        Filter();
    }

    private void BTProfile_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.MyContent.Content = new Profile(employee);
    }

    private void BTLogout_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.MyContent.Content = new Main();
    }

    private void TBSearch_TextChanged(object? sender, TextChangedEventArgs e)
    {
        Filter();
    }

    private void CBFilter_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {
        Filter();
    }


    private async void DGStudent_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if (DGStudent.SelectedItem is Student student)
        {
            var TransitionView = new StudentAddEdit(student);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }


    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (TIStudent.IsSelected)
        {
            var TransitionView = new StudentAddEdit(null);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void BTRemove_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (TIStudent.IsSelected)
        {
            if (DGStudent.SelectedItem is Student DeleteStudent)
            {
                App.db.Students.Remove(DeleteStudent);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
    }

    private void CBCode_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {
        Filter();
    }

    private void CBPost_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {
        Filter();
    }

    private void BTClear_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        CBNumber.Clear();
    }
}