public class Respuesta
{
    public int IdRespuesta { get; set; }
    public int IdPregunta { get; set; }
    public int Opcion { get; set; }
    public string Contenido { get; set; }
    public bool Correcta { get; set; }

    public Respuesta() { }

    public Respuesta(int id_respuesta, int opcion, string contenido, bool correcta, int id_pregunta)
    {
        IdRespuesta = id_respuesta;
        IdPregunta = id_pregunta;
        Opcion = opcion;
        Contenido = contenido;
        Correcta = correcta;
    }
}