using HuellitasVetWeb.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;



namespace HuellitasVetWeb.Models
{
    public interface IServicioModel
    {


        List<SelectListItem> ObtenerServicios();

        Respuesta ConsultarServicios();
        Respuesta RegistrarServicio(Servicio servicio);

        Respuesta ActualizarRutaImagen(Servicio ent);

        Respuesta EliminarServicio(int id);

        Respuesta ConsultarServicio(int id);

        Respuesta ActualizarServicio(Servicio ent);



    }

}


       

