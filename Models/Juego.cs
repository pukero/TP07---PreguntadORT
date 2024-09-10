using System.Data.SqlClient;
using Dapper;
namespace TP07___PreguntadORT.Models;
public class Juego
{
    public string Username  {get;set;}
    public int PuntajeActual  {get;set;}
    public int CantidadPreguntasCorrectas  {get;set;}
    public int ContadorNroPreguntaActual  {get;set;}
    public Pregunta PreguntaActual  {get;set;}
    public List<Pregunta> ListaPreguntas {get;set;}
    public List<Respuesta> ListaRespuesta {get;set;}
    private void InicializarJuego()
    {
        Username="";
        PuntajeActual=0;
        CantidadPreguntasCorrectas=0;
        ContadorNroPreguntaActual=0;
        PreguntaActual=null;
        ListaPreguntas=null;
        ListaRespuesta=null;
    }
    private List<Categoria> ObtenerCategorias()
    {
        
        return BD.ObtenerCategorias(); 
    }
    private List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades(); 
    }  
}
