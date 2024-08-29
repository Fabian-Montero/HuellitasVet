
using Dapper;
using HuellitasVetApi.Entidades;
using Microsoft.AspNetCore.Authorization;
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
        [Authorize]
        [HttpGet]
        [Route("ConsultarMascotaUsuario")]
        public async Task<IActionResult> ConsultarMascotaUsuario()
        {
            Respuesta resp = new Respuesta();

            if (!int.TryParse(User.Identity?.Name, out int idUsuario))
            {
                resp.Codigo = 0;
                resp.Mensaje = "ID de usuario no válido o no proporcionado.";
                resp.Contenido = false;
                return Unauthorized(resp);
            }

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Mascota>(
                    "ObtenerMascotasPorUsuario",
                    new { IdUsuario = idUsuario },
                    commandType: CommandType.StoredProcedure
                );

                if (result.Any())
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay mascotas registradas para este usuario.";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


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
        [HttpGet]
        [Route("ConsultarMascota")]
        public async Task<IActionResult> ConsultarMascota(int Id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Mascota>("ConsultarMascota", new { Id }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay mascotas registradas en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpDelete]
        [Route("EliminarMascota")]
        public async Task<IActionResult> EliminarMascota(int Id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("EliminarMascota", new { Id }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Eror al eliminar la mascota";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpPut]
        [Route("ActualizarMascota")]
        public async Task<IActionResult> ActualizarMascota(Mascota entidad)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("ActualizarMascota", new { entidad.Nombre, entidad.Raza, entidad.Color, entidad.Edad, entidad.Sexo, entidad.EspecieId, entidad.UsuarioId, entidad.IdMascota }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Error al actualizar la mascota";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


        [HttpGet]
        [Route("ObtenerMascotasUsuario")]
        public async Task<IActionResult> ObtenerMascotasUsuario(int UsuarioId)
        {
            Respuesta respuesta = new Respuesta();
            using (var contexto = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var request = await contexto.QueryAsync("ObtenerMascotasUsuario", new { UsuarioId },
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

