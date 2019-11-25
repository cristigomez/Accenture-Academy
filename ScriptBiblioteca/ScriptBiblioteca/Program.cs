using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaAA
{
    class Program
    {
        static void MostrarLibro()
        {
            
            SqlConnection cnn = new SqlConnection(@"Data Source = (localdb)\SERVERLOCAL; Initial Catalog = BibliotecaAA; Integrated Security = True");
            cnn.Open();
            try
            {
                SqlCommand sql = new SqlCommand();
                sql.Connection = cnn;
                sql.CommandText = "Select * from Libros";
                SqlDataReader reader = sql.ExecuteReader();

                while(reader.Read())
                {
                    int id = reader.GetInt32(reader.GetOrdinal("Id"));
                    string nombre = reader.GetString(reader.GetOrdinal("Nombre"));
                    int autor = reader.GetInt32(reader.GetOrdinal("Id_Autor"));
                    int editorial = reader.GetInt32(reader.GetOrdinal("Id_Editorial"));
                    int genero = reader.GetInt32(reader.GetOrdinal("Id_Genero"));
                    Console.WriteLine($"Id:{id}, Nombre:{nombre}, Autor:{autor}, Editorial:{editorial}, Genero:{genero}");
                }
                Console.ReadLine();
            }
            finally
            {
                cnn.Close();
            }
        }

        static void BorrarLibro()
        {
            Console.WriteLine("Ingrese el id a borrar:");
            int idBorrar = Convert.ToInt32(Console.ReadLine());
            SqlConnection cnn = new SqlConnection(@"Data Source = (localdb)\SERVERLOCAL; Initial Catalog = BibliotecaAA; Integrated Security = True");
            cnn.Open();
            try
            {
                SqlCommand sql = new SqlCommand();
                sql.Connection = cnn;
                sql.CommandText = "Delete from Libros where id=@Id";
                sql.Parameters.Add(new SqlParameter("Id", idBorrar));
                sql.ExecuteNonQuery();
                Console.ReadLine();
            }
            finally
            {
                cnn.Close();
            }
        }


        static void Main(string[] args)
        {
            Program.MostrarLibro();
            Program.BorrarLibro();
            Program.MostrarLibro();
        }





    }
}
