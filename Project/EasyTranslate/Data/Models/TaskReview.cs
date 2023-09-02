namespace Data.Models;

public class TaskReview
{
    private DateTime _dateOfReview;
    private int _stars; // default value

    public int Id { get; set; }

    public DateTime DateOfReview
    {
        get => _dateOfReview;
        set => _dateOfReview = value.Date;
    }

    public string Body { get; set; }

    public int Stars
    {
        get => _stars;
        set
        {
            if (value is < 1 or > 5)
            {
                throw new ArgumentOutOfRangeException(nameof(Stars), "Stars must be between 1 and 5.");
            }
            _stars = value;
        }
    }

    public int TaskId { get; set; }
    public int ClientId { get; set; }
    public int TranslatorId { get; set; }
    public int LanguageId { get; set; }
}
