package DataAccess;

public class DBInfo
{
    public String dbPath;
    public String dbUsername;
    public String dbPassword;

    public DBInfo()
    {
        dbPath = "jdbc:postgresql://localhost:5432/GameData";
        dbUsername = "postgres";
        dbPassword = "admin";
    }
}
