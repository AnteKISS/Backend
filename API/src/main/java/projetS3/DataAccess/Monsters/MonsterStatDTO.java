package projetS3.DataAccess.Monsters;

public class MonsterStatDTO
{
    public String statCode;
    public float baseValue;
    public float perLvlValue;

    public MonsterStatDTO()
    {
        statCode = "";
        baseValue = 0;
        perLvlValue = 0;
    }

    public MonsterStatDTO(String statCode, float baseValue, float perLvlValue)
    {
        this.statCode = statCode;
        this.baseValue = baseValue;
        this.perLvlValue = perLvlValue;
    }
}
