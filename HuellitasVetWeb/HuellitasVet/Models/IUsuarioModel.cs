using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IUsuarioModel
    {
        Respuesta ConsultarUsuarios();
        Respuesta ConsultarTiposUsuarios();
    }
}
