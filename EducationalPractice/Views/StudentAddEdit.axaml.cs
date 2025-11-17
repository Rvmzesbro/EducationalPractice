using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;

namespace EducationalPractice;

public partial class StudentAddEdit : Window
{
    public Student student;
    public StudentAddEdit(Student selected_student)
    {
        InitializeComponent();
        student = selected_student;
        DataContext = student;
    }

    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBFullName.Text) || string.IsNullOrWhiteSpace(TBNumber.Text))
        {
            return;
        }
        else
        {
            if(student == null)
            {
                var new_student = new Student()
                {
                    FullName = TBFullName.Text,
                    Number = TBNumber.Text
                };

                await App.db.Students.AddAsync(new_student);
            }
            
            await App.db.SaveChangesAsync();
            this.Close();
        }
    }
}