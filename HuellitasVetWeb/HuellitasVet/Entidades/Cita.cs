using System.Numerics;

namespace HuellitasVetWeb.Entidades
{
    public class Cita
    {


        public DateTime fecha { get; set; }
        public string hora { get; set; }

        public int idhorario { get; set; }

        public long IdServicio { get; set; }

        public string Descripcion { get; set; }

        public decimal Precio { get; set; }

        public int IdMascota { get; set; }

        public int IdUsuario { get; set; }

    }
}
