package projetS3.DataAccess.Save;

import projetS3.DataAccess.Items.StatDTO;
import projetS3.DataAccess.Monsters.MonsterDTO;
import projetS3.DataAccess.Monsters.MonsterModifierDTO;
import projetS3.DataAccess.Skills.SkillDTO;

import java.sql.*;
import java.util.ArrayList;

public class SaveManager
{
    public ArrayList<SaveDTO> getSaves(String username)
    {
        ArrayList<SaveDTO> saves = new ArrayList<SaveDTO>();

        /*try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetAllMonsters()";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                int monsterCode = rs.getString("code");
                int baseMonsterId = rs.getInt("baseCode");
                String monsterName = rs.getString("name");
                String baseMonsterName = rs.getString("baseName");
                String monsterQualityCode = rs.getString("qualityCode");

                ArrayList<StatDTO> monsterBaseStats = getMonsterBaseStats(monsterId);
                ArrayList<MonsterModifierDTO> monsterModifiers = getMonsterModifiers(monsterId);
                ArrayList<SkillDTO> monsterSkills = new ArrayList<SkillDTO>();
                //ArrayList<SkillDTO> monsterSkills = getMonsterSkills(baseMonsterId);

                MonsterDTO monsterDTO = new MonsterDTO(monsterId, monsterName, baseMonsterName, monsterQualityCode, monsterBaseStats, monsterModifiers, monsterSkills);
                monsters.add(monsterDTO);
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }*/

        return saves;
    }
}
