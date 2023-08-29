using System.Data;
using Dapper;
using Data.IServices;
using Data.Models;
using Task = System.Threading.Tasks.Task;

namespace Data.Services;

public class FeesAndCategories : IFeesAndCategories
{
    private IDbConnection Connection { get; set; }
    
    public FeesAndCategories(IDbConnection connection)
    {
        Connection = connection;
    }

    public IEnumerable<Category> GetFeesViaDapper()
    {
        var fees = Connection.Query<Category>(sql: $@"
            SELECT *
            FROM Category
        ");
        return fees;
    }
}