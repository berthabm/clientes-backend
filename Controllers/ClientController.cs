using ClientsBackend.Entities;
using ClientsBackend.Models;
using ClientsBackend.Services;
using Microsoft.AspNetCore.Mvc;

namespace ClientsBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientController : ControllerBase
    {
        private readonly ClientService _clientService;

        public ClientController(ClientService clientService)
        {
            _clientService = clientService;
        }

        [ProducesResponseType(typeof(List<ClientModel>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [HttpGet("client-linq")]
        public async Task<ActionResult<List<Client>>> GetAllClients([FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var clients = await _clientService.GetAllClientsAsync(pageNumber, pageSize);
            return Ok(clients);
        }

        [ProducesResponseType(typeof(List<ClientModel>), StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        [HttpGet("client-sp")]
        public async Task<ActionResult<List<ClientModel>>> GetClientsFromStoredProc([FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var clients = await _clientService.GetClientsFromStoredProcAsync(pageNumber, pageSize);
            return Ok(clients);
        }
    }
}
