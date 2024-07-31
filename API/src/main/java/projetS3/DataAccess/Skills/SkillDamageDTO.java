package projetS3.DataAccess.Skills;

public class SkillDamageDTO
{
    public String skillDamageCode;
    public float baseScaling_pct;
    public float baseDamage;
    public float perLvlDamageModifier;
    public float perLvlDamageFactor;
    public float perLvlScalingModifier;
    public float perLvlScalingFactor;
    public String scalingStatCode;

    public SkillDamageDTO()
    {
        skillDamageCode = "";
        baseScaling_pct = 0;
        baseDamage = 0;
        perLvlDamageModifier = 0;
        perLvlDamageFactor = 0;
        perLvlScalingModifier = 0;
        perLvlScalingFactor = 0;
        scalingStatCode = "";
    }

    public SkillDamageDTO(String skillDamageCode, float baseScaling_pct, float baseDamage, float perLvlDamageModifier, float perLvlDamageFactor, float perLvlScalingModifier, float perLvlScalingFactor, String scalingStatCode)
    {
        this.skillDamageCode = skillDamageCode;
        this.baseScaling_pct = baseScaling_pct;
        this.baseDamage = baseDamage;
        this.perLvlDamageModifier = perLvlDamageModifier;
        this.perLvlDamageFactor = perLvlDamageFactor;
        this.perLvlScalingModifier = perLvlScalingModifier;
        this.perLvlScalingFactor = perLvlScalingFactor;
        this.scalingStatCode = scalingStatCode;
    }
}
