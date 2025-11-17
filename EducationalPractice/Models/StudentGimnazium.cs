using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class StudentGimnazium
{
    public int Id { get; set; }

    public string Surname { get; set; } = null!;

    public string Subject { get; set; } = null!;

    public string School { get; set; } = null!;

    public decimal? Point { get; set; }
}
