using System.Numerics;

namespace HuellitasVetWeb.Entidades
{
    public class Cita
    {


        public DateOnly fecha { get; set; }
        public string hora { get; set; }

        public int idhorario { get; set; }

        public long IdServicio { get; set; }

        public string Descripcion { get; set; }

        public decimal Precio { get; set; }

        public int IdMascota { get; set; }

        public int IdUsuario { get; set; }

        public string FechaCita { get; set; }

        public string NombreCompleto { get; set; }

        public int IdCita { get; set; }

        public string Mascota { get; set; }

        public string Servicio { get; set; }

        public float SubTotal { get; set; }

        public float Impuesto { get; set; }

        public float Total { get; set; }

    }
}
