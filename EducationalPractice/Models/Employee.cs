using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Employee
{
    public int Id { get; set; }

    public string? Code { get; set; }

    public string? FullName { get; set; }

    public string? Post { get; set; }

    public decimal? Salary { get; set; }

    public short? Director { get; set; }

    public int? RoleId { get; set; }

    public string? Login { get; set; }

    public string? Password { get; set; }

    public virtual ICollection<Exam> Exams { get; set; } = new List<Exam>();

    public virtual Role? Role { get; set; }
}
