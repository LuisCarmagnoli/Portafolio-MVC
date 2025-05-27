using Portafolio.Models;

namespace Portafolio.Services
{
    public interface IServicioEmail
    {
        Task Enviar(ContactoDTO contacto);
    }
}