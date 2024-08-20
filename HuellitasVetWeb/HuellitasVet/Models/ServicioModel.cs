using HuellitasVetWeb.Entidades;
using System.Security.Policy;

namespace HuellitasVetWeb.Models
{
    public class ServicioModel(HttpClient httpClient, IConfiguration iConfiguration) : IServicioModel
    {
        public Respuesta ConsultarServicios()
        {
            Respuesta respuesta = new Respuesta();
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/ConsultarServicios";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

        public Respuesta RegistrarServicio(Servicio ent) {
            Respuesta respuesta = new Respuesta();

            using (httpClient = new HttpClient())
            {
                var url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Servicio/RegistrarServicio";

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
