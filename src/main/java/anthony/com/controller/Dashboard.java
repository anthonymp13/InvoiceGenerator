package anthony.com.controller;

import anthony.com.entity.Company;
import anthony.com.entity.Customer;
import anthony.com.entity.Invoice;
import anthony.com.entity.User;
import anthony.com.persistence.GenericDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int amount = 0;
        int min = 0;
        int max = 5;
        ArrayList<Invoice> invoices = new ArrayList<>();
        GenericDao userDao = new GenericDao(User.class);
        GenericDao customerDao = new GenericDao(Customer.class);
        GenericDao invoiceDao = new GenericDao(Invoice.class);



//      Retrieve logged in users username
        String userName = request.getRemoteUser();
        User user = (User) userDao.getByPropertyEqual("userName", userName).get(0);

//      Set logged in user to session attributes
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

//      Get info based on username

        Company company = user.getCompany();
        List<User> users = userDao.getLimitedResults("company", company, min, max);

        List<Customer> customers = customerDao.getLimitedResults("company", company, min, max);

        Iterator currentCustomer = customers.iterator();


            while(currentCustomer.hasNext() && invoices.size() < max) {
                Customer customer = (Customer)currentCustomer.next();
                invoices.addAll(customer.getInvoices());
            }




//      Set request attributes
        request.setAttribute("invoices", invoices);
        request.setAttribute("customers", customers);
        request.setAttribute("users", users);


        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/dashboard.jsp");

        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
    
}
