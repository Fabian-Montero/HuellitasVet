﻿using Dapper;
using HuellitasVetApi.Entidades;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Logging;
using Microsoft.IdentityModel.Tokens;
using System.ComponentModel.Design;
using System.Data;
using System.Runtime.CompilerServices;

namespace HuellitasVetApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServicioController(IConfiguration iConfiguration) : ControllerBase
    {
        [HttpGet]
        [Route("ConsultarServicios")]
        public async Task<IActionResult> ConsultarServicios()
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Servicio>("ConsultarServicios", new { }, commandType: CommandType.StoredProcedure);

                if (result.Count() > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay servicios registrados en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpPost]
        [Route("RegistrarServicio")]
        public async Task<IActionResult> RegistrarServicio(Servicio ent) {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Servicio>("RegistrarServicio", new { ent.Descripcion, ent.Precio }, commandType: CommandType.StoredProcedure);

                if (result != null) {
                    resp.Codigo = 1;
                    resp.Mensaje = "";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al registrar el servicio";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpPut]
        [Route("ActualizarRutaImagen")]
        public async Task<IActionResult> ActualizarRutaImagen(Servicio ent) {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("ActualizarRutaImagen", new { ent.IdServicio, ent.RutaImagen }, commandType: CommandType.StoredProcedure);
                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al actualizar la ruta de la imagen en la base de datos";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }



        [HttpDelete]
        [Route("EliminarServicio")]
        public async Task<IActionResult> EliminarServicio(int Id) 
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("EliminarServicio", new { Id }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "";
                    resp.Contenido = false;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al eliminar el servicio";
                    resp.Contenido = result;
                    return Ok(resp);
                }
            }
        }

        [HttpGet]
        [Route("ConsultarServicio")]
        public async Task<IActionResult> ConsultarServicios(int Id)
        {

            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Servicio>("ConsultarServicio", new { Id}, commandType: CommandType.StoredProcedure);

                if (result != null)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se ha encontrado el servicio solicitado";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpPut]
        [Route("ActualizarServicio")]
        public async Task<IActionResult> ActualizarServicio(Servicio ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("ActualizarServicio", new { ent.IdServicio, ent.Descripcion, ent.Precio }, commandType: CommandType.StoredProcedure);
                if (result > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "Error al actualizar el servicio en la base de datos";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

    }

}

