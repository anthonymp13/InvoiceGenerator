package controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name="InsertInvoice"
        , urlPatterns={"/InsertInvoice"}
)
public class InsertInvoice extends HttpServlet {
    /**
     *  The doGet() method handles GET Requests from the generate invoice page
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

//        TODO: Finish inserting data from invoice into database
    }

}
