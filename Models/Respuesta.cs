public class Respuesta
{
    public int IdRespuesta { get; set; }
    public int Opcion {get; set;}
    public string Nombre {get; set;}
    public bool Correcta {get; set;}
    public string Foto {get;set;} 
    public Respuesta(){}
    public Respuesta(int id_respuesta, int opcion, string nombre, bool correcta, string foto)
    {
        IdRespuesta=id_respuesta;
        Opcion=opcion;
        Nombre=nombre;  
        Correcta=correcta;
        Foto=foto;
    }
}