namespace CapaTours.API.Models
{
    public class ReservaModel
    {
        public long ReservaID { get; set; }
        public long UsuarioID { get; set; }
        public long TourID { get; set; }
        public int CantidadPersonas { get; set; }
        public string? Estado { get; set; }

        public string? NombreTour { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public decimal Precio { get; set; }

        public string? Nombre { get; set; }
        public string? Correo { get; set; }
    }
}
