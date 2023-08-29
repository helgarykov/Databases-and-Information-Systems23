using Data.Models;

namespace Data.IServices;

public interface IFeesAndCategories
{
    public IEnumerable<Category> GetFeesViaDapper();
}