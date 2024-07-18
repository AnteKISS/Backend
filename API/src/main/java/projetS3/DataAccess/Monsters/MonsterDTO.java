package projetS3.DataAccess.Monsters;

import projetS3.DataAccess.Items.StatDTO;
import projetS3.DataAccess.Skills.SkillDTO;

import java.util.ArrayList;

public class MonsterDTO
{
    int id;
    String name;
    String baseName;
    String qualityCode;
    ArrayList<StatDTO> monsterStats;
    ArrayList<MonsterModifierDTO> monstersModifiers;
    ArrayList<SkillDTO> monsterSkills;

    public MonsterDTO()
    {
        id = 0;
        name = "";
        baseName = "";
        qualityCode = "";
        monsterStats = new ArrayList<StatDTO>();
        monstersModifiers = new ArrayList<MonsterModifierDTO>();
        monsterSkills = new ArrayList<SkillDTO>();
    }

    public MonsterDTO(int id, String name, String baseName, String qualityCode, ArrayList<StatDTO> monsterStats, ArrayList<MonsterModifierDTO> monsterModifiers, ArrayList<SkillDTO> monsterSkills)
    {
        this.id = id;
        this.name = name;
        this.baseName = baseName;
        this.qualityCode = qualityCode;
        this.monsterStats = monsterStats;
        this.monstersModifiers = monsterModifiers;
        this.monsterSkills = monsterSkills;
    }
}
