using System.ComponentModel.DataAnnotations;

namespace IAExam.Models
{
    public class StudentApplication
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public Student Student { get; set; }
        [Required]
        public int ApplicationStatus { get; set; }
    }

    public class StudentApplicationResponse
    {
        public int Id { get; set; }
        public StudentResponse Student { get; set; }
        public string ApplicationStatus { get; set; }
        public string Status { get; set; }
    }
}
