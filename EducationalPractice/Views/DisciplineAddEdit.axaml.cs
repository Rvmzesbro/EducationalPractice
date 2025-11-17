using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using EducationalPractice.Models;
using System.Linq;

namespace EducationalPractice;

public partial class DisciplineAddEdit : Window
{
    public Discipline discipline { get; set; }
    public DisciplineAddEdit(Discipline selected_discipline)
    {
        InitializeComponent();
        discipline = selected_discipline;
        DataContext = discipline;
    }

    private async void BTAdd_Click(object? sender, Avalonia.Interactivity.RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TBName.Text) || string.IsNullOrWhiteSpace(TBVolume.Text) || string.IsNullOrWhiteSpace(TBExecutor.Text) || TBExecutor.Text.Count() > 2 || TBName.Text.Count() > 100)
        {
            return;
        }
        else
        {
            if (!short.TryParse(TBVolume.Text, out short result)) return;
            if (discipline == null)
            {
                var new_discipline = new Discipline()
                {
                    Name = TBName.Text,
                    Volume = short.Parse(TBVolume.Text),
                    Executor = TBExecutor.Text
                };

                await App.db.Disciplines.AddAsync(new_discipline);
            }

            await App.db.SaveChangesAsync();
            this.Close();
        }
    }
}