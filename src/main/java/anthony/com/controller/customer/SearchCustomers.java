package anthony.com.controller.customer;

import anthony.com.entity.Company;
import anthony.com.persistence.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (
    urlPatterns= {"/SearchCustomers"}
)
public class SearchCustomers extends HttpServlet {
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

        GenericDao companyDao = new GenericDao(Company.class);

        // TODO: get companyId from user session
//        request.setAttribute("company", companyDao.getByPropertyEqual("companyId", "1"));

//        if(request.getParameter("submit").equals("search")) {
//            request.setAttribute("companies", companyDao.getByPropertyEqual("companyName", request.getParameter("searchTerm")));
//        } else {
//            request.setAttribute("companies", companyDao.getAll());
//        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/customerSearch.jsp");

        dispatcher.forward(request, response);

    }
}
