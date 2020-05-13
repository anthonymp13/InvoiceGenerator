package anthony.com.controller.invoice;

import anthony.com.entity.Invoice;
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

        GenericDao<Invoice> invoiceDao = new GenericDao(Invoice.class);
        invoiceDao.delete(invoiceDao.getById(Integer.valueOf(req.getParameter("invoiceId"))));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/Dashboard");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

