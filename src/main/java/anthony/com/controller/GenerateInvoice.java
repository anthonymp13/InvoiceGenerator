package anthony.com.controller;

import anthony.com.entity.*;
import anthony.com.persistence.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
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


    private static GenericDao companyDao = new GenericDao(Company.class);
    private static GenericDao customerDao = new GenericDao(Customer.class);
    private static GenericDao productDao = new GenericDao(Product.class);
    /**
     *  The doGet() method handles GET Requests
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
//        TODO: get user id
        request.setAttribute("company", companyDao.getById(1));


        String url = "/generateInvoice/generateInvoice.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    /**
     *  The doPost() method handles POST Requests
     *
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int total = 0;
        String[] descriptionsList = null;
        String[] quantityList = null;
        String[] unitPriceList = null;
        ArrayList<String> descriptions = null;
        ArrayList<String> quantities = null;
        ArrayList<String> unitPrices = null;
        String customerId = null;
        String terms = null;
        Customer customer = null;
        Date dt = null;
        SimpleDateFormat sdf = null;
        String currentTime = null;

//      Retrieves terms and selected customer id from form
        terms = request.getParameter("termList");
        customerId = request.getParameter("customerSelectBox");

//      Inspired by: https://stackoverflow.com/questions/46203250/how-to-get-all-the-html-input-values-in-the-same-name-to-the-servlet-by-arraylis
//      Retrieves all descriptions, quantities, and unitPrice for all products listed in the invoice and adds them to there own lists
        descriptionsList = request.getParameterValues("description");
        quantityList = request.getParameterValues("quantity");
        unitPriceList = request.getParameterValues("unitPrice");
        descriptions = new ArrayList<String>(Arrays.asList(descriptionsList));
        quantities = new ArrayList<String>(Arrays.asList(quantityList));
        unitPrices = new ArrayList<String>(Arrays.asList(unitPriceList));

//      Calculate total
        for(int i = 0; i < descriptions.size(); i++) {
//          Calculate total
            total += Integer.parseInt(quantities.get(i)) * Integer.parseInt(unitPrices.get(i));
        }

//      Get selected customer object
        customer = (Customer)customerDao.getById(Integer.parseInt(customerId));

//      Get current date and format
        dt = new java.util.Date();
        sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        currentTime = sdf.format(dt);

//      Create current date object
        Date date = new Date(currentTime);

//      TODO: Change user
        GenericDao<User> userDao = new GenericDao(User.class);
        User user = userDao.getById(1);

//      Create new invoice object
        Invoice newInvoice = new Invoice(date, total, terms, user, customer);

//      Add invoice items and products into database
        for(int i = 0; i < descriptions.size(); i++) {
//          Create a product that goes into the database permanently
            Product product = new Product(descriptions.get(i), Double.parseDouble(unitPrices.get(i)), 20);
            productDao.insert(product);

//          Create an item that represents an item in the invoice
            int quantity = Integer.parseInt(quantities.get(i));
            double cost = Double.valueOf(unitPrices.get(i)) * quantity;
            Item item = new Item(i, product, quantity, cost, newInvoice);

            product.addItem(item);
            newInvoice.addItem(item);
        }

        String url = "/InvoiceGenerator/generateInvoice/generateInvoice.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }


}
