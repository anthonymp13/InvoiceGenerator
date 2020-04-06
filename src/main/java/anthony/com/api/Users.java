package anthony.com.api;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;

import anthony.com.entity.User;
import anthony.com.persistence.*;

import java.util.List;

@Path("/users")
public class Users {

    @POST
    @Path("get")
    @Produces("text/html")
    public Response getUsers(@FormParam("userName") String userName) {
        GenericDao userDao = new GenericDao(User.class);
        List<User> list = userDao.getAll();;
        String output;
        String msg = "";

//        if (userName != null) {
//            list = userDao.getByPropertyEqual("userName", userName);
//        } else {
//            list = userDao.getAll();
//        }



        for (User user: list) {
             msg +=
                "Id: " + user.getUserId()
                        + " User Name: " + user.getUserName()
                        + " First Name: " + user.getFirstName()
                        + " Last Name: " +user.getLastName()
                        + " Company: " + user.getCompany().getCompanyName()
                        + "<br/>";
        }

        return Response.status(200).entity(msg).build();

    }


}
