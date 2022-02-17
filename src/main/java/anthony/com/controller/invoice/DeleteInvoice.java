package anthony.com.controller.invoice;

import anthony.com.entity.Invoice;
import anthony.com.entity.User;
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

@WebServlet(
        name = "DeleteInvoice",
        urlPatterns = {"/DeleteInvoice"}
)

/**
 * Delete an invoice
 */
public class DeleteInvoice extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//      Get invoiceId from ajax post request



        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        invoiceDao.delete(invoiceDao.getById(Integer.valueOf(req.getParameter("invoiceId"))));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/Dashboard");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String userName = req.getRemoteUser();

        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        GenericDao<User> userDao = new GenericDao(User.class);

//      Sends invoiceid to jsp
        String invoiceId = req.getParameter("invoiceId");
        req.setAttribute("invoice", invoiceDao.getById(Integer.parseInt(invoiceId)));

//      Logs user name and invoice id
        logger.info("Invoice " + invoiceId + " is being viewed by: " + userName);

//      Set users/invoice company to a attribute
//        req.setAttribute("company", userDao.getByPropertyEqual("userName", userName).get(0).getCompany());
        RequestDispatcher dispatcher = req.getRequestDispatcher("invoice/deleteInvoice.jsp");
        dispatcher.forward(req, resp);
    }
}

