using System.Data.SqlClient;
using Dapper;
namespace TP07___PreguntadORT.Models;
public static class Juego
{
    public static string Username  {get;set;}
    public static int PuntajeActual  {get;set;}
    public static int CantidadPreguntasCorrectas  {get;set;}
    public static int ContadorNroPreguntaActual  {get;set;}
    public static Pregunta PreguntaActual  {get;set;}
    public static List<Pregunta> ListaPreguntas {get;set;}
    public static List<Respuesta> ListaRespuesta {get;set;}
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
    private static List<Categoria> ObtenerCategorias()
    {
        
        return BD.ObtenerCategorias(); 
    }
    private static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades(); 
    }  
}
