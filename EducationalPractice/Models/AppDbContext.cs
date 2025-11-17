using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EducationalPractice.Models;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Academic> Academics { get; set; }

    public virtual DbSet<AnimalsGaleev> AnimalsGaleevs { get; set; }

    public virtual DbSet<Application> Applications { get; set; }

    public virtual DbSet<ControlGaleev> ControlGaleevs { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<CountryGaleev> CountryGaleevs { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<Discipline> Disciplines { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Engineer> Engineers { get; set; }

    public virtual DbSet<Exam> Exams { get; set; }

    public virtual DbSet<Faculty> Faculties { get; set; }

    public virtual DbSet<FlowersGaleev> FlowersGaleevs { get; set; }

    public virtual DbSet<HeadDepartment> HeadDepartments { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Specialization> Specializations { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<StudentGimnazium> StudentGimnazia { get; set; }

    public virtual DbSet<StudentTest> StudentTests { get; set; }

    public virtual DbSet<Teacher> Teachers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseLazyLoadingProxies().UseNpgsql("Host=localhost;Port=5432;Database=EducationalPractice;Username=postgres;Password=2908016006");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Academic>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Academic_pkey");

            entity.ToTable("Academic");

            entity.Property(e => e.Fio)
                .HasMaxLength(100)
                .HasColumnName("FIO");
            entity.Property(e => e.Specialization).HasMaxLength(50);
        });

        modelBuilder.Entity<AnimalsGaleev>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Animals_Galeev_pkey");

            entity.ToTable("Animals_Galeev");

            entity.Property(e => e.Squad)
                .HasMaxLength(100)
                .HasDefaultValueSql("'Хищные'::character varying");
        });

        modelBuilder.Entity<Application>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Application_pkey");

            entity.ToTable("Application");

            entity.Property(e => e.Number).HasMaxLength(50);
        });

        modelBuilder.Entity<ControlGaleev>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Control_Galeev_pkey");

            entity.ToTable("Control_Galeev");

            entity.Property(e => e.View)
                .HasMaxLength(100)
                .HasDefaultValueSql("'Татарская республика'::character varying");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Country_pkey");

            entity.ToTable("Country");

            entity.Property(e => e.Capital).HasMaxLength(50);
            entity.Property(e => e.Continent).HasMaxLength(50);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Square).HasPrecision(10, 2);
        });

        modelBuilder.Entity<CountryGaleev>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Country_Galeev_pkey");

            entity.ToTable("Country_Galeev");

            entity.Property(e => e.View)
                .HasMaxLength(100)
                .HasDefaultValueSql("'Татарская республика'::character varying");
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Department_pkey");

            entity.ToTable("Department");

            entity.Property(e => e.Code).HasMaxLength(2);
            entity.Property(e => e.Faculty).HasMaxLength(2);
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Discipline>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Discipline_pkey");

            entity.ToTable("Discipline");

            entity.Property(e => e.Executor).HasMaxLength(2);
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Employee_pkey");

            entity.ToTable("Employee");

            entity.Property(e => e.Code).HasColumnType("character varying");
            entity.Property(e => e.FullName).HasColumnType("character varying");
            entity.Property(e => e.Login).HasColumnType("character varying");
            entity.Property(e => e.Password).HasColumnType("character varying");
            entity.Property(e => e.Post).HasColumnType("character varying");

            entity.HasOne(d => d.Role).WithMany(p => p.Employees)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_Role");
        });

        modelBuilder.Entity<Engineer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Engineer_pkey");

            entity.ToTable("Engineer");

            entity.Property(e => e.Specialization).HasMaxLength(50);
        });

        modelBuilder.Entity<Exam>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Exam_pkey");

            entity.ToTable("Exam");

            entity.Property(e => e.Auditorium).HasMaxLength(20);
            entity.Property(e => e.Estimation).HasMaxLength(1);

            entity.HasOne(d => d.Discipline).WithMany(p => p.Exams)
                .HasForeignKey(d => d.DisciplineId)
                .HasConstraintName("Exam_DisciplineId_fkey");

            entity.HasOne(d => d.Employee).WithMany(p => p.Exams)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("Exam_EmployeeId_fkey");

            entity.HasOne(d => d.Student).WithMany(p => p.Exams)
                .HasForeignKey(d => d.StudentId)
                .HasConstraintName("Exam_StudentId_fkey");
        });

        modelBuilder.Entity<Faculty>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Faculty_pkey");

            entity.ToTable("Faculty");

            entity.Property(e => e.Abbreviation).HasMaxLength(2);
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<FlowersGaleev>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Flowers_Galeev_pkey");

            entity.ToTable("Flowers_Galeev");

            entity.Property(e => e.Class)
                .HasMaxLength(100)
                .HasDefaultValueSql("'Двудольные'::character varying");
        });

        modelBuilder.Entity<HeadDepartment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("HeadDepartment_pkey");

            entity.ToTable("HeadDepartment");

            entity.Property(e => e.Experience).HasMaxLength(3);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Role_pkey");

            entity.ToTable("Role");

            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Specialization>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Specialization_pkey");

            entity.ToTable("Specialization");

            entity.Property(e => e.Code).HasMaxLength(2);
            entity.Property(e => e.Number).HasMaxLength(50);
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Student_pkey");

            entity.ToTable("Student");

            entity.Property(e => e.FullName).HasMaxLength(50);
            entity.Property(e => e.Number).HasMaxLength(50);
        });

        modelBuilder.Entity<StudentGimnazium>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("StudentGimnazia_pkey");

            entity.Property(e => e.School).HasMaxLength(100);
            entity.Property(e => e.Subject).HasMaxLength(100);
            entity.Property(e => e.Surname).HasMaxLength(100);
        });

        modelBuilder.Entity<StudentTest>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("StudentTest_pkey");

            entity.ToTable("StudentTest");

            entity.Property(e => e.School).HasMaxLength(100);
            entity.Property(e => e.Subject).HasMaxLength(100);
            entity.Property(e => e.Surname).HasMaxLength(100);
        });

        modelBuilder.Entity<Teacher>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Teacher_pkey");

            entity.ToTable("Teacher");

            entity.Property(e => e.Degree).HasMaxLength(50);
            entity.Property(e => e.Rank).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
