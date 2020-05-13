package anthony.com.controller.user;

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
        urlPatterns= {"/ViewEmployee"}
)
/**
 *  The UpdatePrivileges servlet interacts with the updatePrivileges jsp and
 *  database to update selected employee privileges.
 */
public class ViewEmployee extends HttpServlet {
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

//      Get user
        int id = Integer.parseInt(request.getParameter("userId"));
        User user = (User)userDao.getById(id);

//      Set employee that needs to be updated
        User employee = (User)userDao.getById(id);
        request.setAttribute("employee", employee);



        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/viewEmployee.jsp");

        dispatcher.forward(request, response);

    }
}