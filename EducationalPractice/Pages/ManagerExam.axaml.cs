using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;

namespace EducationalPractice;

public partial class ManagerExam : UserControl
{
    public Employee employee { get; set; }
    public ManagerExam(Employee selected_employee)
    {
        InitializeComponent();
        employee = selected_employee;
        DataContext = employee;
    }
}