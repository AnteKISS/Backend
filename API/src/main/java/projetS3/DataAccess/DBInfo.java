package projetS3.DataAccess;

public class DBInfo
{
    public String dbPath;
    public String dbUsername;
    public String dbPassword;

    public DBInfo()
    {
        dbPath = "jdbc:postgresql://localhost:5444/GameData";
        dbUsername = "postgres";
        dbPassword = "admin";
    }
}
