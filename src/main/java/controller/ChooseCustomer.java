package controller;

import entity.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import persistence.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Set;

@WebServlet(
        name = "ChooseCustomer",
        urlPatterns = {"/ChooseCustomer"}
)

/**
 * This servlet handles
 */
public class ChooseCustomer extends HttpServlet {

    private final Logger logger = LogManager.getLogger(this.getClass());

    public void init(ServletConfig config) throws ServletException {
        String url = "/generateInvoice/chooseCustomer.jsp";

        //      Set company dao
        GenericDao userDao = new GenericDao(User.class);

        //        String userName = (String) request.getRemoteUser();

        String userName = "anthonyp";

        List<User> users = userDao.getByPropertyEqual("userName", userName);
        Company company = users.get(0).getCompany();

        Set<Customer> customers = company.getCustomers();

        getServletContext().setAttribute("company", company);

    }

    /**
     *  Handles HTTP GET requests.
     *
     *@param  request                   the HttpServletRequest object
     *@param  response                   the HttpServletResponse object
     *@exception  ServletException public void doGet(HttpServletRequest request, HttpServletResponse response)
     *             throws ServletException, IOException { if there is a Servlet failure
     *@exception  IOException       if there is an IO failure
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String url = "/generateInvoice/chooseCustomer.jsp";
//
//        //      Set company dao
//        GenericDao userDao = new GenericDao(User.class);
//
//        //        String userName = (String) request.getRemoteUser();
//
//        String userName = "anthonyp";
//
//        List<User> users = userDao.getByPropertyEqual("userName", userName);
//        Company company = users.get(0).getCompany();
//
//        Set<Customer> customers = company.getCustomers();
//
//        request.setAttribute("company", company);

//        GenericDao invoiceDao = new GenericDao(Invoice.class);

// sudo
//        GenericDao customerDao = new GenericDao(Customer.class);
//
//        Customer customer = (Customer)customerDao.getById(1);


        //        Date date = new Date(2020, 2, 27);
//        Invoice newInvoice = new Invoice(date, 1500.00, "Upon completion", user, customer);
//
//        GenericDao productDao = new GenericDao(Product.class);
//        Product product = (Product) productDao.getById(1);
//
//
//        Item item = new Item(1, product, 5, newInvoice);
//        newInvoice.addItem(item);


        RequestDispatcher dispatcher = request.getRequestDispatcher(url);

        dispatcher.forward(request, response);

    }
}

