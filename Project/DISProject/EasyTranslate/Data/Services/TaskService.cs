using System.Data;
using Dapper;
using Data.IServices;
using Data.ViewModels;

namespace Data.Services;

public class TaskService : ITaskService
{
    private IDbConnection Connection { get; }

    public TaskService(IDbConnection connection)
    {
        Connection = connection;
    }
        
    /* Add a task and return the Id of the new task. */
    public int AddTaskViaDapper(TaskRequest task)
    {
        var parameters = new
        {
            task.ClientId,
            task.TaskType,
            task.DateOfTask,
            task.StartTime,
            task.EndTime,
            task.Urgent,
            task.Difficult,
            task.CityAddress,
            task.Street,
            task.HouseNr,
            task.TranslatorId,
            task.LanguageId,
            TranslatorCompetenceId = -1
        };
        var sql = "INSERT INTO Task ( ClientId, TaskType, DateOfTask, StartTime, EndTime, " +
                  "Urgent, Difficult, CityAddress, Street, HouseNr, TranslatorId, LanguageId) " +
                  "VALUES (@ClientId, @TaskType, @DateOfTask, @StartTime, @EndTime, " +
                  "@Urgent, @Difficult, @CityAddress, @Street, @HouseNr, @TranslatorId," +
                  "@LanguageId) " +
                  "RETURNING Id;";

        var sqlTransCompId = "SELECT tc.Id AS Id " +
                             "FROM Translator_Competence AS tc " +
                             "WHERE tc.translatorId = @TranslatorId  " +
                             "AND tc.languageId = @LanguageId ;";

        var sqlUpdate = "UPDATE Task " +
                        "SET TranslatorCompetenceId = @TranslatorCompetenceId " +
                        "WHERE Id = @newTask " +
                        "RETURNING Id;";

        int newTask = Connection.QuerySingle<int>(sql, parameters);
        int transCompId = Connection.QuerySingle<int>(sqlTransCompId, parameters);
            
        var parameter2 = new
        {
            TranslatorCompetenceId = transCompId, newTask
        };

        int updateTaskTable = Connection.QuerySingle<int>(sqlUpdate, parameter2);
            
        return newTask;
    }
        
    /* Update the task and return the Id of the new task. */
    public async Task UpdateTaskAsync(int taskId, Data.Models.MyTask taskToUpdate)
    {
        // Create the SQL statement to update the task.
        var sql = "UPDATE Task SET TaskType = @TaskType, DateOfTask = @DateOfTask, StartTime = @StartTime, EndTime = @EndTime, Urgent = @Urgent, Difficult = @Difficult, CityAddress = @CityAddress, Street = @Street, HouseNr = @HouseNr, TranslatorId = @TranslatorId, LanguageId = @LanguageId WHERE Id = @Id";

        // Create an anonymous object to represent the parameters for the SQL statement.
        var parameters = new
        {
            Id = taskId,
            taskToUpdate.TaskType,
            taskToUpdate.DateOfTask,
            taskToUpdate.StartTime,
            taskToUpdate.EndTime,
            taskToUpdate.Urgent,
            taskToUpdate.Difficult,
            taskToUpdate.CityAddress,
            taskToUpdate.Street,
            taskToUpdate.HouseNr,
            taskToUpdate.TranslatorId,
            taskToUpdate.LanguageId
        };

        // Execute the SQL statement asynchronously.
        await Connection.ExecuteAsync(sql, parameters);
    }
        
    /* Delete the task from the table.*/
    public void DeleteTaskById(int taskId)
    {
        var sql = "DELETE FROM Task WHERE Id = @Id";
    
        var parameters = new
        {
            Id = taskId
        };
    
        Connection.Execute(sql, parameters);
    }
}