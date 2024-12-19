using ClientsBackend.Data;
using ClientsBackend.Entities;
using ClientsBackend.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ClientsBackend.Services
{
    public class ClientService
    {
        private readonly DBClientsContext _context;

        public ClientService(DBClientsContext context)
        {
            _context = context;
        }

        public async Task<List<Client>> GetAllClientsAsync(int pageNumber, int pageSize)
        {

            int skip = (pageNumber - 1) * pageSize;

            decimal totalCount = await _context.ClientLinq.CountAsync();

            var clients = await _context.ClientLinq
                .OrderBy(c => c.id) // Orden explícito
                .Skip(skip)
                .Take(pageSize)
                .ToListAsync();

            clients.ForEach(client => client.TotalCount = Math.Ceiling(totalCount/pageSize));

            return clients;
        }


        public async Task<List<ClientModel>> GetClientsFromStoredProcAsync(int pageNumber, int pageSize)
        {

            var result = await _context.ClientSP
                .FromSqlRaw("EXEC GetClients @PageNumber = {0}, @PageSize = {1}", pageNumber, pageSize)
                .ToListAsync();

            // Mapea los resultados a ClientModel
            var clients = result.Select(client => new ClientModel
            {
                id = client.id,
                name = client.name,
                phone = client.phone,
                country = client.country,
                TotalCount = Math.Ceiling(client.TotalCount/pageSize)
            }).ToList();

            return (clients);
        }
    }
}
