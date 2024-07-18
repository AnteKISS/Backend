package projetS3.Service;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import projetS3.DataAccess.Items.ItemManager;
import projetS3.DataAccess.Monsters.MonsterManager;

@Path("/Monster")
public class MonsterService
{
    MonsterManager monsterManager = new MonsterManager();

    @GET
    @Path("GetAll")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAllMonsters()
    {
        return Response.ok(monsterManager.getAllMonsters()).build();
    }
}
