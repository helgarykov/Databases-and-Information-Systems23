using Data.ViewModels;

namespace Data.IServices;

public interface ITranslatorCompetenceService
{
   // public IEnumerable<TranslatorCompetence> GetTranslatorCompetenceViaDapper();

   public IEnumerable<RatedTranslator> GetTranslatorsWithRatings();
}