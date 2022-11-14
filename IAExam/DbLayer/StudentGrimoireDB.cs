using IAExam.Models;
using System.Data.SqlClient;

namespace IAExam.DbLayer
{
    public class StudentGrimoireDB
    {
        private string _connectionString;

        public StudentGrimoireDB(string connectionString)
        {
            this._connectionString = connectionString;
        }

        public IEnumerable<Grimoire> GetGrimoires()
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "GetGrimoires",
                Connection = con
            };


            using SqlDataReader rdr = cmd.ExecuteReader();
            var studentApplicationList = new List<Grimoire>();
            while (rdr.Read())
            {
                studentApplicationList.Add(new Grimoire
                {
                    Id = Convert.ToInt32(rdr["GrimoireID"]),
                    Name = rdr["GrimoireName"].ToString() ?? string.Empty,
                    CloverLeaves = Convert.ToInt32(rdr["GrimoireCloverLeaves"]),
                });
            }
            return studentApplicationList;
        }

        public StudentGrimoire AssignGrimoire(int studentId, int grimoireId)
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "AssignGrimoire",
                Connection = con
            };

            cmd.Parameters.Add(new SqlParameter("@StudentID", studentId));
            cmd.Parameters.Add(new SqlParameter("@GrimoireID", grimoireId));


            using SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            return new StudentGrimoire()
            {
                Id = Convert.ToInt32(rdr["StudentGrimoireID"]),
                StudentId = Convert.ToInt32(rdr["StudentID"]),
                GrimoireId = Convert.ToInt32(rdr["GrimoireID"])
            };
        }

        public IEnumerable<StudentGrimoireResponse> GetGrimoireAssignment()
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "GetGrimoireAssignations",
                Connection = con
            };


            using SqlDataReader rdr = cmd.ExecuteReader();
            var grimoireAssignationList = new List<StudentGrimoireResponse>();
            while (rdr.Read())
            {
                grimoireAssignationList.Add(new StudentGrimoireResponse
                {
                    Id = Convert.ToInt32(rdr["GrimoireAssignationID"]),
                    Student = new StudentResponse()
                    {
                        StudentId = Convert.ToInt32(rdr["StudentDbID"]),
                        Name = rdr["StudentName"].ToString() ?? string.Empty,
                        LastName = rdr["StudentLastName"].ToString() ?? string.Empty,
                        Id = rdr["StudentID"].ToString() ?? string.Empty,
                        Age = Convert.ToInt32(rdr["StudentAge"]),
                        MagicAffinity = rdr["StudentMagicAffinity"].ToString() ?? string.Empty,
                    },
                    Grimoire = new Grimoire()
                    {
                        Id = Convert.ToInt32(rdr["GrimoireID"]),
                        Name = rdr["GrimoireName"].ToString() ?? string.Empty,
                        CloverLeaves = Convert.ToInt32(rdr["GrimoireCloverLeaves"]),
                    }
                });
            }
            return grimoireAssignationList;
        }
    }
}
