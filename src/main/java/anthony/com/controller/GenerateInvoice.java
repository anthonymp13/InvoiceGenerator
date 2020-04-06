package anthony.com.controller;

import anthony.com.entity.Company;
import anthony.com.entity.Customer;
import anthony.com.persistence.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name="GenerateInvoice"
        , urlPatterns={"/GenerateInvoice"}
)
/**
 * This servlet pulls data from the form that generates invoices
 */
public class GenerateInvoice extends HttpServlet {
    /**
     *  The doGet() method handles GET Requests
     *
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

//        TODO: Set companyId to a session variable
//        TODO: Add states into database as abbreviations ex. Wisconsin : WI

        GenericDao companyDao = new GenericDao(Company.class);
        GenericDao customerDao = new GenericDao(Customer.class);




        request.setAttribute("company", companyDao.getById(1));
        request.setAttribute("customers", customerDao.getAll());


        String url = "generateInvoice/generateInvoice.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
