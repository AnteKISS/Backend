package projetS3.DataAccess.Skills;

public class SkillDTO
{
    public String skillCode;
    public String skillName;
    public int range_m;
    public float castTime;
    public float baseCooldown_s;
    public float perLevelCooldownModifier;
    public float baseManaCost;
    public float perLevelManaCostFactor;
    public float perLevelManaCostModifier;
    public float perLevelCooldownFactor;
    public int skillLevel;

    public SkillDTO()
    {
        skillCode = "";
        skillName = "";
        range_m = 0;
        castTime = 0;
        baseCooldown_s = 0;
        perLevelCooldownModifier = 0;
        baseManaCost = 0;
        perLevelManaCostFactor = 0;
        perLevelManaCostModifier = 0;
        perLevelCooldownFactor = 0;
        skillLevel = 0;
    }

    public SkillDTO(String skillCode, String skillName, int range_m, float castTime, float baseCooldown_s, float perLevelCooldownModifier, float baseManaCost, float perLevelManaCostFactor, float perLevelManaCostModifier, float perLevelCooldownFactor, int skillLevel)
    {
        this.skillCode = skillCode;
        this.skillName = skillName;
        this.range_m = range_m;
        this.castTime = castTime;
        this.baseCooldown_s = baseCooldown_s;
        this.perLevelCooldownModifier = perLevelCooldownModifier;
        this.baseManaCost = baseManaCost;
        this.perLevelManaCostFactor = perLevelManaCostFactor;
        this.perLevelManaCostModifier = perLevelManaCostModifier;
        this.perLevelCooldownFactor = perLevelCooldownFactor;
        this.skillLevel = skillLevel;
    }
}
