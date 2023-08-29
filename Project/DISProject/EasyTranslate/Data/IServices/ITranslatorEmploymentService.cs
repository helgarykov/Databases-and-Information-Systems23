using Data.Models;
using Data.ViewModels;

namespace Data.IServices;

public interface ITranslatorEmploymentService
{
    public IEnumerable<TranslatorExperience> GetTranslatorCompetenceViaDapper();
}