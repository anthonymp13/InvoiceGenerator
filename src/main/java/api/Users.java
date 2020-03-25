package api;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import entity.User;
import org.hibernate.annotations.Type;
import persistence.*;

import java.util.ArrayList;
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
