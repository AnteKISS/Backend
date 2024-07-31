package projetS3.DataAccess.Save;

import java.util.ArrayList;

public class SaveDTO
{
    public int saveSlot;
    public String playerName;
    public float playerX;
    public float playerY;
    public SaveAttributePointsDTO playerAllocatedPoints;
    public int playerUnallocatedPoints;
    public int playerXp;
    public ArrayList<SaveInventoryItemDTO> playerInventoryItems;
    public ArrayList<SaveEquippedItemDTO> playerEquippedItems;

    SaveDTO()
    {
        saveSlot = 0;
        playerName = "";
        playerX = 0;
        playerY = 0;
        playerAllocatedPoints = new SaveAttributePointsDTO();
        playerUnallocatedPoints = 0;
        playerXp = 0;
        playerInventoryItems = new ArrayList<SaveInventoryItemDTO>();
        playerEquippedItems = new ArrayList<SaveEquippedItemDTO>();
    }

    SaveDTO(int saveSlot, String playerName, float playerX, float playerY, SaveAttributePointsDTO playerAllocatedPoints, int playerUnallocatedPoints, int playerXp, ArrayList<SaveInventoryItemDTO> playerInventoryItems, ArrayList<SaveEquippedItemDTO> playerEquippedItems)
    {
        this.saveSlot = saveSlot;
        this.playerName = playerName;
        this.playerX = playerX;
        this.playerY = playerY;
        this.playerAllocatedPoints = playerAllocatedPoints;
        this.playerUnallocatedPoints = playerUnallocatedPoints;
        this.playerXp = playerXp;
        this.playerInventoryItems = playerInventoryItems;
        this.playerEquippedItems = playerEquippedItems;
    }
}
