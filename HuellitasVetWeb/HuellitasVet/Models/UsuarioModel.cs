using HuellitasVetWeb.Entidades;
using System.Net.Http;

namespace HuellitasVetWeb.Models
{
    public class UsuarioModel(HttpClient httpClient, IConfiguration iConfiguration): IUsuarioModel
    {
        public Respuesta ConsultarUsuarios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ConsultarUsuarios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarTiposUsuarios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ConsultarTiposUsuarios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta RegistrarUsuario(Usuario ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/RegistrarUsuarios";

                JsonContent body = JsonContent.Create(ent);

                var res = httpClient.PostAsync(url, body).Result;

                if (res.IsSuccessStatusCode)
                {
                    return res.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }


            }
        }
        public Respuesta InicioSesion(Usuario ent)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/IniciarSesion";

                JsonContent body = JsonContent.Create(ent);

                var res = httpClient.PostAsync(url, body).Result;

                if (res.IsSuccessStatusCode)
                {
                    return res.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }
            }
        }

        public Respuesta ConsultarUsuario(int Id)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ConsultarUsuario?Id=" + Id;

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ActualizarUsuario(Usuario entidad)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ActualizarUsuario";
                JsonContent body = JsonContent.Create(entidad);
                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta EliminarUsuario(int Id)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/EliminarUsuario?Id=" + Id;

                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta? ConsultarDatosUsuario(int idusuario)
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Usuarios/ConsultarInformacionUsuario?idusuario=" + idusuario;
            var solicitud = httpClient.GetAsync(url).Result;

            if (solicitud.IsSuccessStatusCode)
                return solicitud.Content.ReadFromJsonAsync<Respuesta>().Result;
            else
                return new Respuesta();
        }
    }
}
