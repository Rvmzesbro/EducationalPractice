using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;

namespace EducationalPractice;

public partial class ManagerDiscipline : UserControl
{
    public Employee employee {  get; set; }
    public ManagerDiscipline(Employee selected_employee)
    {
        InitializeComponent();
        employee = selected_employee;
        DataContext = employee;
    }
}