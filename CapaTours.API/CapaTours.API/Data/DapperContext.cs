using Microsoft.Data.SqlClient;
using System.Data;

namespace CapaTours.API.Data
{
    public class DapperContext : IDapperContext
    {
        private readonly string? _connectionString;

        public DapperContext(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BDConnection")
                ?? configuration.GetConnectionString("Default")
                ?? throw new InvalidOperationException("Connection string 'BDConnection' not found in configuration (appsettings.json)."); 
        }

        public IDbConnection CreateConnection()
            => new SqlConnection(_connectionString);
    }
}
