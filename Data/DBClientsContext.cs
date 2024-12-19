using ClientsBackend.Entities;
using ClientsBackend.Models;
using Microsoft.EntityFrameworkCore;

namespace ClientsBackend.Data
{
    public class DBClientsContext : DbContext
    {
        public DBClientsContext(DbContextOptions<DBClientsContext> options) : base(options) { }

        public DbSet<Client> ClientLinq { get; set; }

        public DbSet<ClientModel> ClientSP { get; set; }
    }
}
