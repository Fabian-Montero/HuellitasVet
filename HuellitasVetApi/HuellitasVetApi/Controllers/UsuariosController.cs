using Dapper;
using HuellitasVetApi.Entidades;
using HuellitasVetApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace HuellitasVetApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController(IConfiguration iConfiguration, IComunesModel iComunesModel, IHostEnvironment iHost) : ControllerBase
    {

        //Registro de Usuarios

        [AllowAnonymous]
        [HttpPost]
        [Route("RegistrarUsuarios")]
        public async Task<IActionResult> RegistrarUsuario(Usuario ent)
        {   
            Respuesta res = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("RegistrarUsuario", new {
                    ent.NombreCompleto,
                    ent.Identificacion,
                    ent.Correo,
                    ent.Telefono,
                    ent.Direccion,
                    ent.Contrasenna
                }, commandType: CommandType.StoredProcedure);

                if (result > 0)
                {
                    res.Codigo = 1;
                    res.Mensaje = "Ok";
                    res.Contenido = result;
                    return Ok(res);
                }
                else
                {
                    res.Codigo = 0;
                    res.Mensaje = "Usuario existente";
                    res.Contenido = false;
                    return Ok(res);
                }
            }

        }

        //Inicio de sesion
        [AllowAnonymous]
        [HttpPost]
        [Route("IniciarSesion")]
        public async Task<IActionResult> IniciarSesion(Usuario ent)
        {
            Respuesta res = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Usuario>("IniciarSesion", new
                {
                    ent.Correo,
                    ent.Contrasenna
                }, commandType: CommandType.StoredProcedure);

                if (result != null)
                {
                    result.Token = GenerarToken(result.IdUsuario, result.RolId);

                    res.Codigo = 1;
                    res.Mensaje = "Ok";
                    res.Contenido = result;
                    return Ok(res);
                }
                else
                {
                    res.Codigo = 0;
                    res.Mensaje = "El usuario no existe";
                    res.Contenido = false;
                    return Ok(res);
                }
            }

        }


        //Consultar Usuarios 
        [HttpGet]
        [Route("ConsultarUsuarios")]
        public async Task<IActionResult> ConsultarUsuarios()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<Usuario>("ConsultarUsuarios", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay usuarios registrados en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        //Consultar Tipos Usuarios
        [HttpGet]
        [Route("ConsultarTiposUsuarios")]
        public async Task<IActionResult> ConsultarTiposUsuarios()
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryAsync<SelectListItem>("ConsultarTiposUsuarios", new { }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "No hay usuarios registrados en este momento";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        [HttpDelete]
        [Route("EliminarUsuario")]
        public async Task<IActionResult> EliminarUsuario(int Id)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.ExecuteAsync("EliminarUsuario", new { Id }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "Eror al eliminar el usuario";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }

        //Recuperar acceso
        [HttpGet]
        [Route("RecuperarAcceso")]
        public async Task<IActionResult> RecuperarAcceso(string Identificacion)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var result = await context.QueryFirstOrDefaultAsync<Usuario>("ConsultarUsuarioIdentificacion", new { Identificacion }, commandType: CommandType.StoredProcedure);

                if (result != null)
                {
                    var CodigoAleatorio = iComunesModel.GenerarCodigo();
                    var Contrasenna = iComunesModel.Encrypt(CodigoAleatorio);
                    var EsTemporal = true;
                    var VigenciaTemporal = DateTime.Now.AddMinutes(30);

                    await context.ExecuteAsync("ActualizarContrasenna",
                        new { result.IdUsuario, Contrasenna, EsTemporal, VigenciaTemporal },
                        commandType: CommandType.StoredProcedure);
                    
                    var ruta = Path.Combine(iHost.ContentRootPath, "FormatoCorreo.html");
                    var html = System.IO.File.ReadAllText(ruta);

                    html = html.Replace("@@Nombre", result.NombreCompleto);
                    html = html.Replace("@@Contrasenna", CodigoAleatorio);
                    html = html.Replace("@@Vencimiento", VigenciaTemporal.ToString("dd/MM/yyyy HH:mm"));
                    
                    iComunesModel.EnviarCorreo(result.Correo!, "Recuperar Acceso Sistema", html);

                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = result;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No hay usuarios registrados con esa identificación";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }


        //Token (ɔ◔‿◔)ɔ
        private string GenerarToken(int IdUsuario, int RolId)
        {
            string SecretKey = iConfiguration.GetSection("Llaves:SecretKey").Value!;
            List<Claim> claims = new List<Claim>();
            claims.Add(new Claim(ClaimTypes.Name, IdUsuario.ToString()));
            claims.Add(new Claim("RolId", RolId.ToString()));

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(SecretKey));
            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(10),
                signingCredentials: cred);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }


        [HttpGet]
        [Route("ConsultarInformacionUsuario")]
        public async Task<IActionResult> ConsultarHorarioDisponible(long idusuario)
        {
            Respuesta resp = new Respuesta();

            using (var contexto = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@idusuario", idusuario);

                var request = (await contexto.QueryAsync<Usuario>("ConsultarPerfilUsuario", parameters, commandType: System.Data.CommandType.StoredProcedure)).ToList();

                if (request != null && request.Count > 0)
                {
                    resp.Codigo = 1;
                    resp.Mensaje = "OK";
                    resp.Contenido = request;
                    return Ok(resp);
                }
                else
                {
                    resp.Codigo = 0;
                    resp.Mensaje = "No se ha encontrado la información";
                    return Ok(resp);
                }
            }


        }


        [Authorize]
        [HttpPut]
        [Route("CambiarContrasenna")]
        public async Task<IActionResult> CambiarContrasenna(Usuario ent)
        {
            Respuesta resp = new Respuesta();

            using (var context = new SqlConnection(iConfiguration.GetSection("ConnectionStrings:DefaultConnection").Value))
            {
                var Contrasenna = iComunesModel.Encrypt(ent.Contrasenna!);
                var EsTemporal = false;
                var VigenciaTemporal = DateTime.Now;

                var result = await context.ExecuteAsync("ActualizarContrasenna",
                    new { ent.IdUsuario, Contrasenna, EsTemporal, VigenciaTemporal }, commandType: CommandType.StoredProcedure);

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
                    resp.Mensaje = "La contraseña del usuario no se pudo actualizar";
                    resp.Contenido = false;
                    return Ok(resp);
                }
            }
        }
    }

}
    

