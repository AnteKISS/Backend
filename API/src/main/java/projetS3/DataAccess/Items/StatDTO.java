package projetS3.DataAccess.Items;

public class StatDTO
{
    public String statCode;
    public float statValue;

    public StatDTO()
    {
        statCode = "";
        statValue = 0;
    }

    public StatDTO(String itemStatCode, float statValue)
    {
        this.statCode = itemStatCode;
        this.statValue = statValue;
    }
}
