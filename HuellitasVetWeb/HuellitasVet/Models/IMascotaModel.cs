using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IMascotaModel
    {
        Respuesta RegistrarMascota(Mascota entidad);
        Respuesta ConsultarMascotas();
    }
}
