using System.Data;

namespace CapaTours.API.Data
{
    public interface IDapperContext
    {
        public IDbConnection CreateConnection();
    }
}
