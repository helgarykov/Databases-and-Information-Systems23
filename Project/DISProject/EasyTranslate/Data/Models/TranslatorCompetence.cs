namespace Data.Models;

public class TranslatorCompetence
{
    public int Id { get; set; }

    // Foreign keys
    public int TranslatorId { get; set; }
    public int LanguageId { get; set; }
    public int CategoryId { get; set; }
}

