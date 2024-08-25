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
    public class ServicioController(IConfiguration iConfiguration) : ControllerBase
    {
        [HttpGet]
        [Route("ObtenerListadoServicios")]
        public async Task<IActionResult> ObtenerListadoServicios()
        {
            Respuesta respuesta = new Respuesta();
            using (var contexto = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var request = await contexto.QueryAsync("ObtenerServicios", new {  },
                      commandType: System.Data.CommandType.StoredProcedure);
                if (request != null)
                {
                    respuesta.Codigo = 1;
                    respuesta.Mensaje = "OK";
                    respuesta.Contenido = request.ToList();
                    return Ok(respuesta);
                }
                else
                {
                    respuesta.Codigo = 0;
                    respuesta.Mensaje = "No ha encontrado servicios";
                    respuesta.Contenido = false;
                    return Ok(respuesta);
                }
            }

        }

        [HttpGet]
        [Route("ConsultarServicio")]
        public async Task<IActionResult> ConsultarUsuario(int IdServicio)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Servicio>("ConsultarSerVicio", new { IdServicio }, commandType: CommandType.StoredProcedure);

                if (result != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al cosultar servicio";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }

}

