package projetS3.DataAccess.Save;

public class SaveInventoryItemDTO
{
    public int code;
    public int x;
    public int y;

    SaveInventoryItemDTO()
    {
        code = 0;
        x = 0;
        y = 0;
    }

    SaveInventoryItemDTO(int code, int x, int y)
    {
        this.code = code;
        this.x = x;
        this.y = y;
    }
}
