using Data.Models;

namespace Data.ViewModels;

public class TranslatorExperience : Translator
{
    public string ContactName { get; set; }
    
    public double TotalExperienceYears { get; set; }
}