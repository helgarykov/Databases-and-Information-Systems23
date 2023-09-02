using Data.Models;

namespace Data.IServices;

public interface IMyTasksService
{
    public IEnumerable<MyTask> GetClientTasksViaDapper(int clientId);
}