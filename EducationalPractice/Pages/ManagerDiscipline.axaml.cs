using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Linq;

namespace EducationalPractice;

public partial class ManagerDiscipline : UserControl
{
    public Employee employee {  get; set; }
    public ManagerDiscipline(Employee selected_employee)
    {
        InitializeComponent();
        Bindings();
        employee = selected_employee;
        DataContext = employee;
    }

    private void Filter()
    {
        if (TIDiscipline.IsSelected)
        {
            if (DGDiscipline == null) return;
            var searchText = TBSearch.Text?.ToLower() ?? string.Empty;
            var selectedVolume = CBVolume.SelectedItem?.ToString().ToLower();
            var selectedExecutor = CBExecutor.SelectedItem?.ToString().ToLower();
            var allEmployee = App.db.Disciplines.ToList();

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                allEmployee = allEmployee.Where(p => p.Name?.ToLower().Contains(searchText) == true).ToList();
            }

            if (selectedVolume != null)
            {
                allEmployee = allEmployee.Where(p => p.Volume.ToString() == selectedVolume).ToList();
            }

            if (selectedExecutor != null)
            {
                allEmployee = allEmployee.Where(p => p.Executor == selectedExecutor).ToList();
            }

            DGDiscipline.ItemsSource = allEmployee;
        }

    }

    private void Bindings()
    {
        DGDiscipline.ItemsSource = App.db.Disciplines.ToList();
        CBVolume.ItemsSource = App.db.Disciplines.Where(p => !string.IsNullOrWhiteSpace(p.Volume.ToString())).Select(p => p.Volume).Distinct().ToList();
        CBExecutor.ItemsSource = App.db.Disciplines.Where(p => !string.IsNullOrWhiteSpace(p.Executor)).Select(p => p.Executor).Distinct().ToList();
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


    private async void DGDiscipline_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if (DGDiscipline.SelectedItem is Discipline discipline)
        {
            var TransitionView = new DisciplineAddEdit(discipline);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }


    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (TIDiscipline.IsSelected)
        {
            var TransitionView = new DisciplineAddEdit(null);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void BTRemove_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (TIDiscipline.IsSelected)
        {
            if (DGDiscipline.SelectedItem is Discipline DeleteDiscipline)
            {
                App.db.Disciplines.Remove(DeleteDiscipline);
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
        CBVolume.Clear();
        CBExecutor.Clear();
    }
}