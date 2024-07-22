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
    public class EspeciesController(IConfiguration iConfiguration) : ControllerBase
    {
        //Consultar Tipos Especies
        [HttpGet]
        [Route("ConsultarTiposEspecies")]
        public async Task<IActionResult> ConsultarTiposEspecies()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<SelectListItem>("ConsultarTiposEspecies", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay especies registradas en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }
}
