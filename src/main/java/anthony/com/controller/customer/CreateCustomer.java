package anthony.com.controller.customer;

import anthony.com.entity.Company;
import anthony.com.entity.Customer;
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

@WebServlet(
        name = "CreateCustomer",
        urlPatterns = {"/CreateCustomer"}
)

public class CreateCustomer extends HttpServlet {
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
        response.setContentType("text/html");

        String url = "/newCustomer.jsp";
        GenericDao<User> userDao = new GenericDao(User.class);

//      Get users company
        String userName = request.getRemoteUser();
        User user = (User) userDao.getByPropertyEqual("userName", userName).get(0);
        Company company = user.getCompany();

//      Get all entered data from form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        int zipcode = Integer.parseInt(request.getParameter("zipcode"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String countryId = "BE";

//      Create and insert new customer
        GenericDao<Customer> customerDao = new GenericDao(Customer.class);
        Customer newCustomer = new Customer(firstName, lastName, address, city, state, zipcode, phoneNumber, company, countryId, email);
        customerDao.insert(newCustomer);

        Boolean insertStatus = null;
        if(customerDao.getById(newCustomer.getId()) != null) {
            insertStatus = true;

        } else {
            insertStatus = false;
        }

        request.setAttribute("customer", newCustomer);
        request.setAttribute("insertStatus", insertStatus);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);

        dispatcher.forward(request, response);

    }
}

