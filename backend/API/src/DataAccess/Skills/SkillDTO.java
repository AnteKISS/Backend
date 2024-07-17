package DataAccess.Skills;

public class SkillDTO
{
    public String skillCode;
    public int skillLevel;

    public SkillDTO(String skillCode, int skillLevel)
    {
        this.skillCode = skillCode;
        this.skillLevel = skillLevel;
    }
}
