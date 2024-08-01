package projetS3.DataAccess.Monsters;

import projetS3.DataAccess.Items.StatDTO;
import projetS3.DataAccess.Skills.SkillDTO;

import java.util.ArrayList;

public class MonsterDTO
{
    public String code;
    public String name;
    public String baseCode;
    public String behaviorCode;
    public String qualityCode;
    public ArrayList<StatDTO> monsterStats;
    public ArrayList<MonsterModifierDTO> monsterModifiers;
    public ArrayList<SkillDTO> monsterSkills;

    public MonsterDTO()
    {
        code = "";
        name = "";
        baseCode = "";
        behaviorCode = "";
        qualityCode = "";
        monsterStats = new ArrayList<StatDTO>();
        monsterModifiers = new ArrayList<MonsterModifierDTO>();
        monsterSkills = new ArrayList<SkillDTO>();
    }

    public MonsterDTO(String code, String name, String baseCode, String behaviorCode, String qualityCode, ArrayList<StatDTO> monsterStats, ArrayList<MonsterModifierDTO> monsterModifiers, ArrayList<SkillDTO> monsterSkills)
    {
        this.code = code;
        this.name = name;
        this.baseCode = baseCode;
        this.behaviorCode = behaviorCode;
        this.qualityCode = qualityCode;
        this.monsterStats = monsterStats;
        this.monsterModifiers = monsterModifiers;
        this.monsterSkills = monsterSkills;
    }
}
