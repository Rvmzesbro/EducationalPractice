using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Country
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? Capital { get; set; }

    public decimal? Square { get; set; }

    public int? Population { get; set; }

    public string? Continent { get; set; }
}
