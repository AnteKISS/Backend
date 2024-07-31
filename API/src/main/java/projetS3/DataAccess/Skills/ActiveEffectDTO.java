package projetS3.DataAccess.Skills;

public class ActiveEffectDTO
{
    public String activeEffectCode;
    public float baseValue;
    public float perLvlValueModifier;
    public float perLvlValueFactor;

    public ActiveEffectDTO()
    {
        activeEffectCode = "";
        baseValue = 0;
        perLvlValueModifier = 0;
        perLvlValueFactor = 0;
    }

    public ActiveEffectDTO(String activeEffectCode, float baseValue, float perLvlValueModifier, float perLvlValueFactor)
    {
        this.activeEffectCode = activeEffectCode;
        this.baseValue = baseValue;
        this.perLvlValueModifier = perLvlValueModifier;
        this.perLvlValueFactor = perLvlValueFactor;
    }
}
