using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IRolesModel
    {
        Respuesta ConsultarTiposRoles();
        Respuesta RegistrarRol(Rol entidad);
        Respuesta ConsultarRoles();
        Respuesta ConsultarRol(int Id);
        Respuesta ActualizarRol(Rol entidad);
        Respuesta EliminarRol(int Id);
    }
}
