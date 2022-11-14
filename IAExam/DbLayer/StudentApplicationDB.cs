﻿using IAExam.Models;
using System.Data.SqlClient;
using System.Runtime.Intrinsics.Arm;

namespace IAExam.DbLayer
{
    public class StudentApplicationDB
    {
        private string _connectionString;

        public StudentApplicationDB(string connectionString)
        {
            this._connectionString = connectionString;
        }

        public StudentApplicationResponse SaveStudentApplication(Student student)
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "CreateApplication",
                Connection = con
            };

            cmd.Parameters.Add(new SqlParameter("@Name", student.Name));
            cmd.Parameters.Add(new SqlParameter("@LastName", student.LastName));
            cmd.Parameters.Add(new SqlParameter("@ID", student.Id));
            cmd.Parameters.Add(new SqlParameter("@Age", student.Age));
            cmd.Parameters.Add(new SqlParameter("@MagicAffinity", student.MagicAffinity));

            using SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            var newStudent = new StudentResponse(student);
            newStudent.StudentId = Convert.ToInt32(rdr["StudentID"]);
            return new StudentApplicationResponse()
            {
                Id = Convert.ToInt32(rdr["ApplicationID"]),
                Student = newStudent,
                ApplicationStatus = rdr["ApplicationStatus"].ToString() ?? string.Empty
            };
        }

        public StudentApplicationResponse UpdateStudentAplication(StudentApplication application)
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "UpdateApplication",
                Connection = con
            };

            cmd.Parameters.Add(new SqlParameter("@ID", application.Id));
            cmd.Parameters.Add(new SqlParameter("@StudentID", application.Student.StudentId));
            cmd.Parameters.Add(new SqlParameter("@ApplicationStatus", application.ApplicationStatus));

            using SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            var newStudent = new StudentResponse() { StudentId = Convert.ToInt32(rdr["StudentID"]) };
            return new StudentApplicationResponse()
            {
                Id = Convert.ToInt32(rdr["ApplicationID"]),
                Student = newStudent,
                ApplicationStatus = rdr["ApplicationStatus"].ToString() ?? string.Empty
            };
        }

        public StudentApplicationResponse UpdateStudentAplicationStatus(int id, int newStatus)
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "UpdateApplicationStatus",
                Connection = con
            };

            cmd.Parameters.Add(new SqlParameter("@ID", id));
            cmd.Parameters.Add(new SqlParameter("@ApplicationStatus", newStatus));

            using SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            return new StudentApplicationResponse()
            {
                Id = Convert.ToInt32(rdr["ApplicationID"]),
                Student = new StudentResponse { StudentId = Convert.ToInt32(rdr["StudentID"]) },
                ApplicationStatus = rdr["ApplicationStatus"].ToString() ?? string.Empty
            };
        }

        public IEnumerable<StudentApplicationResponse> GetApplications()
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "GetApplications",
                Connection = con
            };


            using SqlDataReader rdr = cmd.ExecuteReader();
            var studentApplicationList = new List<StudentApplicationResponse>();
            while (rdr.Read())
            {
                studentApplicationList.Add(new StudentApplicationResponse
                {
                    Id = Convert.ToInt32(rdr["ApplicationID"]),
                    Student = new StudentResponse()
                    {
                        StudentId = Convert.ToInt32(rdr["StudentDbID"]),
                        Name = rdr["StudentName"].ToString() ?? string.Empty,
                        LastName = rdr["StudentLastName"].ToString() ?? string.Empty,
                        Id = rdr["StudentID"].ToString() ?? string.Empty,
                        Age = Convert.ToInt32(rdr["StudentAge"]),
                        MagicAffinity = rdr["StudentMagicAffinity"].ToString() ?? string.Empty,
                    },
                    ApplicationStatus = rdr["ApplicationStatus"].ToString() ?? string.Empty,
                });
            }
            return studentApplicationList;
        }

        public StudentApplicationResponse DeleteStudentApplication(int id)
        {
            using SqlConnection con = new(_connectionString);
            con.Open();
            SqlCommand cmd = new()
            {
                CommandType = System.Data.CommandType.StoredProcedure,
                CommandText = "DeleteApplication",
                Connection = con
            };

            cmd.Parameters.Add(new SqlParameter("@ApplicationID", id));

            using SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            return new StudentApplicationResponse()
            {
                Id = Convert.ToInt32(rdr["ApplicationID"]),
                Student = new StudentResponse { StudentId = Convert.ToInt32(rdr["StudentID"]) },
                Status = rdr["Status"].ToString() ?? string.Empty
            };
        }
    }
}
