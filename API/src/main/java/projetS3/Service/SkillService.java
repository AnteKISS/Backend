package projetS3.Service;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import projetS3.DataAccess.Skills.SkillManager;

@Path("/Skill")
public class SkillService
{
    SkillManager skillManager = new SkillManager();

    @GET
    @Path("GetAll")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllSkills()
    {
        return Response.ok(skillManager.getAllSkills()).build();
    }
}
