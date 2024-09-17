public class Categoria
{
    public int IdCategoria { get; set; }
    public string Nombre { get; set; }
    public string Foto { get; set; }

    public Categoria() { }

    public Categoria(int id_categoria, string nombre, string foto)
    {
        IdCategoria = id_categoria;
        Nombre = nombre;
        Foto = foto;
    }
}