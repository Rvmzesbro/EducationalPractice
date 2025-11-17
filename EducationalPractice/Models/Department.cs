using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Department
{
    public int Id { get; set; }

    public string? Code { get; set; }

    public string? Name { get; set; }

    public string? Faculty { get; set; }
}
