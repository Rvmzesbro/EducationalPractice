using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Teacher
{
    public int Id { get; set; }

    public short? TabNumber { get; set; }

    public string? Rank { get; set; }

    public string? Degree { get; set; }
}
