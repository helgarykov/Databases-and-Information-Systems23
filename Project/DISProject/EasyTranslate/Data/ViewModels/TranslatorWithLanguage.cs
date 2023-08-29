using Data.Models;

namespace Data.ViewModels;

public class TranslatorWithLanguage : Translator
{
    public int TranslatorId { get; }
    public string ContactName { get; }
    public string Email { get; set; }
    public string Tlf { get; set; }
    public string Language { get; set; }
    public string CategoryName { get; set; }
  
}
