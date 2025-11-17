using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using System;
using System.Linq;

namespace EducationalPractice;

public partial class Admin : UserControl
{
    public Employee employee { get; set; }
    public Admin(Employee selected_employee)
    {
        InitializeComponent();
        employee = selected_employee;
        DataContext = employee;
        Bindings();
    }

    private void Bindings()
    {
        DGEmployee.ItemsSource = App.db.Employees.ToList();
        DGStudent.ItemsSource = App.db.Students.ToList();
        DGDiscipline.ItemsSource = App.db.Disciplines.ToList();
        DGExam.ItemsSource = App.db.Exams.ToList();
    }

    private void BTProfile_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {

    }

    private void BTLogout_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {

    }

    private void TBSearch_TextChanged(object? sender, TextChangedEventArgs e)
    {

    }

    private void CBFilter_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {

    }

    private void TIEmployee_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {

    }

    private void DGEmployee_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {

    }

    private void TIStudent_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
    }

    private void DGStudent_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
    }

    private void TIDiscipline_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
    }

    private void DGDiscipline_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
    }

    private void TIExam_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
    }

    private void DGExam_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
    }

    private void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
    }

    private void BTRemove_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
    }
}