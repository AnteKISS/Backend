package DataAccess.Items;

import java.util.ArrayList;

public class ItemDTO
{
    public int itemId;
    public String itemName;
    public String itemQualityCode;
    public String itemRarityCode;
    public String itemTypeCode;
    public String classCode;

    public ArrayList<ItemStatDTO> itemBaseStats;

    public ItemDTO()
    {
        itemId = 0;
        itemName = "";
        itemQualityCode = "";
        itemRarityCode = "";
        itemTypeCode = "";
        classCode = "";
        itemBaseStats = new ArrayList<ItemStatDTO>();
    }

    public ItemDTO(int itemId, String itemName, String itemQualityCode, String itemRarityCode, String itemTypeCode, String classCode, ArrayList<ItemStatDTO> itemBaseStats)
    {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemQualityCode = itemQualityCode;
        this.itemRarityCode = itemRarityCode;
        this.itemTypeCode = itemTypeCode;
        this.classCode = classCode;
        this.itemBaseStats = itemBaseStats;
    }
}
