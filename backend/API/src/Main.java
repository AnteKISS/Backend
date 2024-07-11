import DataAccess.Items.ItemDTO;
import DataAccess.Items.ItemManager;
import Service.ItemService;

import java.util.ArrayList;

public class Main
{
    static ItemManager itemManager;

    static ItemService itemService;

    public static void main(String[] args)
    {
        init();

        ArrayList<ItemDTO> test = itemService.getAllItems();

        System.out.println("Hello world!");
    }

    public static void init()
    {
        itemManager = new ItemManager();

        itemService = new ItemService(itemManager);
    }
}