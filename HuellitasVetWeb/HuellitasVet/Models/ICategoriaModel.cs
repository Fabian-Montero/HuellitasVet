using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface ICategoriaModel 
    {
        Respuesta RegistrarCategoria(Categoria entidad);
        Respuesta ConsultarCategorias();
        Respuesta ConsultarCategoria(int Id);
        Respuesta ActualizarCategoria(Categoria entidad);
        Respuesta EliminarCategoria(int Id);
    }
}
