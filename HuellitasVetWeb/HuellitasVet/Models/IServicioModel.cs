using HuellitasVetWeb.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace HuellitasVetWeb.Models
{
    public interface IServicioModel
    {

        List<SelectListItem> ConsultarServicios();

        Respuesta ConsultarServicio(int IdServicio);


        
    }

}

