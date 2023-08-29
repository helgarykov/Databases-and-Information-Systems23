namespace Data.Models;

public class TranslatorEmployment
{
    public int Id { get; set; }
    
    public DateTime EmploymentDate { get; set; }
    
    public DateTime? DismissalDate { get; set; }
    
    public string Position { get; set; }
    
    public string CompanyName { get; set; }
    
    public int TranslatorId { get; set; }
}

