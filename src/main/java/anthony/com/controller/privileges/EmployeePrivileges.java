package anthony.com.controller.privileges;

import anthony.com.entity.Company;
import anthony.com.entity.Role;
import anthony.com.entity.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import anthony.com.persistence.*;
import org.hibernate.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet (
    urlPatterns= {"/GrantPrivileges"}
)
public class EmployeePrivileges extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());

    /**
     *  Handles HTTP GET requests.
     *
     *@param  request                   the HttpServletRequest object
     *@param  response                   the HttpServletResponse object
     *@exception  ServletException  if there is a Servlet failure
     *@exception  IOException       if there is an IO failure
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        GenericDao userDao = new GenericDao(User.class);
        GenericDao roleDao = new GenericDao(Role.class);

        // TODO: Get userId from session variables
        User user = (User) userDao.getById(1);
        Company company = user.getCompany();
        Set<User> employees = company.getUsers();

        List<Role> roles = roleDao.getAll();

        HttpSession session = request.getSession();

        request.setAttribute("roles", roles);
        request.setAttribute("employees", employees);

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/employeePrivileges.jsp");

        dispatcher.forward(request, response);

    }

}