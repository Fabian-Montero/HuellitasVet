using HuellitasVetWeb.Entidades;

namespace HuellitasVetWeb.Models
{
    public class RolesModel(HttpClient httpClient, IConfiguration iConfiguration) : IRolesModel
    {
        public Respuesta ConsultarTiposRoles()
        {
            using (httpClient)
            {
                string url = iConfiguration.GetSection("Llaves:UrlApi").Value + "Roles/ConsultarTiposRoles";

                var resp = httpClient.GetAsync(url).Result;

                if (resp.IsSuccessStatusCode)
                    return resp.Content.ReadFromJsonAsync<Respuesta>().Result!;
                else
                    return new Respuesta();
            }
        }

    }
}
