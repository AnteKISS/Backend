package projetS3.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import projetS3.DataAccess.Monsters.MonsterManager;
import projetS3.DataAccess.Skills.SkillManager;

@Path("/Skill")
public class SkillService
{
    SkillManager skillManager = new SkillManager();
    ObjectMapper mapper = new ObjectMapper();

    @GET
    @Path("GetAll")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllSkills()
    {
        ObjectWriter objectWriter = mapper.writer().withDefaultPrettyPrinter();

        Object object = skillManager.getAllSkills();

        try {
            return objectWriter.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }
}
