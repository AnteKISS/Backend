package projetS3.DataAccess.Save;

public class SaveEquippedItemDTO
{
    public String slot;
    public int itemId;

    SaveEquippedItemDTO()
    {
        slot = "";
        itemId = 0;
    }

    SaveEquippedItemDTO(String slotCode, int itemId)
    {
        this.slot = slotCode;
        this.itemId = itemId;
    }
}
