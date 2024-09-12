using System.Data.SqlClient;
using Dapper;
namespace TP07___PreguntadORT.Models;
public static class Juego
{
    private static string _connectionString = @"Server=localhost; DataBase=preguntadort; Trusted_Connection=True;";
    public static string Username  {get; private set;}
    public static int PuntajeActual  {get; private set;}
    public static int CantidadPreguntasCorrectas  {get;private set;}
    public static int ContadorNroPreguntaActual  {get;private set;}
    public static Pregunta PreguntaActual  {get;private set;}
    public static List<Pregunta> ListaPreguntas {get;private set;}
    public static List<Respuesta> ListaRespuesta {get;private set;}
    private static void InicializarJuego()
    {
        Username="";
        PuntajeActual=0;
        CantidadPreguntasCorrectas=0;
        ContadorNroPreguntaActual=0;
        PreguntaActual=null;
        ListaPreguntas=null;
        ListaRespuesta=null;
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias(); 
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades(); 
    }  
    public static void CargarPartida (string username, int dificultad, int categoria)
    {
        InicializarJuego();
        BD.ObtenerPreguntas(dificultad, categoria);
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        if(ContadorNroPreguntaActual<ListaPreguntas.Count)
        {
            PreguntaActual=ListaPreguntas[ContadorNroPreguntaActual];
            return PreguntaActual;
        }
        return null;
    }   
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
    
    List<Respuesta> listaRespuestas = new List<Respuesta>();
    using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Respuesta WHERE IdPregunta = @idPregunta";
            listaRespuestas = db.Query<Respuesta>(sql, new { idPregunta }).ToList();
        }
    return listaRespuestas;
    }

    public static bool VerificarRespuesta(int idRespuesta)
{
    bool esCorrecta = false;
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        string sql = "SELECT Correcta FROM Respuesta WHERE IdRespuesta = @idRespuesta";
        esCorrecta = db.QueryFirstOrDefault<bool>(sql, new { idRespuesta });
    }
    return esCorrecta;
}
}
