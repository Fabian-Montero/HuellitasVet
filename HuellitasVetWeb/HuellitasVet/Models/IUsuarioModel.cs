using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IUsuarioModel
    {
        Respuesta ConsultarUsuarios();
        Respuesta ConsultarTiposUsuarios();
        Respuesta RegistrarUsuario(Usuario ent);
        Respuesta InicioSesion(Usuario ent);

        Respuesta ConsultarUsuario(int Id);

        Respuesta ActualizarUsuario(Usuario entidad);

        Respuesta EliminarUsuario(int Id);

        Respuesta? ConsultarDatosUsuario(int idusuario);

        Respuesta RecuperarAcceso(string Identificacion);

        Respuesta CambiarContrasenna(Usuario ent);
    }
}
