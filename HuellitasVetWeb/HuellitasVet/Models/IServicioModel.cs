using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IServicioModel
    {
        Respuesta ConsultarServicios();
        Respuesta RegistrarServicio(Servicio servicio);

        Respuesta ActualizarRutaImagen(Servicio ent);

        Respuesta EliminarServicio(int id);

        Respuesta ConsultarServicio(int id);

        Respuesta ActualizarServicio(Servicio ent);
    }
}
