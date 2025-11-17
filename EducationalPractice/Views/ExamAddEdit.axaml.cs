using Avalonia;
using Avalonia.Controls;
using Avalonia.Data;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using System;
using System.Linq;

namespace EducationalPractice;

public partial class ExamAddEdit : Window
{
    public Exam exam { get; set; }
    public ExamAddEdit(Exam selected_exam)
    {
        InitializeComponent();
        Bindings();
        exam = selected_exam;
        DataContext = exam;
    }

    private void Bindings()
    {
        CBDiscipline.ItemsSource = App.db.Disciplines.ToList();
        CBStudent.ItemsSource = App.db.Students.ToList();
        CBEmployee.ItemsSource = App.db.Employees.ToList();
    }

    private void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {

    }
}