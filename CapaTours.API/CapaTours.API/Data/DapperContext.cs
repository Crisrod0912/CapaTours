using Microsoft.Data.SqlClient;
using System.Data;

namespace CapaTours.API.Data
{
    public class DapperContext : IDapperContext
    {
        private readonly string? _connectionString;

        public DapperContext(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("BDConnection");
        }

        public IDbConnection CreateConnection()
            => new SqlConnection(_connectionString);
    }
}
