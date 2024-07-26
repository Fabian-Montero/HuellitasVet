using HuellitasVetWeb.Entidades;
using System.ComponentModel;

namespace HuellitasVetWeb.Models
{
    public interface IMascotaModel
    {
        Respuesta RegistrarMascota(Mascota entidad);
        Respuesta ConsultarMascotas();

        Respuesta ConsultarMascota(int Id);

        Respuesta EliminarMascota(int id);

        Respuesta ActualizarMascota(Mascota entidad);
    }
}
