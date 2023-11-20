using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace AcademicSystem.Models.DataBase;

public partial class AcademicSystemContext : DbContext
{
    public AcademicSystemContext()
    {
    }

    public AcademicSystemContext(DbContextOptions<AcademicSystemContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<Enrollment> Enrollments { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<Teacher> Teachers { get; set; }

    //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//       => optionsBuilder.UseSqlServer("Server=DESK-0UR080R05\\SQLEXPRESS; Database=AcademicSystem; Trusted_Connection=True; TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Course>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Course__3214EC07DC219301");

            entity.ToTable("Course");

            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Enrollment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Enrollme__3214EC07CAE1D3FD");

            entity.ToTable("Enrollment");

            entity.Property(e => e.EnrollmentDate).HasColumnType("date");
            entity.Property(e => e.Grade).HasColumnType("numeric(4, 2)");

            entity.HasOne(d => d.Course).WithMany(p => p.Enrollments)
                .HasForeignKey(d => d.CourseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Enrollmen__Cours__6383C8BA");

            entity.HasOne(d => d.Student).WithMany(p => p.Enrollments)
                .HasForeignKey(d => d.StudentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Enrollmen__Stude__628FA481");

            entity.HasOne(d => d.Teacher).WithMany(p => p.Enrollments)
                .HasForeignKey(d => d.TeacherId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Enrollmen__Teach__6477ECF3");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Student__3214EC07EE6C05BA");

            entity.ToTable("Student");

            entity.HasIndex(e => e.Phone, "UQ__Student__5C7E359EA5E3759E").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__Student__A9D10534F4281678").IsUnique();

            entity.Property(e => e.Address)
                .HasMaxLength(75)
                .IsUnicode(false);
            entity.Property(e => e.BirthDate).HasColumnType("date");
            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(75)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(9)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Teacher>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Teacher__3214EC07E5E25242");

            entity.ToTable("Teacher");

            entity.HasIndex(e => e.Phone, "UQ__Teacher__5C7E359E7FB82CB4").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__Teacher__A9D105342494D3BB").IsUnique();

            entity.Property(e => e.Email)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(75)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(9)
                .IsUnicode(false);
        });
        modelBuilder.HasSequence("SeqCourse");
        modelBuilder.HasSequence("SeqEnrollment");
        modelBuilder.HasSequence("SeqStudent");
        modelBuilder.HasSequence("SeqTeacher");

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
