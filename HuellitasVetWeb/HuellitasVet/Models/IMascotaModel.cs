using HuellitasVetWeb.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel;

namespace HuellitasVetWeb.Models
{
    public interface IMascotaModel
    {
        Respuesta ConsultarMascotaUsuario();
        Respuesta RegistrarMascota(Mascota entidad);
        Respuesta ConsultarMascotas();

        Respuesta ConsultarMascota(int Id);

        Respuesta EliminarMascota(int id);

        Respuesta ActualizarMascota(Mascota entidad);

        List<SelectListItem> ConsultarMascotasUsuario(int UsuarioId);
    }
}
