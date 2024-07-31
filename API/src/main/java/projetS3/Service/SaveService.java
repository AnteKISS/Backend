package projetS3.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectWriter;

import java.util.ArrayList;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;
import projetS3.DataAccess.Save.SaveManager;
import projetS3.DataAccess.Save.SaveRequestBody;

@Path("/Save")
public class SaveService
{
    SaveManager saveManager = new SaveManager();
    ObjectMapper mapper = new ObjectMapper();

    @GET
    @Path("/{username}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getSavesForUser(@PathParam("username") String username)
    {
        ObjectWriter objectWriter = mapper.writer().withDefaultPrettyPrinter();

        Object object = saveManager.getSaves(username);
        try {
            return objectWriter.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    @POST
    @Path("/{username}")
    public void updateSave(@PathParam("username") String username, SaveRequestBody requestBody)
    {
        saveManager.updateSave(username, requestBody);
    }
}
