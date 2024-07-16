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
            String sql = "SELECT * FROM FUNC_GetALLItemsCore()";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                int itemId = rs.getInt("id");
                String itemName = rs.getString("name");
                String itemQualityCode = rs.getString("qualityCode");
                String itemRarityCode = rs.getString("rarityCode");
                String itemTypeCode = rs.getString("typeCode");
                String classCode = rs.getString("reservedClassCode");
                String itemSizeCode = rs.getString("sizeCode");

                ArrayList<ItemStatDTO> itemBaseStats = getItemBaseStats(itemTypeCode);
                ArrayList<ItemModifierDTO> itemModifiers = getItemModifiers(itemId);
                ItemDTO itemDTO = new ItemDTO(itemId, itemName, itemQualityCode, itemRarityCode, itemTypeCode, classCode, itemSizeCode, itemBaseStats, itemModifiers);
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
            String sql = "SELECT * FROM FUNC_GetItemStats('" + itemTypeCode + "')";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String itemStatCode = rs.getString("statCode");
                String itemStatValue = rs.getString("value");

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

    private ArrayList<ItemModifierDTO> getItemModifiers(int itemId)
    {
        ArrayList<ItemModifierDTO> itemModifiers = new ArrayList<ItemModifierDTO>();

        try (Connection conn = DriverManager.getConnection(dbPath, dbUsername, dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetItemModifiers(" + itemId + ")";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String itemModifierCode = rs.getString("itemModifierCode");
                float modifierValue = rs.getFloat("modifierValue");

                ItemModifierDTO itemModifier = new ItemModifierDTO();
                itemModifiers.add(itemModifier);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return itemModifiers;
    }
}
