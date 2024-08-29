namespace HuellitasVetWeb.Entidades
{
    public class Servicio
    {
        public int IdServicio { get; set; }
        public string? Descripcion { get; set; }


        //public decimal Precio { get; set; }

        //public DateTime Fecha { get; set; }

        public DateTime fecha { get; set; }

        public int IdMascota { get; set; }

        public int IdUsuario { get; set; }

        public string? Mascota { get; set; }

        public int idhorario { get; set; }

        public string hora { get; set; }

        public float Precio { get; set; }

        public string? RutaImagen { get; set; }
       


    }
}
