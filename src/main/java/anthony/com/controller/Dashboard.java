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
        ArrayList<Invoice> invoices = new ArrayList<>();

        GenericDao userDao = new GenericDao(User.class);

//      Retrieve logged in users username
        String userName = request.getRemoteUser();
        User user = (User) userDao.getByPropertyEqual("userName", userName).get(0);

//      Set logged in user to session attributes
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

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

//      Download invoice

//            int invoiceId = 1;
//            if(request.getParameter("invoiceId") != "") {
////                String[] invoiceToDownload = new String[invoiceId];
////                driver.main(invoiceToDownload);
//                try {
//                    PdfInvoicesBasic generate = new PdfInvoicesBasic();
//                    List<Invoice> list = new ArrayList<Invoice>();
//                    Invoice invoice = (Invoice) invoiceDao.getById(invoiceId);
//                    list.add(invoice);
//                    generate.generateInvoice(list);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//
//            }

//        int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/dashboard.jsp");

        dispatcher.forward(request, response);
    }

}
