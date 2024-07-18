package projetS3.DataAccess.Skills;

import projetS3.DataAccess.DBInfo;

import java.util.ArrayList;

public class SkillManager
{
    DBInfo dbInfo;

    public SkillManager()
    {
        dbInfo = new DBInfo();
    }

    public ArrayList<SkillDTO> getAllSkills()
    {
        ArrayList<SkillDTO> skills = new ArrayList<>();

        return skills;
    }
}
