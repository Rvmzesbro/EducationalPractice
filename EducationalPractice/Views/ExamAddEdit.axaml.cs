using Avalonia;
using Avalonia.Controls;
using Avalonia.Data;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using System;
using System.Linq;
using System.Xml.Linq;

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

    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBDate.Text) || string.IsNullOrWhiteSpace(TBAuditorium.Text) || string.IsNullOrWhiteSpace(TBEstimation.Text) || CBDiscipline.SelectedItem == null || CBEmployee.SelectedItem == null || CBStudent.SelectedItem == null || TBAuditorium.Text.Count() > 20 || TBEstimation.Text.Count() > 1)
        {
            return;
        }
        else
        {
            if (!DateOnly.TryParse(TBDate.Text, out DateOnly result)) return;
            if(exam == null)
            {
                var new_exam = new Exam()
                {
                    Date = DateOnly.Parse(TBDate.Text),
                    DisciplineId = CBDiscipline.SelectedIndex + 1,
                    StudentId = CBStudent.SelectedIndex + 1,
                    EmployeeId = CBEmployee.SelectedIndex + 1,
                    Auditorium = TBAuditorium.Text,
                    Estimation = TBEstimation.Text
                };
                await App.db.Exams.AddAsync(new_exam);
            }
            else
            {
                exam.Date = DateOnly.Parse(TBDate.Text);
            }
            await App.db.SaveChangesAsync();
            this.Close();
        }
    }
}