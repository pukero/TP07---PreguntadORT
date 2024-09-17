using System.Data.SqlClient;
using Dapper;
namespace TP07___PreguntadORT.Models;

public static class Juego
{
    private static string _connectionString = @"Server=localhost; DataBase=preguntadort; Trusted_Connection=True;";
    
    public static string Username  { get; private set; }
    public static int PuntajeActual  { get; private set; }
    public static int CantidadPreguntasCorrectas  { get; private set; }
    public static int ContadorNroPreguntaActual  { get; private set; }
    public static Pregunta PreguntaActual  { get; private set; }
    public static List<Pregunta> ListaPreguntas { get; private set; }
    public static List<Respuesta> ListaRespuestas { get; private set; }
    
    private static void InicializarJuego()
    {
        Username = "";
        PuntajeActual = 0;
        CantidadPreguntasCorrectas = 0;
        ContadorNroPreguntaActual = 0;
        PreguntaActual = null;
        ListaPreguntas = null;
        ListaRespuestas = null;
    }

    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias(); 
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades(); 
    }

    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        InicializarJuego();
        Username = username;
        ListaPreguntas = BD.ObtenerPreguntas(dificultad, categoria);
        ContadorNroPreguntaActual = 0;
        if (ListaPreguntas != null && ListaPreguntas.Count > 0)
        {
            PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
            ListaRespuestas = BD.ObtenerRespuestas(PreguntaActual.IdPregunta);
        }
    }

    public static Pregunta ObtenerProximaPregunta()
    {
        ContadorNroPreguntaActual++;
        if (ContadorNroPreguntaActual < ListaPreguntas.Count)
        {
            PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
            return PreguntaActual;
        }
        return null;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        return BD.ObtenerRespuestas(idPregunta);
    }

    public static bool VerificarRespuesta(int idRespuesta)
    {
        bool esCorrecta = false;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Correcta FROM Respuestas WHERE IdRespuesta = @idRespuesta";
            esCorrecta = db.QueryFirstOrDefault<bool>(sql, new { idRespuesta });
        }
        if (esCorrecta)
        {
            PuntajeActual += 10; // Se suma 10 puntos si la respuesta es correcta
            CantidadPreguntasCorrectas++;
        }
        ContadorNroPreguntaActual++;
        if (ContadorNroPreguntaActual < ListaPreguntas.Count)
        {
            PreguntaActual = ListaPreguntas[ContadorNroPreguntaActual];
            ListaRespuestas = BD.ObtenerRespuestas(PreguntaActual.IdPregunta);
        }
        else
        {
            PreguntaActual = null; // Fin del juego
        }
        return esCorrecta;
    }
}