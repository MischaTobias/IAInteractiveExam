using IAExam.Models;
using System.Data.SqlClient;

namespace IAExam.DbLayer
{
    public class GrimoireDB
    {
        private readonly string _connectionString;

        public GrimoireDB(string connectionString)
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
            var grimoireList = new List<Grimoire>();
            while (rdr.Read())
            {
                grimoireList.Add(new Grimoire
                {
                    Id = Convert.ToInt32(rdr["GrimoireID"]),
                    Name = rdr["GrimoireName"].ToString() ?? string.Empty,
                    CloverLeaves = Convert.ToInt32(rdr["GrimoireCloverLeaves"]),
                });
            }
            return grimoireList;
        }
    }
}
