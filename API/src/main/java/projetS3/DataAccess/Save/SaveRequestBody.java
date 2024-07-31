package projetS3.DataAccess.Save;

public class SaveRequestBody
{
    public String username;
    public SaveDTO save;

    SaveRequestBody()
    {
        username = "";
        save = new SaveDTO();
    }

    SaveRequestBody(String username, SaveDTO save)
    {
        this.username = username;
        this.save = save;
    }
}
