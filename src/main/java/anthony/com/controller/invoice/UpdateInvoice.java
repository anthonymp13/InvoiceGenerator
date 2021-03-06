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
 * @author pwaite
 */
@WebServlet(
        urlPatterns = {"/updateInvoice"}
)

public class UpdateInvoice extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        GenericDao<Customer> customerDao = new GenericDao(Customer.class);

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
        terms = req.getParameter("termList");
        customerId = req.getParameter("customerSelectBox");


//      Retrieves all descriptions, quantities, and unitPrice for all products listed in the invoice and adds them to there own lists
//      Inspired by: https://stackoverflow.com/questions/46203250/how-to-get-all-the-html-input-values-in-the-same-name-to-the-servlet-by-arraylis
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
        }

//      Get selected customer object
        customer = (Customer)customerDao.getById(Integer.parseInt(customerId));

//      Get current date and format
        dt = new java.util.Date();

//      Create new invoice object
        Invoice newInvoice = new Invoice(total, terms, dt, customer);

        GenericDao productDao = new GenericDao(Product.class);
        invoiceDao.saveOrUpdate(newInvoice);

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


        RequestDispatcher dispatcher = req.getRequestDispatcher("ViewInvoice?invoiceId=" + newInvoice.getId());
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        GenericDao userDao = new GenericDao(User.class);
        req.setAttribute("invoice", invoiceDao.getById(Integer.valueOf(req.getParameter("invoiceId"))));

        String userName = req.getRemoteUser();
        User user = (User) userDao.getByPropertyEqual("userName", userName).get(0);
        Company company = user.getCompany();
        req.setAttribute("company", company);

        RequestDispatcher dispatcher = req.getRequestDispatcher("generateInvoice/generateInvoice.jsp");
        dispatcher.forward(req, resp);
    }
}