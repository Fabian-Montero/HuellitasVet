using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IProductoModel
    {
        Respuesta ConsultarProductos();
        Respuesta AgregarProducto(Producto ent);
        Respuesta ActualizarRutaImagen(Producto ent);
        Respuesta ConsultarTiposCategorias();

        Respuesta ConsultarProducto(int id);

        Respuesta ActualizarProducto(Producto ent);

        Respuesta EliminarProducto(int id);


    }
}
