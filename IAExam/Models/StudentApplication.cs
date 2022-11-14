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
        [Required]
        public int Id { get; set; }
        [Required]
        public StudentResponse Student { get; set; }
        [Required]
        public string ApplicationStatus { get; set; }
        [Required]
        public string Status { get; set; }
    }
}
