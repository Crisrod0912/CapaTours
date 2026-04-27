namespace CapaTours.Web.Models
{
    public class PagoModel
    {
        public long PagoID { get; set; }
        public long ReservaID { get; set; }
        public DateTime Fecha { get; set; }
        public string? Comprobante { get; set; }
        public decimal Monto { get; set; }
        public int CantidadPersonas { get; set; }

        public string? NombreTour { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public decimal Precio { get; set; }

        public string? Nombre { get; set; }
        public string? Correo { get; set; }
    }
}
