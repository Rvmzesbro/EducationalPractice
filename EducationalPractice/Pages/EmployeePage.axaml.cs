using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Linq;

namespace EducationalPractice;

public partial class EmployeePage : UserControl
{
    public Employee employee {  get; set; }
    public EmployeePage(Employee selected_employee)
    {
        InitializeComponent();
        employee = selected_employee;
        DataContext = employee;
        Bindings();
    }
    private void Filter()
    {

        if (TIExam.IsSelected)
        {
            if (DGExam == null) return;
            var selectedDate = CBDate.SelectedItem?.ToString().ToLower();
            var selectedDiscipline = CBDiscipline.SelectedItem as Discipline;
            var selectedStudent = CBStudent.SelectedItem as Student;
            var AllExam = App.db.Exams.Where(p => p.EmployeeId == employee.Id).ToList();

            if (selectedDate != null)
            {
                AllExam = AllExam.Where(p => p.Date.ToString() == selectedDate).ToList();
            }
            if (selectedDiscipline != null)
            {
                AllExam = AllExam.Where(p => p.DisciplineId == selectedDiscipline.Id).ToList();
            }
            if (selectedStudent != null)
            {
                AllExam = AllExam.Where(p => p.StudentId == selectedStudent.Id).ToList();
            }
            DGExam.ItemsSource = AllExam;
        }

    }

    private void Bindings()
    {
        if (App.db.Exams != null || employee != null)
        {
            DGExam.ItemsSource = App.db.Exams.Where(p => p.EmployeeId == employee.Id).ToList();
        }
        else
        {
            return;
        }
        CBDate.ItemsSource = App.db.Exams.Select(p => p.Date.ToString()).Distinct().ToList();
        CBDiscipline.ItemsSource = App.db.Disciplines.ToList();
        CBStudent.ItemsSource = App.db.Students.ToList();
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
        CBDate.Clear();
        CBStudent.Clear();
        CBDiscipline.Clear();
    }
}