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
            task.LanguageId
        };

        // Ensure the connection is open
        if (Connection.State != ConnectionState.Open)
            Connection.Open();
        
        using (var transaction = Connection.BeginTransaction())
        {
            try
            {
                // Log the task details just before insertion
                Console.WriteLine($"Attempting to insert task: {System.Text.Json.JsonSerializer.Serialize(task)}");

                var sql = @"
                INSERT INTO Task (ClientId, TaskType, DateOfTask, StartTime, EndTime, Urgent, Difficult, CityAddress, Street, HouseNr, TranslatorId, LanguageId)
                VALUES (@ClientId, @TaskType, @DateOfTask, @StartTime, @EndTime, @Urgent, @Difficult, @CityAddress, @Street, @HouseNr, @TranslatorId, @LanguageId)
                RETURNING Id;";

                int newTask = Connection.QuerySingle<int>(sql, parameters, transaction);

                var sqlTransCompId = @"
                SELECT Id FROM Translator_Competence
                WHERE translatorId = @TranslatorId AND languageId = @LanguageId;";

                // Validate if there is a competence match
                int? transCompId = Connection.QuerySingleOrDefault<int?>(sqlTransCompId, parameters, transaction);

                if (!transCompId.HasValue)
                {
                    throw new InvalidOperationException("No valid language found for the chosen Translator ID.");
                }

                var sqlUpdate = @"
                UPDATE Task
                SET TranslatorCompetenceId = @TranslatorCompetenceId
                WHERE Id = @newTask
                RETURNING Id;";

                Connection.QuerySingle<int>(sqlUpdate, new { TranslatorCompetenceId = transCompId, newTask }, transaction);

                transaction.Commit();
                return newTask;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                Console.WriteLine($"Error occurred: {ex.Message}");
                throw;  // Rethrow to handle the exception further up the call stack
            }
        }
    }


    private bool ValidateTranslatorCompetence(int translatorId, int languageId)
    {
        // Placeholder logic: replace with actual validation
        // For example, querying from a database to check if the translator can translate the specified language
        return translatorId == languageId; // Simulate a match
    }

    
    /* Add a new task only if it is not already in the task table */
    public bool TaskExists(TaskRequest task)
    {
        var parameters = new
        {
            task.DateOfTask,
            task.StartTime,
            task.EndTime
        };
        var sql = @"
        SELECT EXISTS (
            SELECT 1 FROM Task
            WHERE DateOfTask = @DateOfTask AND StartTime = @StartTime AND EndTime = @EndTime
        );";
        return Connection.QuerySingle<bool>(sql, parameters);
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
    
    
    public void PrintTask(int taskId)
    {
        var sql = "SELECT * FROM Task WHERE Id = @TaskId;";
        var parameters = new { TaskId = taskId };

        IEnumerable<TaskRequest> tasks = Connection.Query<TaskRequest>(sql, parameters);

        foreach (var task in tasks)
        {
            Console.WriteLine("Task Details:");
            Console.WriteLine($"ClientId: {task.ClientId}");
            Console.WriteLine($"TaskType: {task.TaskType}");
            Console.WriteLine($"DateOfTask: {task.DateOfTask}");
            Console.WriteLine($"StartTime: {task.StartTime}");
            Console.WriteLine($"EndTime: {task.EndTime}");
            Console.WriteLine($"Urgent: {task.Urgent}");
            Console.WriteLine($"Difficult: {task.Difficult}");
            Console.WriteLine($"CityAddress: {task.CityAddress}");
            Console.WriteLine($"Street: {task.Street}");
            Console.WriteLine($"HouseNr: {task.HouseNr}");
            Console.WriteLine($"TranslatorName: {task.TranslatorId}");
            Console.WriteLine($"Language: {task.LanguageId}");
            Console.WriteLine();
        }
    }
    
}