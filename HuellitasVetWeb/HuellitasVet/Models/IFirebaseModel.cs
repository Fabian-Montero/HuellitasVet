using Microsoft.AspNetCore.Mvc;

namespace HuellitasVetApi.Models
{
    public interface IFirebaseModel
    {
        public Task<string> GuardarImagen(string carpeta, int id, IFormFile archivoImagen);
        public Task<bool> EliminarImagen(string carpeta, int id);
    }
}
