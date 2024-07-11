package DataAccess.Items;

public class ItemStatDTO
{
    public String itemStatCode;
    public float statValue;

    public ItemStatDTO()
    {
        itemStatCode = "";
        statValue = 0;
    }

    public ItemStatDTO(String itemStatCode, float statValue)
    {
        this.itemStatCode = itemStatCode;
        this.statValue = statValue;
    }
}
