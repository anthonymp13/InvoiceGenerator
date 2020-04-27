package anthony.com.controller.privileges;

import anthony.com.entity.User;
import anthony.com.entity.Invoice;
import anthony.com.entity.Customer;
import anthony.com.persistence.GenericDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Dashboard extends HttpServlet {

    /**
     * Set up employee, customer, and invoice data for jsp
     * @param req
     * @param res
     */
    public void doGet(HttpServletRequest req, HttpServletResponse res) {
        GenericDao employeeDao = new GenericDao(User.class);
        GenericDao invoiceDao = new GenericDao(Invoice.class);
        GenericDao customerDao = new GenericDao(Customer.class);


    }

}
