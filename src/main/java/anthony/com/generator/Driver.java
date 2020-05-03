package anthony.com.generator;

import anthony.com.entity.Invoice;
import anthony.com.persistence.GenericDao;
import com.itextpdf.zugferd.exceptions.DataIncompleteException;
import com.itextpdf.zugferd.exceptions.InvalidCodeException;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class Driver {
    public static void main(String[] args) {
        PdfInvoicesBasic pdfInvoiceBasic = new PdfInvoicesBasic();
        GenericDao<Invoice> invoiceDao = new GenericDao<>(Invoice.class);
        List<Invoice> invoice = new ArrayList<Invoice>();
        invoice.add(invoiceDao.getById(Integer.parseInt(String.valueOf(args))));
        pdfInvoiceBasic.generateInvoice(invoice);

    }
}
