package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name = "AddItem",
        urlPatterns = {"/AddItem"}
)
public class AddItem extends HttpServlet {

    /**
     *  Handles HTTP GET requests.
     *
     *@param  request                   the HttpServletRequest object
     *@param  response                   the HttpServletResponse object
     *@exception ServletException  if there is a Servlet failure
     *@exception IOException       if there is an IO failure
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/generateInvoice/addItems.jsp";


        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String unitPrice = request.getParameter("unitPrice");
//        int amount =  Integer.parseInt(quantity) * Integer.parseInt(quantity);


        RequestDispatcher dispatcher = request.getRequestDispatcher(url);

        dispatcher.forward(request, response);
    }
}
