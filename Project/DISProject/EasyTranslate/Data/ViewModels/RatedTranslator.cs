using Data.Models;

namespace Data.ViewModels;

public class RatedTranslator : Translator
{
    public string ContactName { get; }
    public string Language { get; set; }
    public double AverageRating { get; set; }
}