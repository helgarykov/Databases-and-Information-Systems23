using System.Data;
using Dapper;
using Data.IServices;
using Data.Models;
using Data.ViewModels;

namespace Data.Services;

public class TranslatorEmploymentService : ITranslatorEmploymentService
{
    public IDbConnection Connection { get; }

    public TranslatorEmploymentService(IDbConnection connection)
    {
        Connection = connection;
    }
    
    
    /* Calculate the total years of experience for each (in casu German) translator, both from jobs
     that have ended (TE.DismissalDate IS NOT NULL) and those that are ongoing 
     (TE.DismissalDate IS NULL), and then group and order the results by TotalExperienceYears. */
    public IEnumerable<TranslatorExperience> GetTranslatorCompetenceViaDapper()
    {
        var lang = "German";
        DateTime today = DateTime.Today;
        int currentYear = today.Year;

        string sql = $@"SELECT 
         T.FirstName || ' ' || T.LastName as ContactName, 
        SUM(
            CASE 
                WHEN TE.DismissalDate IS NOT NULL THEN EXTRACT(YEAR FROM TE.DismissalDate) - EXTRACT(YEAR FROM TE.EmploymentDate)
                ELSE {currentYear} - EXTRACT(YEAR FROM TE.EmploymentDate)
            END
        ) AS TotalExperienceYears
        FROM 
            Translator AS T
        JOIN 
            Translator_Employment AS TE ON T.Id = TE.TranslatorId
        JOIN 
            Translator_Competence AS TC ON T.Id = TC.TranslatorId
        JOIN 
            Language AS L ON TC.LanguageId = L.Id
        WHERE 
            L.NameOfLang IN (@lang)
        GROUP BY 
            T.FirstName, 
            T.LastName
        ORDER BY 
            TotalExperienceYears DESC;";

        var translatorExperienceGerman = Connection.Query<TranslatorExperience>(sql, new {lang });

        return translatorExperienceGerman;
    }
}