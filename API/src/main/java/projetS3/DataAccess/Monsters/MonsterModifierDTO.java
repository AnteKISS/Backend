package projetS3.DataAccess.Monsters;

public class MonsterModifierDTO
{
    public String modifierCode;
    public String modifierName;

    public MonsterModifierDTO()
    {
        modifierCode = "";
        modifierName = "";
    }

    public MonsterModifierDTO(String modifierCode, String modifierName)
    {
        this.modifierCode = modifierCode;
        this.modifierName = modifierName;
    }
}
