public class Pregunta
{
    public int IdPregunta {get; set;}
    public int IdCategoria {get; set;}
    public int IdDificultad {get; set;}
    public string Enunciado {get; set;}
    public string Foto {get;set;} 
    
    public Pregunta(int id_pregunta,int id_categoria,int id_dificultad, string enunciado, string foto)
    {
        IdPregunta=id_pregunta;
        IdCategoria=id_categoria;
        IdDificultad=id_dificultad;
        Enunciado=enunciado;
        Foto=foto;
    }
}