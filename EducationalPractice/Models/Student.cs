using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Student
{
    public int Id { get; set; }

    public string? Number { get; set; }

    public string? FullName { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();
}
