using Microsoft.Data.SqlClient;
using System.Data;

namespace CapaTours.API.Data
{
    public class DapperContext
    {
        private readonly IConfiguration _configuration;
        private readonly string _connectionString;

        public DapperContext(IConfiguration configuration)
        {
            _configuration = configuration;
            _connectionString = configuration.GetConnectionString("CapaTours")
                ?? throw new InvalidOperationException("Connection string 'CapaTours' not found in configuration (appsettings.json)");
        }

        public IDbConnection CreateConnection()
            => new SqlConnection(_connectionString);
    }
}
