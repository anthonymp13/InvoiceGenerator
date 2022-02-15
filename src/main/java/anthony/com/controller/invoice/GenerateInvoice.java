package anthony.com.controller.invoice;

import anthony.com.entity.*;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

@WebServlet(
        name="GenerateInvoice"
        , urlPatterns={"/GenerateInvoice"}
)
/**
 * This servlet pulls data from the form that generates invoices
 */
public class GenerateInvoice extends HttpServlet {
    private Logger logger = LogManager.getLogger(this.getClass());
    private static GenericDao userDao = new GenericDao(User.class);
    private static GenericDao companyDao = new GenericDao(Company.class);
    private static GenericDao customerDao = new GenericDao(Customer.class);
    private static GenericDao productDao = new GenericDao(Product.class);

    /**
     *  The doGet() method handles GET Requests
     *
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String customer = null;

//      Tests if customerId is available
        if(request.getParameter("customerId")!=null) {
//          Sets an attribute for the customer associated with the customerId
            GenericDao customerDao = new GenericDao(Customer.class);
            request.setAttribute("customer", customerDao.getById(Integer.parseInt(request.getParameter("customerId"))));
        }

//      Request remote user
        String userName = request.getRemoteUser();

//      Retrieve the user associated with the logged in user
        User user = (User) userDao.getByPropertyEqual("userName", userName).get(0);

//      Retrieve the company associated with the user
        Company company = user.getCompany();

//      Set the users company to an attribute
        request.setAttribute("company", company);

        String url = "/generateInvoice/generateInvoice.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    /**
     *  The doPost() method handles POST Requests
     *  Inserts invoices into database and sends user back to dashboard
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        int total = 0;
        String[] descriptionsList;
        String[] quantityList;
        String[] unitPriceList;
        ArrayList<String> descriptions;
        ArrayList<String> quantities;
        ArrayList<String> unitPrices;
        String customerId;
        String terms;
        Customer customer;
        Date dt;

//      Retrieves terms and selected customer id from form
        terms = request.getParameter("termList");
        customerId = request.getParameter("customerSelectBox");
        logger.info("CustomerId is " + customerId);

//      Inspired by: https://stackoverflow.com/questions/46203250/how-to-get-all-the-html-input-values-in-the-same-name-to-the-servlet-by-arraylis
//      Retrieves all descriptions, quantities, and unitPrice for all products listed in the invoice and adds them to there own lists
        descriptionsList = request.getParameterValues("description");
        quantityList = request.getParameterValues("quantity");
        unitPriceList = request.getParameterValues("unitPrice");
        descriptions = new ArrayList<>(Arrays.asList(descriptionsList));
        quantities = new ArrayList<>(Arrays.asList(quantityList));
        unitPrices = new ArrayList<>(Arrays.asList(unitPriceList));

//      Calculate total
        for(int i = 0; i < descriptions.size(); i++) {
//          Calculate total
            total += Double.parseDouble(quantities.get(i)) * Double.parseDouble(unitPrices.get(i));
        }

//      Get selected customer object
        customer = (Customer)customerDao.getById(Integer.parseInt(customerId));

//      Get current date and format
        dt = new java.util.Date();


//      Create new invoice object
        Invoice newInvoice = new Invoice(total, terms, dt, customer);

        GenericDao invoiceDao = new GenericDao(Invoice.class);
        GenericDao productDao = new GenericDao(Product.class);
        invoiceDao.insert(newInvoice);

        GenericDao itemDao = new GenericDao(Item.class);

//      Add invoice items and products into database
        for(int i = 0; i < descriptions.size(); i++) {
//          Create a product that goes into the database permanently
            Product product = new Product(descriptions.get(i), Double.parseDouble(unitPrices.get(i)), 20);
            productDao.insert(product);

//          Create an item that represents an item in the invoice
            int quantity = Integer.parseInt(quantities.get(i));
            double cost = Double.valueOf(unitPrices.get(i)) * quantity;
            Item item = new Item(i, product, quantity, cost, newInvoice);
            itemDao.insert(item);
            product.addItem(item);
            newInvoice.addItem(item);
        }

        String url = "/Dashboard";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }


}
