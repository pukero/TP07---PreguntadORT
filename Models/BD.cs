using System.Data.SqlClient;
using Dapper;
namespace TP07___PreguntadORT.Models;


public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=preguntadort; Trusted_Connection=True;";
    static public List<Categoria> ObtenerCategorias()
    {
        List<Categoria>_ObtenerCategorias=new List<Categoria>();
        using(SqlConnection db = new SqlConnection(_connectionString) )
        {
            string sql = "SELECT * FROM Categoria";
            _ObtenerCategorias = db.Query<Categoria>(sql).ToList();
        }
        return _ObtenerCategorias;
    }
    static public List<Dificultad> ObtenerDificultades()
    {
        List<Dificultad>_ObtenerDificultades=new List<Dificultad>();
        using(SqlConnection db = new SqlConnection(_connectionString) )
        {
            string sql = "SELECT * FROM Dificultades";
            _ObtenerDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return _ObtenerDificultades;
    }
    static public List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Pregunta>_ObtenerPreguntas=new List<Pregunta>();
        using(SqlConnection db = new SqlConnection(_connectionString) )
        {
            string sql = "";
            _ObtenerPreguntas = db.Query<Pregunta>(sql).ToList();
        }
        return _ObtenerPreguntas;
    }
}