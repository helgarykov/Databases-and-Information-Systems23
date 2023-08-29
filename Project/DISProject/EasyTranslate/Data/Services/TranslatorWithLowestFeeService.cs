using System.Data;
using Dapper;
using Data.IServices;
using Data.ViewModels;

namespace Data.Services;

public class TranslatorWithLowestFeeService : ITranslatorWithLowestFeeService
{
    private IDbConnection Connection { get; set; }

    public TranslatorWithLowestFeeService(IDbConnection connection)
    {
        Connection = connection;
    }
    
    /* Get all translators of a specific language (in casu German), who take
    the lowest fee.*/
    public IEnumerable<TranslatorWithLowestFee> GetTranslatorsWithLowestFees()
    {
        var lang = "German";
        var lowCat = "Category 3";

        var sql = "SELECT T.FirstName || ' ' || T.LastName AS ContactName, " +
                  "L.NameOfLang AS Language, C.OralFee AS OralFee, C.WrittenFee AS WrittenFee, " +
                  "C.PhoneFee AS PhoneFee, C.TransportCostFee AS TransportCostFee, " +
                  "C.TransportTimeFee AS TransportTimeFee " +
                  "FROM Translator AS T " +
                  "INNER JOIN Translator_Competence TC ON T.Id = TC.Id " +
                  "INNER JOIN Language L ON TC.LanguageId = L.Id " +
                  "INNER JOIN Category C ON TC.CategoryId = C.Id " +
                  "WHERE L.nameOfLang = @lang AND C.CategoryName = @lowCat;";

        IEnumerable<TranslatorWithLowestFee> translators =
            Connection.Query<TranslatorWithLowestFee>(sql, new {lang, lowCat});

        return translators;
    }
    
    /* Get translators' fees — from the lowest to the highest —
    of a specific language (in casu German)*/
    public IEnumerable<TranslatorWithLowestFee> GetTranslatorFeesFromLowestToHighest()
    {
        var lang = "German";
        var category1 = "Category 1";
        var category2 = "Category 2";
        var category3 = "Category 3";

        var sql = @"
            WITH cte AS (
                SELECT  T.FirstName || ' ' || T.LastName AS ContactName, 
                        L.NameOfLang AS Language, 
                        C.OralFee AS OralFee, C.WrittenFee AS WrittenFee, 
                        C.PhoneFee AS PhoneFee, 
                        C.TransportCostFee AS TransportCostFee, 
                        C.TransportTimeFee AS TransportTimeFee,
                        ROW_NUMBER() OVER(PARTITION BY T.FirstName, T.LastName ORDER BY CASE WHEN C.CategoryName = @category3 THEN 1 
                                                                                             WHEN C.CategoryName = @category2 THEN 2
                                                                                             WHEN C.CategoryName = @category1 THEN 3
                                                                                            END) as row_num
                 FROM Translator AS T 
                 INNER JOIN Translator_Competence TC ON T.Id = TC.TranslatorId 
                 INNER JOIN Language L ON TC.LanguageId = L.Id 
                 INNER JOIN Category C ON TC.CategoryId = C.Id 
                 WHERE L.nameOfLang = @lang AND C.CategoryName IN (@category3, @category2, @category1)
            )
            SELECT  ContactName, 
                    Language, 
                    OralFee, WrittenFee, 
                    PhoneFee, 
                    TransportCostFee, 
                    TransportTimeFee 
            FROM cte
            WHERE row_num = 1";

        IEnumerable<TranslatorWithLowestFee> translators =
            Connection.Query<TranslatorWithLowestFee>(sql, new {lang, category3, category2, category1});
        
        return translators;
    }
}