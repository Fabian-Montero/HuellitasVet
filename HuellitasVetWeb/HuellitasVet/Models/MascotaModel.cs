using HuellitasVetWeb.Entidades;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Net.Http.Headers;
using System.Text.Json;

namespace HuellitasVetWeb.Models
{
    public class MascotaModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : IMascotaModel
    {
        //Consultar mascotas usuario cliente
        public Respuesta ConsultarMascotaUsuario()
        {
            string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/ConsultarMascotaUsuario";
            string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            var result = httpClient.GetAsync(url).Result;

            if (result.IsSuccessStatusCode)
                return result.Content.ReadFromJsonAsync<Respuesta>().Result!;
            else
                return new Respuesta();
        }

        public Respuesta RegistrarMascota(Mascota entidad)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/RegistrarMascota";
                JsonContent body = JsonContent.Create(entidad);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
        public Respuesta ConsultarMascotas()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/ConsultarMascotas";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ConsultarMascota(int Id)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/ConsultarMascota?Id=" + Id;

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta EliminarMascota(int Id)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/EliminarMascota?Id=" + Id;

                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta ActualizarMascota(Mascota entidad)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/ActualizarMascota";
                JsonContent body = JsonContent.Create(entidad);
                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public List<SelectListItem> ConsultarMascotasUsuario(int UsuarioId)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Mascotas/ObtenerMascotasUsuario?UsuarioId="+UsuarioId;

                var response = httpClient.GetAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    var respuesta = response.Content.ReadFromJsonAsync<Respuesta>().Result;
                    if (respuesta!.Codigo == 1)
                    {
                        var jsonElement = (JsonElement)respuesta.Contenido!;
                        var productos = JsonSerializer.Deserialize<List<Mascota>>(jsonElement.GetRawText());
                        if (productos != null)
                        {
                            return productos.Select(t => new SelectListItem
                            {
                                Value = t.IdMascota.ToString(),
                                Text = t.Mascotas
                            }).ToList();
                        }
                    }
                }
                return new List<SelectListItem>();
            }
        }
    }
}