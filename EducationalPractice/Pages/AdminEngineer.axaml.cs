using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using System.Linq;

namespace EducationalPractice;

public partial class AdminEngineer : UserControl
{
    public Employee employee;
    public AdminEngineer(Employee selected_employee)
    {
        InitializeComponent();
        Bindings();
        employee = selected_employee;
        DataContext = employee;
    }

    private void Filter()
    {
        if (TIEmployee.IsSelected)
        {
            if (DGEmployee == null) return;
            var searchText = TBSearch.Text?.ToLower() ?? string.Empty;
            var selectedCode = CBCode.SelectedItem?.ToString().ToLower();
            var selectedPost = CBPost.SelectedItem?.ToString().ToLower();
            var allEmployee = App.db.Employees.ToList();

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                allEmployee = allEmployee.Where(p => p.FullName?.ToLower().Contains(searchText) == true).ToList();
            }
            if (selectedCode != null)
            {
                allEmployee = allEmployee.Where(p => p.Code == selectedCode).ToList();
            }
            if (selectedPost != null)
            {
                allEmployee = allEmployee.Where(p => p.Post == selectedPost).ToList();
            }

            DGEmployee.ItemsSource = allEmployee;
        }
        if (TIStudent.IsSelected)
        {
            if (DGStudent == null) return;
            var searchText = TBSearch.Text?.ToLower() ?? string.Empty;
            var selectedNumber = CBNumber.SelectedItem?.ToString().ToLower();
            var allEmployee = App.db.Students.ToList();

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                allEmployee = allEmployee.Where(p => p.FullName?.ToLower().Contains(searchText) == true).ToList();
            }
            if (selectedNumber != null)
            {
                allEmployee = allEmployee.Where(p => p.Number == selectedNumber).ToList();
            }

            DGStudent.ItemsSource = allEmployee;
        }
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
        DGEmployee.ItemsSource = App.db.Employees.Where(p => p.RoleId != 1 || p.RoleId == 6).ToList();
        DGStudent.ItemsSource = App.db.Students.ToList();
        DGDiscipline.ItemsSource = App.db.Disciplines.ToList();
        DGExam.ItemsSource = App.db.Exams.ToList();
        CBCode.ItemsSource = App.db.Employees.Where(p => !string.IsNullOrWhiteSpace(p.Code)).Select(p => p.Code).Distinct().ToList();
        CBPost.ItemsSource = App.db.Employees.Where(p => !string.IsNullOrWhiteSpace(p.Post)).Select(p => p.Post).Distinct().ToList();
        CBNumber.ItemsSource = App.db.Students.Where(p => !string.IsNullOrWhiteSpace(p.Number)).Select(p => p.Number).Distinct().ToList();
        CBVolume.ItemsSource = App.db.Disciplines.Where(p => !string.IsNullOrWhiteSpace(p.Volume.ToString())).Select(p => p.Volume).Distinct().ToList();
        CBExecutor.ItemsSource = App.db.Disciplines.Where(p => !string.IsNullOrWhiteSpace(p.Executor)).Select(p => p.Executor).Distinct().ToList();
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

    private void TBSearch_TextChanged(object? sender, TextChangedEventArgs e)
    {
        Filter();
    }

    private void CBFilter_SelectionChanged(object? sender, SelectionChangedEventArgs e)
    {
        Filter();
    }

    private async void DGEmployee_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if (DGEmployee.SelectedItem is Employee employee)
        {
            var TransitionView = new EmployeeAddEdit(employee);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
    }

    private async void DGStudent_DoubleTapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        if (DGStudent.SelectedItem is Student student)
        {
            var TransitionView = new StudentAddEdit(student);
            var parent = this.VisualRoot as Window;
            await TransitionView.ShowDialog(parent);
            Bindings();
        }
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
            if (DGEmployee.SelectedItem is Employee DeleteEmployee)
            {
                App.db.Employees.Remove(DeleteEmployee);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
        if (TIStudent.IsSelected)
        {
            if (DGStudent.SelectedItem is Student DeleteStudent)
            {
                App.db.Students.Remove(DeleteStudent);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
        if (TIDiscipline.IsSelected)
        {
            if (DGDiscipline.SelectedItem is Discipline DeleteDiscipline)
            {
                App.db.Disciplines.Remove(DeleteDiscipline);
                await App.db.SaveChangesAsync();
                Bindings();
            }
        }
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
        TBSearch.Opacity = 0.0;
    }

    private void TIDiscipline_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        TBSearch.Opacity = 1.0;
    }

    private void TIStudent_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        TBSearch.Opacity = 1.0;
    }

    private void TIEmployee_Tapped(object? sender, Avalonia.Input.TappedEventArgs e)
    {
        TBSearch.Opacity = 1.0;
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
        CBCode.Clear();
        CBPost.Clear();
        CBNumber.Clear();
        CBVolume.Clear();
        CBExecutor.Clear();
        CBDate.Clear();
        CBStudent.Clear();
        CBDiscipline.Clear();
        CBEmployee.Clear();
    }
}