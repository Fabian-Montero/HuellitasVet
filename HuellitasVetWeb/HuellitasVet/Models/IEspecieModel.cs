using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public interface IEspecieModel
    {
        Respuesta ConsultarTiposEspecies();
        Respuesta RegistrarEspecie(Especie entidad);
        Respuesta ConsultarEspecie(int Id);
        Respuesta ConsultarEspecies();
        Respuesta EliminarEspecie(int Id);
        Respuesta ActualizarEspecie(Especie entidad);
    }
}
