using System;
using System.Collections.Generic;

namespace AcademicSystem.Models.DataBase;

public partial class Course
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();
}
