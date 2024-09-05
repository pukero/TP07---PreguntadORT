public class Pregunta
{
    public int IdPregunta { get; set; }
    public string Nombre {get; set;}
    public string Foto {get;set;} 
    public Pregunta(){}
    public Pregunta(int id_pregunta, string nombre, string foto)
    {
        IdPregunta=id_pregunta;
        Nombre=nombre;
        Foto=foto;
    }
}