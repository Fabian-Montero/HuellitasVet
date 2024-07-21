using Dapper;
using HuellitasVetApi.Entidades;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace HuellitasVetApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MascotasController(IConfiguration iConfiguration) : ControllerBase
    {
        //Registrar Mascota
        [HttpPost]
        [Route("RegistrarMascota")]
        public async Task<IActionResult> RegistrarMascota(Mascota entidad)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("RegistrarMascota", new { entidad.Nombre, entidad.Raza, entidad.Color, entidad.Edad, entidad.Sexo, entidad.EspecieId, entidad.UsuarioId }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = true;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "La información de la mascota ya se encuentra registrada";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        //Consultar Mascotas
        [HttpGet]
        [Route("ConsultarMascotas")]
        public async Task<IActionResult> ConsultarMascotas()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Mascota>("ConsultarMascotas", new { }, commandType: CommandType.StoredProcedure);

                if (result.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay mascotas registradas en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }
}
