namespace Data.Models;

public class MyTask
{
    private string? _taskType;
    private DateTime _dateOfTask;
    private TimeSpan _startTime;
    private TimeSpan _endTime;

    public int Id { get; set; }

    public string? TaskType
    {
        get => _taskType;
        set => _taskType = value ?? throw new ArgumentNullException(nameof(TaskType));
    }

    public DateTime DateOfTask
    {
        get => _dateOfTask;
        set => _dateOfTask = value.Date; 
    }

    public TimeSpan StartTime
    {
        get => _startTime;
        set => _startTime = value;
    }

    public TimeSpan EndTime
    {
        get => _endTime;
        set => _endTime = value;
    }

    public int? Urgent { get; set; }
    public int? Difficult { get; set; }
    public string CityAddress { get; set; }
    public string Street { get; set; }
    public string HouseNr { get; set; }
    public int TranslatorCompetenceID { get; set; } 
    public int ClientId { get; set; } 
    public int TranslatorId { get; set; }
    public int LanguageId { get; set; }
}
