package controller;

import entity.Company;
import entity.User;
import persistence.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name = "CreateUser",
        urlPatterns = {"/CreateUser"}
)

/**
 * This servlet handles
 */
public class CreateUser extends HttpServlet {
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

        String url = "/index.jsp";

//        Set company dao
        GenericDao companyDao = new GenericDao(Company.class);

//        Get entered company, pull from database, and set to company object to be entered with a user
        String companyName = request.getParameter("company");
        Company companyObject = (Company)companyDao.getByPropertyLike("companyName", companyName);

//        Get enter values for a user
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");

//        Create user object
        User user = new User(firstName, lastName, userName, companyObject, password);

//        Insert user into database
        GenericDao userDao = new GenericDao(User.class);
        userDao.insert(user);

//        TODO: Give user a role
//        GenericDao roleDao = new GenericDao(Role.class);
//        roleDao.

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);

        dispatcher.forward(request, response);

    }
}

