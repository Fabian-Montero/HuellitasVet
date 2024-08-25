using HuellitasVetWeb.Entidades;
using System.Net.Http;

namespace HuellitasVetWeb.Models
{
    public class CitaModel(HttpClient httpClient, IConfiguration iConfiguration) : ICitaModel
    {

        public Respuesta ConsultaDisponibilidad(int Id_Servicio, DateTime Fecha)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Citas/ObtenerHorariosDisponibles?Id_Servicio=" + Id_Servicio + "&Fecha=" + Fecha;

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }


        public Respuesta RegistrarCita(Cita entidad)
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Citas/RegistrarCita";
                JsonContent body = JsonContent.Create(entidad);
                var resp = httpClient.PostAsync(url, body).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }
    }
}
