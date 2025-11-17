using Avalonia.Controls;
namespace EducationalPractice
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            App.MainWindow = this;
            MyContent.Content = new Main();
        }
    }
}