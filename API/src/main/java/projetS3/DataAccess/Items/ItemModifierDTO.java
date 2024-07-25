package projetS3.DataAccess.Items;

public class ItemModifierDTO
{
    public String itemModifierCode;
    public float modifierValue;

    public ItemModifierDTO()
    {
        itemModifierCode = "";
        modifierValue = 0;
    }

    public ItemModifierDTO(String itemModifierCode, float modifierValue)
    {
        this.itemModifierCode = itemModifierCode;
        this.modifierValue = modifierValue;
    }
}
