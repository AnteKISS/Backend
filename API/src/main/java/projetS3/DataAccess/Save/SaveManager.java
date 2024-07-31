package projetS3.DataAccess.Save;

import com.fasterxml.jackson.databind.ObjectMapper;
import projetS3.DataAccess.DBInfo;
import projetS3.DataAccess.Items.StatDTO;
import projetS3.DataAccess.Monsters.MonsterDTO;
import projetS3.DataAccess.Monsters.MonsterModifierDTO;
import projetS3.DataAccess.Skills.SkillDTO;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

public class SaveManager
{
    DBInfo dbInfo;

    public SaveManager()
    {
        dbInfo = new DBInfo();
    }

    public ArrayList<SaveDTO> getSaves(String username)
    {
        ArrayList<SaveDTO> saves = new ArrayList<SaveDTO>();
        String savePath = "";
        ObjectMapper objectMapper = new ObjectMapper();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetSavesByUsername('" + username + "')";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                savePath = rs.getString("savePath");
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        Path relativeSavePath = Paths.get(savePath);
        Path absoluteSavePath = relativeSavePath.toAbsolutePath().normalize();

        try (DirectoryStream<Path> stream = Files.newDirectoryStream(absoluteSavePath, "*.json"))
        {
            for (Path entry : stream) {
                SaveDTO save = objectMapper.readValue(entry.toFile(), SaveDTO.class);
                saves.add(save);
            }
        } catch (IOException | DirectoryIteratorException e) {
            e.printStackTrace();
        }

        return saves;
    }

    public void updateSave(String username, SaveRequestBody requestBody)
    {
        String savePath = "";
        ObjectMapper objectMapper = new ObjectMapper();

        try (Connection conn = DriverManager.getConnection(dbInfo.dbPath, dbInfo.dbUsername, dbInfo.dbPassword))
        {
            String sql = "SELECT * FROM FUNC_GetSavesByUsername('" + username + "')";
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next())
            {
                savePath = rs.getString("savePath");
            }
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }

        if (!Objects.equals(savePath, ""))
        {
            try {
                savePath = savePath + "/save" + requestBody.save.saveSlot + ".json";
                objectMapper.writeValue(new File(savePath), requestBody.save);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
