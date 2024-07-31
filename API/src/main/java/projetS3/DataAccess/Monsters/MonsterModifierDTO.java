package projetS3.DataAccess.Monsters;

public class MonsterModifierDTO
{
    public String itemModifierCode;
    public float modifierValue;

    public MonsterModifierDTO()
    {
        itemModifierCode = "";
        modifierValue = 0;
    }

    public MonsterModifierDTO(String itemModifierCode, float modifierValue)
    {
        this.itemModifierCode = itemModifierCode;
        this.modifierValue = modifierValue;
    }
}
