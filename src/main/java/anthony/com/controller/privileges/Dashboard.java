package anthony.com.controller.privileges;

import anthony.com.entity.*;
import anthony.com.persistence.GenericDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;


/**
 * Displays all data necessary for users to manage customers, invoices, and users if they are an admin
 *
 */

@WebServlet(
        name = "Dashboard",
        urlPatterns = {"/Dashboard"}
)

public class Dashboard extends HttpServlet {

    /**
     * Set up employee, customer, and invoice data for jsp
     * @param request
     * @param response
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Invoice> invoices = new ArrayList<>();

        GenericDao userDao = new GenericDao(User.class);

//      Retrieve logged in users username
        String userName = request.getRemoteUser();
        User user = (User) userDao.getByPropertyEqual("userName", userName).get(0);

//      Get info based on username
        Company userCompany = user.getCompany();
        Set<User> companyUsers = userCompany.getUsers();
        Set<Customer> companyCustomers = userCompany.getCustomers();

//      Set customers invoices to a ArrayList
        Iterator customers = companyCustomers.iterator();
        while(customers.hasNext()) {
            Customer customer = (Customer)customers.next();
            invoices.addAll(customer.getInvoices());
        }

//      Set request attributes
        request.setAttribute("invoices", invoices);
        request.setAttribute("customers", companyCustomers);
        request.setAttribute("users", companyUsers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/dashboard.jsp");

        dispatcher.forward(request, response);
    }

}
