using Data.Models;

namespace Data.ViewModels;

public class TranslatorWithLowestFee : Translator
{
    public string? ContactName { get; set; }
    
    public string? Language { get; set; }
    
    public double OralFee { get; set; }
    
    public double WrittenFee { get; set; }
    
    public double PhoneFee { get; set; }
    
    public double TransportCostFee { get; set; }
    
    public double TransportTimeFee { get; set; }
}