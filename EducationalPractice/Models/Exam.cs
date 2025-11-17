using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Exam
{
    public int Id { get; set; }

    public DateOnly? Date { get; set; }

    public int? DisciplineId { get; set; }

    public int? StudentId { get; set; }

    public int? EmployeeId { get; set; }

    public string? Auditorium { get; set; }

    public string? Estimation { get; set; }

    public virtual Discipline? Discipline { get; set; }

    public virtual Employee? Employee { get; set; }

    public virtual Student? Student { get; set; }
}
