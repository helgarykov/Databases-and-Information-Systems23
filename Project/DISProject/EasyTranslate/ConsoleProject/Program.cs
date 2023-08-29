
using System.Data;
using Data.Services;
using Npgsql;

/* creating a connection to a PostgreSQL database using the Npgsql .NET data provider.*/
const string connectionString = "User ID=postgres;Password=1234;" +
                                "Host=localhost;Port=5433;" +
                                "Database=easy_translate;" +
                                "Include Error Detail=true;";

IDbConnection connection = new NpgsqlConnection(connectionString);



/* Service 1. Add a new client to the database and return her Id .#1#
var myAddClientServiceInstance = new AddClientService(connection);
var newClientId = myAddClientServiceInstance.AddClientViaDapper();
Console.WriteLine("\n Add a client and return her Id.\n ");
Console.WriteLine("New Client ID: " + newClientId);

/* Service 2. Get a specific language and its ID. #2#
var clientService = new LanguageService(connection);
var result = clientService.GetLanguageViaDapper();
Console.WriteLine("\n Search for a specific language (in casu English) and print its Id. \n");
var enumerable = result.ToList();
Console.WriteLine(enumerable.First().Id);
Console.WriteLine(enumerable.First().NameOfLang);

/* Service 3 . Get all language and their IDs. #2#
var results = clientService.GetAllLanguagesViaDapper();
Console.WriteLine("\n The list of all languages: \n");
foreach (var lang in results)
{
    Console.WriteLine($"{lang.Id}: {lang.NameOfLang}");
}

/* Service 4. View all German, English, and Russian translators #3#
var clientServiceTranslators = new ClientFindTranslatorService(connection);
var results1 = clientServiceTranslators.GetAllTranslatorsViaDapper();
Console.WriteLine("\n The list of all translators: \n");
foreach (var translator in results1)
{
    Console.WriteLine($"Id: {translator.TranslatorId}, {translator.ContactName}, Email: {translator.Email}, Tlf: {translator.Tlf}, " +
                      $"Language: {translator.Language}, Category: {translator.CategoryName}");
}

/* Service 5. View all English, German and Russian translators according to their average rating
  in the ascending order. #2#
var clientServiceRatedTranslators = new TranslatorCompetenceService(connection);
var result2 = clientServiceRatedTranslators.GetTranslatorsWithRatings();

Console.WriteLine("\n The list of all English, German and Russian translators" +
                  "and their average ratings: \n");
foreach (var translator in result2)
{
    Console.WriteLine($"{translator.ContactName}, Language: {translator.Language}, " +
                      $"Average Rating: {translator.AverageRating}");
}

/* Service 6. Add a task. #2#
var myTaskServiceInstance = new TaskService(connection);
var newTaskId = myTaskServiceInstance.AddTaskViaDapper();
Console.WriteLine("\n Add a task and return its Id.\n");
Console.WriteLine("New Task ID: " + newTaskId);
myTaskServiceInstance.PrintTask(newTaskId);

/* Service 7. Add a task review. #2#
var myTaskReviewServiceInstance = new TaskReviewService(connection);
var newReviewId = myTaskReviewServiceInstance.AddReviewViaDapper();
Console.WriteLine("\n Add a task review and return the Id of the new review.\n");
Console.WriteLine("New Review ID: " + newReviewId);

/* Service 8. View all translators of a specific language (in casu German) and their average
 experience in the descending order. #2#
var myTranslatorEmploymentServiceInstance = new TranslatorEmploymentService(connection);
var result3 = myTranslatorEmploymentServiceInstance.GetTranslatorCompetenceViaDapper();

Console.WriteLine("\n The list of all German translators " +
                  "and their average years of experience: \n");
foreach (var translator in result3)
{
    Console.WriteLine($"{translator.ContactName}, " +
                      $"Total Experience: {translator.TotalExperienceYears}");
}#1#



/* Service 9. View translators' fees — from the lowest to the highest —
 of a specific language (in casu German). #1#
var myTranslatorWithLowestFeeServiceInstance = new TranslatorWithLowestFeeService(connection);
var result4 = myTranslatorWithLowestFeeServiceInstance.GetTranslatorFeesFromLowestToHighest();

foreach (var translator in result4)
{
    Console.WriteLine($"\n{translator.ContactName}, {translator.Language}, " +
                      $"Oral Fee: {translator.OralFee} DK per hour,\n" +
                      $"Written Fee : {translator.WrittenFee} DK per line,\n" +
                      $"Phone Fee: {translator.PhoneFee} DK per hour,\n" +
                      $"TransportCost Fee: {translator.TransportCostFee} DK per kilometer,\n" +
                      $"TransportTime Fee: {translator.TransportTimeFee} DK per hour.");
}
*/





