using System.Data;
using Dapper;
using Data.IServices;
using Data.ViewModels;

namespace Data.Services;

/* Class for implementing queries on the average rating of translators.
 Note: The method below implements the query on English, German and Russian
 translators. */
public class TranslatorCompetenceService : ITranslatorCompetenceService 
{
    public IDbConnection Connection { get; }

    public TranslatorCompetenceService(IDbConnection connection)
    {
        Connection = connection;
    }
    public IEnumerable<RatedTranslator> GetTranslatorsWithRatings()
    {
        var languages = new string[] { "English", "Russian", "German" };
        
        var sql = "SELECT translator.FirstName || ' ' || translator.LastName as ContactName, " +
                  "language.nameOfLang as Language, avg(tr.Stars) as AverageRating " +
                  "FROM Translator " +
                  "INNER JOIN Task_Review tr ON translator.Id = tr.TranslatorId " +
                  "INNER JOIN Language ON tr.LanguageId = language.id " +
                  "WHERE Language.nameOfLang = ANY(@languages) " +
                  "GROUP BY translator.FirstName, translator.LastName, language.nameOfLang " +
                  "ORDER BY CASE WHEN language.nameOfLang = 'English' THEN 1 " +
                  "WHEN language.nameOfLang = 'German' THEN 2 " +
                  "WHEN language.nameOfLang = 'Russian' THEN 3 END, " +
                  "AVG(tr.Stars)";
        
        IEnumerable<RatedTranslator> allRatedTranslators = Connection.Query<RatedTranslator>(sql,new {languages});
            
        return allRatedTranslators;
    } 
}


