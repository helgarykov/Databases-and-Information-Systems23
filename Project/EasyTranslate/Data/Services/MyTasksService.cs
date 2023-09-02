using System.Data;
using Dapper;
using Data.IServices;
using Data.Models;

namespace Data.Services;

public class MyTasksService : IMyTasksService
{  
    private IDbConnection Connection { get; set; }
    
    public MyTasksService(IDbConnection connection)
    {
        Connection = connection;
    }

    public IEnumerable<MyTask> GetClientTasksViaDapper(int clientId)
    {
        var tasks = Connection.Query<MyTask>(sql: $@"
            SELECT *
            FROM Task
            WHERE ClientId = {clientId}
        ");
        return tasks;
    }
    
}

