using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Diagnostics;
using System.Linq;

namespace EducationalPractice;

public partial class Admin : UserControl
{
    public Employee employee { get; set; }
    public Admin(Employee selected_employee)
    {
        InitializeComponent();
        Bindings();
        employee = selected_employee;
        DataContext = employee;
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
        App.MainWindow.MyContent.Content = new Profile(employee);
    }

    private void BTLogout_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        App.MainWindow.MyContent.Content = new Main();
    }

    private void TBSearch_TextChanged(object? sender, TextChangedEventArgs e)
    {

    }

    private void CBFilter_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {

    }

    private async void DGEmployee_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if(DGEmployee.SelectedItem is Employee employee)
        {
            var TransitionView = new EmployeeAddEdit(employee);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void DGStudent_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if(DGStudent.SelectedItem is Student student)
        {
            var TransitionView = new StudentAddEdit(student);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void DGDiscipline_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if(DGDiscipline.SelectedItem is Discipline discipline)
        {
            var TransitionView = new DisciplineAddEdit(discipline);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
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
        if (TIEmployee.IsSelected)
        {
            var TransitionView = new EmployeeAddEdit(null);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
        if (TIStudent.IsSelected)
        {
            var TransitionView = new StudentAddEdit(null);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
        if (TIDiscipline.IsSelected)
        {
            var TransitionView = new DisciplineAddEdit(null);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
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
        if (TIEmployee.IsSelected)
        {
            if(DGEmployee.SelectedItem is Employee DeleteEmployee)
            {
                App.db.Employees.Remove(DeleteEmployee);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
        if (TIStudent.IsSelected)
        {
            if(DGStudent.SelectedItem is Student DeleteStudent)
            {
                App.db.Students.Remove(DeleteStudent);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
        if (TIDiscipline.IsSelected)
        {
            if(DGDiscipline.SelectedItem is Discipline DeleteDiscipline)
            {
                App.db.Disciplines.Remove(DeleteDiscipline);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
        if (TIExam.IsSelected)
        {
            if(DGExam.SelectedItem is Exam DeleteExam)
            {
                App.db.Exams.Remove(DeleteExam);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
    }
}