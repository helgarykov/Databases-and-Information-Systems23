using Data.Models;

namespace Data.IServices;

public interface ITaskReviewService
{
    public int AddReviewViaDapper(TaskReview review);
}