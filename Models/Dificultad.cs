public class Dificultad
{
    public int IdDificultad { get; set; }
    public string Nombre {get; set;}
    public Dificultad(){}
    public Dificultad(int id_dificultad, string nombre)
    {
        IdDificultad=id_dificultad;
        Nombre=nombre;
    }
}