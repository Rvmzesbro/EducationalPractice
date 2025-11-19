using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Linq;

namespace EducationalPractice;

public partial class ManagerExam : UserControl
{
    public Employee employee { get; set; }
    public ManagerExam(Employee selected_employee)
    {
        InitializeComponent();
        Bindings();
        employee = selected_employee;
        DataContext = employee;
    }

    private void Filter()
    {
        
        if (TIExam.IsSelected)
        {
            if (DGExam == null) return;
            var selectedDate = CBDate.SelectedItem?.ToString().ToLower();
            var selectedDiscipline = CBDiscipline.SelectedItem as Discipline;
            var selectedStudent = CBStudent.SelectedItem as Student;
            var selectedEmployee = CBEmployee.SelectedItem as Employee;
            var AllExam = App.db.Exams.ToList();

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
            if (selectedEmployee != null)
            {
                AllExam = AllExam.Where(p => p.EmployeeId == selectedEmployee.Id).ToList();
            }
            DGExam.ItemsSource = AllExam;
        }

    }

    private void Bindings()
    {
        DGExam.ItemsSource = App.db.Exams.ToList();
        CBDate.ItemsSource = App.db.Exams.Select(p => p.Date.ToString()).Distinct().ToList();
        CBDiscipline.ItemsSource = App.db.Disciplines.ToList();
        CBStudent.ItemsSource = App.db.Students.ToList();
        CBEmployee.ItemsSource = App.db.Employees.ToList();
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
    

   

    private async void DGExam_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if (DGExam.SelectedItem is Exam exam)
        {
            var TransitionView = new ExamAddEdit(exam);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (TIExam.IsSelected)
        {
            var TransitionView = new ExamAddEdit(null);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void BTRemove_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (TIExam.IsSelected)
        {
            if (DGExam.SelectedItem is Exam DeleteExam)
            {
                App.db.Exams.Remove(DeleteExam);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
    }

    private void TIExam_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        
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
        CBEmployee.Clear();
    }
}