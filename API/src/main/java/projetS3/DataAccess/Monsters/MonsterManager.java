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
                int monsterId = rs.getInt("id");
                int baseMonsterId = rs.getInt("baseMonsterId");
                String monsterName = rs.getString("name");
                String baseMonsterName = rs.getString("baseName");
                String monsterQualityCode = rs.getString("qualityCode");

                ArrayList<StatDTO> monsterBaseStats = getMonsterBaseStats(monsterId);
                ArrayList<MonsterModifierDTO> monsterModifiers = getMonsterModifiers(monsterId);
                ArrayList<SkillDTO> monsterSkills = getMonsterSkills(baseMonsterId);

                MonsterDTO monsterDTO = new MonsterDTO(monsterId, monsterName, baseMonsterName, monsterQualityCode, monsterBaseStats, monsterModifiers, monsterSkills);
                monsters.add(monsterDTO);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return monsters;
    }

    public ArrayList<StatDTO> getMonsterBaseStats(int monsterId)
    {
        ArrayList<StatDTO> monsterBaseStats = new ArrayList<StatDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetMonsterStats(" + monsterId + ")";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String monsterStatCode = rs.getString("statCode");
                String monsterStatValue = rs.getString("value");

                StatDTO monsterBaseStat = new StatDTO();
                monsterBaseStats.add(monsterBaseStat);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return monsterBaseStats;
    }

    private ArrayList<MonsterModifierDTO> getMonsterModifiers(int monsterId)
    {
        ArrayList<MonsterModifierDTO> monsterModifiers = new ArrayList<MonsterModifierDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetMonsterModifiers(" + monsterId + ")";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String monsterModifierCode = rs.getString("code");
                float modifierValue = rs.getFloat("value");

                MonsterModifierDTO monsterModifier = new MonsterModifierDTO();
                monsterModifiers.add(monsterModifier);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        return monsterModifiers;
    }

    private ArrayList<SkillDTO> getMonsterSkills(int baseMonsterId)
    {
        ArrayList<SkillDTO> skills = new ArrayList<SkillDTO>();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetMonsterSkills(" + baseMonsterId + ")";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                String skillCode = rs.getString("skillCode");
                int skillLevel = rs.getInt("level");

                SkillDTO skill = new SkillDTO(skillCode, skillLevel);
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
