package projetS3.DataAccess.Monsters;

import projetS3.DataAccess.DBInfo;
import projetS3.DataAccess.Items.StatDTO;
import projetS3.DataAccess.Skills.SkillDTO;

import java.sql.*;
import java.util.ArrayList;

public class MonsterManager
{
    DBInfo dbInfo;

    public MonsterManager()
    {
        dbInfo = new DBInfo();
    }

    public ArrayList<MonsterDTO> getAllMonsters()
    {
        ArrayList<MonsterDTO> monsters = new ArrayList<MonsterDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetAllMonsters()";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String monsterCode = rs.getString("code");
                String baseMonsterCode = rs.getString("baseCode");
                String monsterBehaviorCode = rs.getString("behaviorCode");
                String monsterName = rs.getString("name");
                String monsterQualityCode = rs.getString("qualityCode");
                int baseExp = rs.getInt("baseExp");
                int perLvlExp = rs.getInt("perLvlExp");

                ArrayList<MonsterStatDTO> monsterBaseStats = getMonsterBaseStats(monsterCode);
                ArrayList<MonsterModifierDTO> monsterModifiers = getMonsterModifiers(monsterCode);
                ArrayList<SkillDTO> monsterSkills = new ArrayList<SkillDTO>();
                //ArrayList<SkillDTO> monsterSkills = getMonsterSkills(baseMonsterId);

                MonsterDTO monsterDTO = new MonsterDTO(monsterCode, monsterName, baseMonsterCode, monsterBehaviorCode, monsterQualityCode, baseExp, perLvlExp, monsterBaseStats, monsterModifiers, monsterSkills);
                monsters.add(monsterDTO);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return monsters;
    }

    public ArrayList<MonsterStatDTO> getMonsterBaseStats(String monsterCode)
    {
        ArrayList<MonsterStatDTO> monsterBaseStats = new ArrayList<MonsterStatDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetMonsterStats('" + monsterCode + "')";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String monsterStatCode = rs.getString("statCode");
                float monsterStatValue = rs.getFloat("baseValue");
                float perLvlValue = rs.getFloat("perLvlValue");

                MonsterStatDTO monsterBaseStat = new MonsterStatDTO(monsterStatCode, monsterStatValue, perLvlValue);
                monsterBaseStats.add(monsterBaseStat);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return monsterBaseStats;
    }

    private ArrayList<MonsterModifierDTO> getMonsterModifiers(String monsterCode)
    {
        ArrayList<MonsterModifierDTO> monsterModifiers = new ArrayList<MonsterModifierDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetMonsterModifiers('" + monsterCode + "')";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String monsterModifierCode = rs.getString("modifierCode");
                String monsterModifierName = rs.getString("modifierName");

                MonsterModifierDTO monsterModifier = new MonsterModifierDTO(monsterModifierCode, monsterModifierName);
                monsterModifiers.add(monsterModifier);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return monsterModifiers;
    }

    private ArrayList<SkillDTO> getMonsterSkills(String baseMonsterCode)
    {
        ArrayList<SkillDTO> skills = new ArrayList<SkillDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetMonsterSkills('" + baseMonsterCode + "')";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String skillCode = rs.getString("skillCode");
                int skillLevel = rs.getInt("level");

                SkillDTO skill = new SkillDTO();
                skills.add(skill);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return skills;
    }
}
