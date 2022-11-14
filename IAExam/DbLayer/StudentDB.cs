using IAExam.Models;
using System.Data.SqlClient;

namespace IAExam.DbLayer
{
    public class StudentDB
    {
        private readonly string _connectionString;

        public StudentDB(string connectionString)
        {
            this._connectionString = connectionString;
        }

        public StudentResponse SaveStudent(Student student)
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "CreateStudent",
                Connection = con
            };

            cmd.Parameters.Add(new SqlParameter("@Name", student.Name));
            cmd.Parameters.Add(new SqlParameter("@LastName", student.LastName));
            cmd.Parameters.Add(new SqlParameter("@ID", student.Id));
            cmd.Parameters.Add(new SqlParameter("@Age", student.Age));
            cmd.Parameters.Add(new SqlParameter("@MagicAffinity", student.MagicAffinity));

            using SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            var newStudent = new StudentResponse(student)
            {
                StudentId = Convert.ToInt32(rdr["StudentID"]),
                MagicAffinity = rdr["MagicAffinity"].ToString() ?? string.Empty
            };
            return newStudent;
        }
    }
}
