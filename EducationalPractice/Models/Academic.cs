using System;
using System.Collections.Generic;

namespace EducationalPractice.Models;

public partial class Academic
{
    public int Id { get; set; }

    public string? Fio { get; set; }

    public DateOnly? DateOfBirthday { get; set; }

    public string? Specialization { get; set; }

    public short? YearAssignmentRank { get; set; }
}
