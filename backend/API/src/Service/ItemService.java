package Service;

import DataAccess.Items.ItemDTO;
import DataAccess.Items.ItemManager;

import java.util.ArrayList;

public class ItemService
{
    ItemManager itemManager;

    public ItemService(ItemManager itemManager)
    {
        this.itemManager = itemManager;
    }

    public ArrayList<ItemDTO> getAllItems()
    {
        return itemManager.getAllItems();
    }
}
