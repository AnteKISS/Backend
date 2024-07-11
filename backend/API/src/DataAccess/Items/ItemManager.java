package DataAccess.Items;

import java.sql.*;
import java.util.ArrayList;

public class ItemManager
{
    String dbPath = "jdbc:postgresql://localhost:5432/GameData";
    String dbUsername = "postgres";
    String dbPassword = "admin";

    public ItemManager() {}

    public ArrayList<ItemDTO> getAllItems()
    {
        ArrayList<ItemDTO> items = new ArrayList<ItemDTO>();

        try (Connection conn = DriverManager.getConnection(dbPath, dbUsername, dbPassword))
        {
            String sql = "SELECT * FROM Item";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                int itemId = rs.getInt("ItemID");
                String itemName = rs.getString("ItemName");
                String itemQualityCode = rs.getString("ItemQualityCode");
                String itemRarityCode = rs.getString("ItemRarityCode");
                String itemTypeCode = rs.getString("ItemTypeCode");
                String classCode = rs.getString("ClassCode");

                ArrayList<ItemStatDTO> itemBaseStats = getItemBaseStats(itemTypeCode);
                ItemDTO itemDTO = new ItemDTO(itemId, itemName, itemQualityCode, itemRarityCode, itemTypeCode, classCode, itemBaseStats);
                items.add(itemDTO);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return items;
    }

    private ArrayList<ItemStatDTO> getItemBaseStats(String itemTypeCode)
    {
        ArrayList<ItemStatDTO> itemBaseStats = new ArrayList<ItemStatDTO>();

        try (Connection conn = DriverManager.getConnection(dbPath, dbUsername, dbPassword))
        {
            String sql = "SELECT * FROM ItemBaseStats WHERE ItemTypeCode = '" + itemTypeCode + "'";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String itemStatCode = rs.getString("itemStatCode");
                String itemStatValue = rs.getString("statValue");

                ItemStatDTO itemBaseStat = new ItemStatDTO();
                itemBaseStats.add(itemBaseStat);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return itemBaseStats;
    }

    private ArrayList<ItemStatDTO> getItemModifiers(int itemId)
    {
        ArrayList<ItemStatDTO> itemBaseStats = new ArrayList<ItemStatDTO>();

        try (Connection conn = DriverManager.getConnection(dbPath, dbUsername, dbPassword))
        {
            String sql = "SELECT * FROM ItemItemModifier WHERE itemId = '" + itemId + "'";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String itemModifierCode = rs.getString("itemModifierCode");
                float modifierValue = rs.getFloat("modifierValue");

                ItemStatDTO itemBaseStat = new ItemStatDTO();
                itemBaseStats.add(itemBaseStat);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return itemBaseStats;
    }
}
