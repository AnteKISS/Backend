package projetS3.DataAccess.Monsters;

import projetS3.DataAccess.Items.StatDTO;
import projetS3.DataAccess.Skills.SkillDTO;

import java.util.ArrayList;

public class MonsterDTO
{
    public String code;
    public String name;
    public String baseCode;
    public String qualityCode;
    public ArrayList<StatDTO> monsterStats;
    public ArrayList<MonsterModifierDTO> monstersModifiers;
    public ArrayList<SkillDTO> monsterSkills;

    public MonsterDTO()
    {
        code = "";
        name = "";
        baseCode = "";
        qualityCode = "";
        monsterStats = new ArrayList<StatDTO>();
        monstersModifiers = new ArrayList<MonsterModifierDTO>();
        monsterSkills = new ArrayList<SkillDTO>();
    }

    public MonsterDTO(String code, String name, String baseCode, String qualityCode, ArrayList<StatDTO> monsterStats, ArrayList<MonsterModifierDTO> monsterModifiers, ArrayList<SkillDTO> monsterSkills)
    {
        this.code = code;
        this.name = name;
        this.baseCode = baseCode;
        this.qualityCode = qualityCode;
        this.monsterStats = monsterStats;
        this.monstersModifiers = monsterModifiers;
        this.monsterSkills = monsterSkills;
    }
}
