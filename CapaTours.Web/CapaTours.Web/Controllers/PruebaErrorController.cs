using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Text.Json;

namespace CapaTours.Web.Controllers
{
    public class PruebaErrorController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IHttpClientFactory _httpClientFactory;

        public PruebaErrorController(IConfiguration configuration, IHttpClientFactory httpClientFactory)
        {
            _configuration = configuration;
            _httpClientFactory = httpClientFactory;
        }

        #region CapturarErrorPrueba

        public async Task<IActionResult> CapturarError()
        {
            try
            {
                throw new Exception("Error generado intencionalmente para prueba.");
            }
            catch (Exception ex)
            {
                await EnviarErrorApi(1, ex.Message, nameof(PruebaErrorController));

                return View("Error");
            }
        }

        #endregion

        #region EnviarErrorApi

        private async Task EnviarErrorApi(long usuarioId, string mensaje, string origen)
        {
            try
            {
                var client = _httpClientFactory.CreateClient();

                var url = _configuration["Variables:urlApi"] + "PruebaError/CapturarError";

                var errorData = new
                {
                    UsuarioID = usuarioId,
                    Mensaje = mensaje,
                    Origen = origen
                };

                var contenido = new StringContent(JsonSerializer.Serialize(errorData), Encoding.UTF8, "application/json");

                var response = await client.PostAsync(url, contenido);
            }
            catch
            {

            }
        }

        #endregion

    }
}
