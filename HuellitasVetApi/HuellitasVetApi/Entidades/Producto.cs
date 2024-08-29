namespace HuellitasVetApi.Entidades
{
    public class Producto
    {

        public int IdProducto { get; set; }
        public string? Descripcion { get; set; }
        public float Precio { get; set; }
        public string? RutaImagen { get; set; }
        public int CategoriaId { get; set; }
        public string? NombreCategoria { get; set; }
    }
}
