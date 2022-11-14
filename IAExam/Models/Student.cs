using System.ComponentModel.DataAnnotations;

namespace IAExam.Models
{
    public class Student
    {
        public int StudentId { get; set; }
        [Required]
        [StringLength(20)]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        public string Name { get; set; }
        [Required]
        [StringLength(20)]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        public string LastName { get; set; }
        [Required]
        [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessage = "Use letters and numbers only please")]
        [StringLength(10)]
        public string Id { get; set; }
        [Required]
        [Range(0,99)]
        public int Age { get; set; }
        [Required]
        public int MagicAffinity { get; set; }
    }

    public class StudentResponse
    {
        [Required]
        public int StudentId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Id { get; set; }
        public int Age { get; set; }
        public string MagicAffinity { get; set; }

        public StudentResponse(Student student)
        {
            StudentId = student.StudentId;
            Name = student.Name;
            LastName = student.LastName;
            Id = student.Id;
            Age = student.Age;
        }

        public StudentResponse() { }
    }
}
