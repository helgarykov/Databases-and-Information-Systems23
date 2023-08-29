using System.Data;
using Dapper;
using Data.IServices;
using Data.Models;

namespace Data.Services;

public class AddClientService : IAddClientService
{
    private IDbConnection Connection { get; }
    
    public AddClientService(IDbConnection connection)
    {
        Connection = connection;
    }
    
    /* Administrator add a client and return the Id of the new client. */
    public int AddClientViaDapper()
    {
        var parameter = new
        {
            ContactName = "Thomas Holtze",
            Login = "thomas_hltze",
            Password = "thh1982@l",
            Tlf = "60 76 00 27",
            CityAddress = "Birkeroed",
            Street = "Husvej",
            HouseNr = "12",
            FeeMultiplier = 0.0
        };
        var sql = "INSERT INTO Client (ContactName, Login, Password, Tlf, " +
                  "CityAddress, Street, HouseNr, FeeMultiplier) " +
                  "VALUES (@ContactName, @Login, @Password, @Tlf, " +
                  "@CityAddress, @Street, @HouseNr, @FeeMultiplier) " +
                  "RETURNING Id;";


        int newClientId = Connection.QuerySingle<int>(sql, parameter);
        return newClientId;
    }
}