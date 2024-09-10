public class Respuesta
{
    public int IdRespuesta { get; set; }
    public string Nombre {get; set;}
    public string Foto {get;set;} 
    public Respuesta(){}
    public Respuesta(int id_respuesta, string nombre, string foto)
    {
        IdRespuesta=id_respuesta;
        Nombre=nombre;
        Foto=foto;
    }
}