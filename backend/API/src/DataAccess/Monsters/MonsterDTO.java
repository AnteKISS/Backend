package DataAccess.Monsters;

public class MonsterDTO
{
    int id;
    String name;
    String baseName;
    String qualityCode;

    public MonsterDTO()
    {
        id = 0;
        name = "";
        baseName = "";
        qualityCode = "";
    }

    public MonsterDTO(int id, String name, String baseName, String qualityCode)
    {
        this.id = id;
        this.name = name;
        this.baseName = baseName;
        this.qualityCode = qualityCode;
    }
}
