package projetS3.DataAccess.Save;

public class SaveAttributePointsDTO
{
    public int strength;
    public int dexterity;
    public int vitality;
    public int intelligence;

    SaveAttributePointsDTO()
    {
        strength = 0;
        dexterity = 0;
        vitality = 0;
        intelligence = 0;
    }

    SaveAttributePointsDTO(int strength, int dexterity, int vitality, int intelligence)
    {
        this.strength = strength;
        this.dexterity = dexterity;
        this.vitality = vitality;
        this.intelligence = intelligence;
    }
}
