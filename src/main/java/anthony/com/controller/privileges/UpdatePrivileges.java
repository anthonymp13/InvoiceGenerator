package anthony.com.controller.privileges;

import anthony.com.entity.Company;
import anthony.com.entity.Role;
import anthony.com.entity.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import anthony.com.persistence.*;
import org.hibernate.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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
        urlPatterns= {"/UpdatePrivileges"}
)
public class UpdatePrivileges extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());


    public void init(ServletConfig config) {

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

        GenericDao roleDao = new GenericDao(Role.class);

        HttpSession session = request.getSession();
        String userName = request.getParameter("userName");

        String newRole = request.getParameter("updateRole");


        List<Role> roleToUpdate = roleDao.getByPropertyEqual("userName", userName);
        roleToUpdate.get(0).setRoleName(newRole);
        roleDao.saveOrUpdate(roleToUpdate.get(0));

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/employeePrivileges.jsp");

        dispatcher.forward(request, response);

    }
}