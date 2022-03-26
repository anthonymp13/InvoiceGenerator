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
        name = "ViewInvoice",
        urlPatterns = {"/ViewInvoice"}
)

/**
 *  Sets data that allows user to view invoices
 */
public class ViewInvoice extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());

    /**
     *  doPost sets the company and invoice variables that allow the jsp to display there information for the user
     *  to see. It also logs the user and invoiceId
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userName = req.getRemoteUser();

        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        GenericDao<User> userDao = new GenericDao(User.class);

//      Sends invoiceid to jsp
        String invoiceId = req.getParameter("invoiceId");
        req.setAttribute("invoice", invoiceDao.getById(Integer.parseInt(invoiceId)));

//      Logs user name and invoice id
        logger.info("Invoice " + invoiceId + " is being viewed by: " + userName);

//      Set users/invoice company to a attribute
        req.setAttribute("company", userDao.getByPropertyEqual("userName", userName).get(0).getCompany());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/invoice/viewInvoice.jsp");
        dispatcher.forward(req, resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        doPost(req, resp);

    }
}

