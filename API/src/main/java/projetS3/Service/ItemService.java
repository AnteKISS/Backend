package projetS3.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectWriter;
import jakarta.ws.rs.core.Response;
import projetS3.DataAccess.Items.ItemDTO;
import projetS3.DataAccess.Items.ItemManager;

import java.util.ArrayList;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;

@Path("/Item")
public class ItemService
{
    ItemManager itemManager = new ItemManager();
    ObjectMapper mapper = new ObjectMapper();

    @GET
    @Path("GetAll")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllItems()
    {
        ObjectWriter objectWriter = mapper.writer().withDefaultPrettyPrinter();

        Object object = itemManager.getAllItems();
        try {
            return objectWriter.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }
}
