package anthony.com.controller.customer;

import anthony.com.entity.Customer;
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

@WebServlet(
        name = "DeleteCustomer",
        urlPatterns = {"/DeleteCustomer"}
)

/**
 * Delete an invoice
 */
public class DeleteCustomer extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        GenericDao<Customer> customerDao = new GenericDao(Customer.class);
        customerDao.delete(customerDao.getById(Integer.valueOf(req.getParameter("customerId"))));

        RequestDispatcher dispatcher = req.getRequestDispatcher("Dashboard");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

