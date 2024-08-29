using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface ICitaModel
    {

        Respuesta ConsultaDisponibilidad(int Id_Servicio, DateTime Fecha);


        Respuesta RegistrarCita(Cita entidad);

        Respuesta ConsultarCitas(int IdUsuario);



    }
}
