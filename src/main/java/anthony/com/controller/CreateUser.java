package anthony.com.controller;

import anthony.com.entity.Company;
import anthony.com.entity.Role;
import anthony.com.entity.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import anthony.com.persistence.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(
        name = "CreateUser",
        urlPatterns = {"/CreateUser"}
)

/**
 * This servlet handles
 */
public class CreateUser extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());

    /**
     *  Handles HTTP GET requests.
     *
     *@param  request                   the HttpServletRequest object
     *@param  response                   the HttpServletResponse object
     *@exception  ServletException  if there is a Servlet failure
     *@exception  IOException       if there is an IO failure
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String url = "/login.jsp";

//      Set company dao
        GenericDao companyDao = new GenericDao(Company.class);
//        TODO: Add "security" features
        GenericDao userDao = new GenericDao(User.class);

        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String companyName = request.getParameter("company");

        userDao.getByPropertyEqual("userName", userName);

        List<Company> companyList = companyDao.getByPropertyLike("companyName", companyName);


        Company companyObject = companyList.get(0);

//      Create user object
        User newUser = new User(firstName, lastName, userName, companyObject, password);

//      Insert user into database

        userDao.insert(newUser);

        List<User> userList = userDao.getByPropertyEqual("userName", userName);
        User user = userList.get(0);
        int userId =  user.getUserId();

//      TODO: Create page where admin gives out privileges
        Role usersRole = new Role(user, "basic", userName);

        GenericDao roleDao = new GenericDao(Role.class);
        roleDao.insert(usersRole);

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);

        dispatcher.forward(request, response);

    }
}

