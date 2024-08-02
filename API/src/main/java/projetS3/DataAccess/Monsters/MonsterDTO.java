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
    public int baseExp;
    public int perLvlExp;
    public ArrayList<MonsterStatDTO> monsterStats;
    public ArrayList<MonsterModifierDTO> monsterModifiers;
    public ArrayList<SkillDTO> monsterSkills;

    public MonsterDTO()
    {
        code = "";
        name = "";
        baseCode = "";
        behaviorCode = "";
        qualityCode = "";
        baseExp = 0;
        perLvlExp = 0;
        monsterStats = new ArrayList<MonsterStatDTO>();
        monsterModifiers = new ArrayList<MonsterModifierDTO>();
        monsterSkills = new ArrayList<SkillDTO>();
    }

    public MonsterDTO(String code, String name, String baseCode, String behaviorCode, String qualityCode, int baseExp, int perLvlExp, ArrayList<MonsterStatDTO> monsterStats, ArrayList<MonsterModifierDTO> monsterModifiers, ArrayList<SkillDTO> monsterSkills)
    {
        this.code = code;
        this.name = name;
        this.baseCode = baseCode;
        this.behaviorCode = behaviorCode;
        this.qualityCode = qualityCode;
        this.baseExp = baseExp;
        this.perLvlExp = perLvlExp;
        this.monsterStats = monsterStats;
        this.monsterModifiers = monsterModifiers;
        this.monsterSkills = monsterSkills;
    }
}
