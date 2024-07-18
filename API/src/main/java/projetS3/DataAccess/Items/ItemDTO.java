package projetS3.DataAccess.Items;

import java.util.ArrayList;

public class ItemDTO
{
    public int itemId;
    public String itemName;
    public String itemQualityCode;
    public String itemRarityCode;
    public String itemTypeCode;
    public String classCode;
    public String itemSizeCode;

    public ArrayList<StatDTO> itemBaseStats;
    public ArrayList<ItemModifierDTO> itemModifiers;

    public ItemDTO()
    {
        itemId = 0;
        itemName = "";
        itemQualityCode = "";
        itemRarityCode = "";
        itemTypeCode = "";
        classCode = "";
        itemSizeCode = "";
        itemBaseStats = new ArrayList<StatDTO>();
        itemModifiers = new ArrayList<ItemModifierDTO>();
    }

    public ItemDTO(int itemId, String itemName, String itemQualityCode, String itemRarityCode, String itemTypeCode, String classCode, String itemSizeCode, ArrayList<StatDTO> itemBaseStats, ArrayList<ItemModifierDTO> itemModifiers)
    {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemQualityCode = itemQualityCode;
        this.itemRarityCode = itemRarityCode;
        this.itemTypeCode = itemTypeCode;
        this.classCode = classCode;
        this.itemSizeCode = itemSizeCode;
        this.itemBaseStats = itemBaseStats;
        this.itemModifiers = itemModifiers;
    }
}
