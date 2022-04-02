package anthony.com.controller.invoice;

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
import java.util.Arrays;
import java.util.Date;

/**
 * Add or edit the user
 *
 * @author apoleski
 */
@WebServlet(
        name="UpdateInvoice"
        , urlPatterns = {"/UpdateInvoice"}
)
//
public class UpdateInvoice extends HttpServlet {
    private static GenericDao userDao = new GenericDao(User.class);


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);

        response.setContentType("text/html");
        String customer = null;

        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);

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

        String invoiceId = request.getParameter("invoiceId");
        request.setAttribute("invoice", invoiceDao.getById(Integer.parseInt(invoiceId)));


//      Retrieve the company associated with the user
        Company company = user.getCompany();

//      Set the users company to an attribute
        request.setAttribute("company", company);

        String url = "/invoice/editInvoice.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
//
//
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        GenericDao<Customer> customerDao = new GenericDao(Customer.class);
        GenericDao<Product> productDao = new GenericDao(Product.class);
        GenericDao<Item> itemDao = new GenericDao(Item.class);

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
        String invoiceId;


//      Retrieves terms and selected customer id from form
        terms = req.getParameter("termList");
        customerId = req.getParameter("customerSelectBox");
        invoiceId = req.getParameter("invoiceId");

//      Retrieves all descriptions, quantities, and unitPrice for all products listed in the
//      invoice and adds them to there own lists
        descriptionsList = req.getParameterValues("description");
        quantityList = req.getParameterValues("quantity");
        unitPriceList = req.getParameterValues("unitPrice");
        descriptions = new ArrayList<>(Arrays.asList(descriptionsList));
        quantities = new ArrayList<>(Arrays.asList(quantityList));
        unitPrices = new ArrayList<>(Arrays.asList(unitPriceList));

//      Calculate total
        for(int i = 0; i < descriptions.size(); i++) {
//          Calculate total
            total += Integer.parseInt(quantities.get(i)) * Integer.parseInt(unitPrices.get(i));
//            total += quantities.get(i) * unitPrices.get(i);
        }

//      Get selected customer object
        customer = (Customer)customerDao.getById(Integer.parseInt(customerId));

//      Get current date and format
        dt = new java.util.Date();

//      Retrieve invoice to be updated
        Invoice invoice = invoiceDao.getById(Integer.parseInt(invoiceId));

        invoiceDao.saveOrUpdate(invoice);



//      Add invoice items and products into database
        for(int i = 0; i < descriptions.size(); i++) {
//          Create a product that goes into the database permanently
            Product product = new Product(descriptions.get(i), Double.parseDouble(unitPrices.get(i)), 20);
            productDao.insert(product);

//          Create an item that represents an item in the invoice
            int quantity = Integer.parseInt(quantities.get(i));
//            int quantity = quantities.get(i);
            double cost = Double.valueOf(unitPrices.get(i)) * quantity;
            Item item = new Item(i, product, quantity, cost, invoice);
            itemDao.insert(item);
            product.addItem(item);
            invoice.addItem(item);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("ViewInvoice?invoiceId=" + invoice.getId());
        dispatcher.forward(req, resp);
    }


}