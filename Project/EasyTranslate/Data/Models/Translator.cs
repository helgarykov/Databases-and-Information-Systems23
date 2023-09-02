namespace Data.Models;

public class Translator
{
    private string? _firstName;
    private string? _lastName;
    private int _age = 18; // default value
    private string? _education;

    public int Id { get; set; }

    public string? FirstName
    {
        get => _firstName;
        set => _firstName = value ?? throw new ArgumentNullException(nameof(FirstName));
    }

    public string? LastName
    {
        get => _lastName;
        set => _lastName = value ?? throw new ArgumentNullException(nameof(LastName));
    }

    public int Age
    {
        get => _age;
        set
        {
            if (value < 18 || value > 70)
            {
                throw new ArgumentOutOfRangeException(nameof(Age), "Age must be between 18 and 70.");
            }
            _age = value;
        }
    }

    public string? CityAddress { get; set; }
    public string? Street { get; set; }
    public string? HouseNr { get; set; }
    public string? Email { get; set; }  // uniqueness should be enforced in database
    public string? Tlf { get; set; }    // uniqueness should be enforced in database

    public string? Education
    {
        get => _education;
        set => _education = value ?? throw new ArgumentNullException(nameof(Education));
    }
}
