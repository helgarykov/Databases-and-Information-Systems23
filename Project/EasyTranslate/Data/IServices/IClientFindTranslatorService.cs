using Data.ViewModels;

namespace BlazorProject.Models;

public interface IClientFindTranslatorService
{
    public IEnumerable<TranslatorWithLanguage> GetAllTranslatorsViaDapper();
    public IEnumerable<TranslatorWithLanguage> GetTranslatorsViaDapper();

}



