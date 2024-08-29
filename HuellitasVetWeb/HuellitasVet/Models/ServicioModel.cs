using HuellitasVetWeb.Entidades;
using System.Net.Http.Headers;
using System.Security.Policy;
using static System.Net.WebRequestMethods;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Text.Json;


namespace HuellitasVetWeb.Models
{
    public class ServicioModel(HttpClient httpClient, IConfiguration iConfiguration, IHttpContextAccessor iAccesor) : IServicioModel
    {

        public Respuesta ConsultarServicios()
        {
            Respuesta respuesta = new Respuesta();
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicios";
                string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public List<SelectListItem> ObtenerServicios()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ObtenerListadoServicios";

                var response = httpClient.GetAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    var respuesta = response.Content.ReadFromJsonAsync<Respuesta>().Result;
                    if (respuesta!.Codigo == 1)
                    {
                        var jsonElement = (JsonElement)respuesta.Contenido!;
                        var productos = JsonSerializer.Deserialize<List<Servicio>>(jsonElement.GetRawText());
                        if (productos != null)
                        {
                            return productos.Select(t => new SelectListItem
                            {
                                Value = t.IdServicio.ToString(),
                                Text = t.Descripcion
                            }).ToList();
                        }
                    }
                }
                return new List<SelectListItem>();
            }
        }





//         public Respuesta ConsultarServicio(int id)
//         {
//             Respuesta respuesta = new Respuesta();
//             using (httpClient = new HttpClient())
//             {
//                 string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicio?Id=" + id;

//                 var resp = httpClient.GetAsync(url).Result;

//                 if (resp.IsSuccessStatusCode)
//                     return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
//                 else
//                     return new Respuesta();
//             }
//         }



        public Respuesta RegistrarServicio(Servicio ent) {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/RegistrarServicio";

                string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }

            }
        }
        public Respuesta ActualizarRutaImagen(Servicio ent)
        {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ActualizarRutaImagen";

                string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PutAsync(url, body).Result;
                
                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }

            }
        }

        public Respuesta EliminarServicio(int ServicioId) 
        {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {

                string url = iConfiguration.GetSection("LLaves:UrlApi").Value + "Servicio/EliminarServicio?Id=" + ServicioId;

                string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var resp = httpClient.DeleteAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else 
                {
                    return new Respuesta();
                }
            }
        }

        public Respuesta ConsultarServicio(int id)
        {
            Respuesta respuesta = new Respuesta();
            using (httpClient = new HttpClient())
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicio?Id=" + id;

                string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public Respuesta ActualizarServicio(Servicio ent)
        {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ActualizarServicio";

                string token = iAccesor.HttpContext!.Session.GetString("TOKEN")!.ToString();

                httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

                JsonContent body = JsonContent.Create(ent);

                var resp = httpClient.PutAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                {
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                }
                else
                {
                    return new Respuesta();
                }

            }
        }


}
}