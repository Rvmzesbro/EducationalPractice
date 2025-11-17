using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Discipline
{
    public int Id { get; set; }

    public short? Volume { get; set; }

    public string? Name { get; set; }

    public string? Executor { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();
}
