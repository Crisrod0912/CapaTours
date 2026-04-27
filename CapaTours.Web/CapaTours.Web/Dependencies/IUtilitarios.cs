namespace CapaTours.Web.Dependencies
{
    public interface IUtilitarios
    {
        HttpResponseMessage ConsultarToursAdmin(long TourID);
        HttpResponseMessage ConsultarClientesAdmin(long TourID);
        HttpResponseMessage ConsultarInfoEstados();
    }
}
