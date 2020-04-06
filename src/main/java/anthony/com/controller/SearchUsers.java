package anthony.com.controller;

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
    urlPatterns= {"/SearchUser"}
)
public class SearchUsers extends HttpServlet {
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
        if(request.getParameter("submit").equals("submit")) {
            request.setAttribute("companies", companyDao.getByPropertyEqual("companyName", request.getParameter("searchTerm")));
        } else {
            request.setAttribute("companies", companyDao.getAll());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/results.jsp");

        dispatcher.forward(request, response);

    }
}
