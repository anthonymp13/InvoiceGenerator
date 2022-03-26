package anthony.com.controller.company;

import anthony.com.entity.Company;
import anthony.com.entity.Role;
import anthony.com.entity.User;
import anthony.com.persistence.GenericDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(
        name = "CreateCompany",
        urlPatterns = {"/CreateCompany"}
)

/**
 * This servlet handles
 */
public class NewCompany extends HttpServlet {
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

        String url = "";
        Boolean success = null;

//      Set company dao
        GenericDao companyDao = new GenericDao(Company.class);

        GenericDao userDao = new GenericDao(User.class);

        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String companyName = request.getParameter("companyName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        int zipcode = Integer.parseInt(request.getParameter("zipcode"));
        String phoneNumber = request.getParameter("phoneNumber");

        List<Company> companies = companyDao.getByPropertyEqual("companyName", companyName);
        List<User> users = userDao.getByPropertyEqual("userName", userName);
        Company company = null;

//      Create company
        if(companies.isEmpty()) {
            company = new Company(companyName, address, city, state, zipcode, phoneNumber);
            companyDao.insert(company);
        }

        if(users.isEmpty()) {
            url = "index.jsp";

            // Create user
            User newUser = new User(firstName, lastName, userName, company, password);

            //Insert user
            userDao.insert(newUser);

//          Get inserted user id
            List<User> userList = userDao.getByPropertyEqual("userName", userName);
            User insertedUser = userList.get(0);
            int userId =  insertedUser.getUserId();

//          Create user role
            Role usersRole = new Role(newUser, "admin", userName);

//          Insert user role
            GenericDao roleDao = new GenericDao(Role.class);
            roleDao.insert(usersRole);

            success = true;

        } else {
            success = false;
            url = "createCompany.jsp";
        }

        request.setAttribute("success", success);

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);

        dispatcher.forward(request, response);

    }
}

