package projetS3.DataAccess.Skills;

public class SkillDTO
{
    public String skillCode;
    public int skillLevel;

    public SkillDTO()
    {
        skillCode = "";
        skillLevel = 0;
    }

    public SkillDTO(String skillCode, int skillLevel)
    {
        this.skillCode = skillCode;
        this.skillLevel = skillLevel;
    }
}
