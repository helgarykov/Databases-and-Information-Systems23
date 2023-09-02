namespace Data.Models;

public class Category
{
    public int Id { get; set; }
    public string CategoryName { get; set; }
    public float OralFee { get; set; }
    public float WrittenFee { get; set; }
    public float PhoneFee { get; set; }
    public float TransportCostFee { get; set; }
    public float TransportTimeFee { get; set; }
}
