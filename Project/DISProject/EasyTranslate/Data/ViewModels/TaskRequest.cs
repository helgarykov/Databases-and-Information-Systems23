namespace Data.ViewModels;

public class TaskRequest
{
    public int ClientId { get; set; }
    public string? TaskType { get; set; }
    public DateTime DateOfTask { get; set; }
    public TimeSpan StartTime { get; set; }
    public TimeSpan EndTime { get; set; }
    public int Urgent { get; set; }
    public int Difficult { get; set; }

    public string? CityAddress { get; set; }

    public string? Street { get; set; }

    public string? HouseNr { get; set; }
    public int TranslatorId { get; set; }
    public int LanguageId { get; set; }
    public int TranslatorCompetenceId { get; set; }
}

