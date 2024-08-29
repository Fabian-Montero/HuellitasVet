using Dapper;
using HuellitasVetApi.Entidades;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace HuellitasVetApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitasController(IConfiguration iConfiguration) : Controller
    {
        [HttpGet]
        [Route("ObtenerHorariosDisponibles")]
        public async Task<IActionResult> ObtenerMascotasUsuario(int Id_Servicio, DateTime Fecha)
        {
            Respuesta respuesta = new Respuesta();
            using (var contexto = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var request = await contexto.QueryAsync("ObtenerHorariosDisponibles", new { Id_Servicio, Fecha },
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
                    respuesta.Mensaje = "No hay horarios disponibles para el servicio y fecha seleccionada";
                    respuesta.Contenido = false;
                    return Ok(respuesta);
                }
            }
        }


        [HttpPost]
        [Route("RegistrarCita")]
        public async Task<IActionResult> RegistrarCita(Citas entidad)
        {
            Respuesta resp = new Respuesta();

            
                using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
                {
                    var result = await context.ExecuteAsync("RegistrarCita", new { entidad.idhorario, entidad.IdServicio, entidad.IdUsuario, entidad.IdMascota }, commandType: CommandType.StoredProcedure);

                    if (result > 0)
                    {
                        resp.Codigo = 1;
                        resp.Mensaje = "Registro exitoso";
                        resp.Contenido = true;
                        return Ok(resp);
                    }
                    else
                    {
                        resp.Codigo = 0;
                        resp.Mensaje = "Error al registrar cita.";
                        resp.Contenido = false;
                        return Ok(resp);
                    }
                }
            }

        [HttpGet]
        [Route("ObtenerCitas")]
        public async Task<IActionResult> ObtenerCitas(int UsuarioId)
        {
            Respuesta respuesta = new Respuesta();
            using (var contexto = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var request = await contexto.QueryAsync("ObtenerCitasPorUsuario", new { UsuarioId },
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
                    respuesta.Mensaje = "No cuenta con mascotas registradas";
                    respuesta.Contenido = false;
                    return Ok(respuesta);
                }
            }
        }




    }

}

