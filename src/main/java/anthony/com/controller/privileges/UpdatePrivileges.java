package anthony.com.controller.privileges;

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

@WebServlet (
        urlPatterns= {"/UpdatePrivileges"}
)
/**
 *  The UpdatePrivileges servlet interacts with the updatePrivileges jsp and
 *  database to update selected employee privileges.
 */
public class UpdatePrivileges extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());
    private GenericDao userDao = new GenericDao(User.class);
    private int id;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        GenericDao roleDao = new GenericDao(Role.class);


//      Get user
        int id = Integer.parseInt(request.getParameter("userId"));
        User user = (User)userDao.getById(id);

//      Set employee that needs to be updated
        User employee = (User)userDao.getById(id);
        request.setAttribute("employee", employee);
        String roleName = request.getParameter("updateRole");

//      Update users role
        Role role = (Role)roleDao.getByPropertyEqual("userName", user.getUserName()).get(0);
        role.setRoleName(roleName);

//      Get other data from form
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");

//      Update user
        user.setUserName(userName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        role.setUser(user);

        userDao.saveOrUpdate(user);
        roleDao.saveOrUpdate(role);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Dashboard");

        dispatcher.forward(request, response);

}

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

//      Set employee that needs to be updated
        id = Integer.parseInt(request.getParameter("userId"));
        User user = (User)userDao.getById(id);
        request.setAttribute("employee", user);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/viewEmployee.jsp");

        dispatcher.forward(request, response);

    }
}