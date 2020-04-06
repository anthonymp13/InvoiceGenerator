package anthony.com.generator;

import com.itextpdf.zugferd.exceptions.InvalidCodeException;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

public class Driver {
    public static void main(String[] args) throws SAXException, ParseException, TransformerException, IOException, SQLException, ParserConfigurationException, com.itextpdf.zugferd.exceptions.DataIncompleteException, InvalidCodeException {
        PdfInvoicesBasic pdfInvoiceBasic = new PdfInvoicesBasic();
        pdfInvoiceBasic.generateInvoice();
    }
}
