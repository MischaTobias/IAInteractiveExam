namespace IAExam.Models
{
    public class StudentGrimoire
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int GrimoireId { get; set; }
    }

    public class StudentGrimoireResponse
    {
        public int Id { get; set; }
        public StudentResponse Student { get; set; }
        public Grimoire Grimoire { get; set; }
    }

}
