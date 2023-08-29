using System.Data;
using Dapper;
using Data.IServices;
using Data.Models;

namespace Data.Services;

/* Class for creating a task review. */
public class TaskReviewService : ITaskReviewService
{  
    public IDbConnection Connection { get; }

    public TaskReviewService(IDbConnection connection)
    {
        Connection = connection;
    }
    
    public int AddReviewViaDapper(TaskReview review)
    {
        var parameters = new 
        {
            review.DateOfReview,
            review.Body,
            review.Stars,
            review.TaskId,
            review.ClientId,
            review.TranslatorId,
            review.LanguageId,
        };
        var sql = "INSERT INTO Task_Review (DateOfReview, Body," +
                  " Stars, TaskId, ClientId, TranslatorId, LanguageId) " +
                  "VALUES (@DateOfReview, @Body, @Stars, @TaskId, @ClientId," +
                  " @TranslatorId, @LanguageId) " +
                  "RETURNING Id;";

        int newId = Connection.QuerySingle<int>(sql, parameters);

        return newId;
    }
}

