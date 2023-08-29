namespace Data.Models;

public class Client
{
    public int Id { get; set; }
    public string ContactName { get; set; }
    public string Login { get; set; }
    public string Password { get; set; }
    public string Tlf { get; set; }
    public string CityAddress { get; set; }
    public string Street { get; set; }
    public string HouseNr { get; set; }
    public float FeeMultiplier { get; set; }
}
