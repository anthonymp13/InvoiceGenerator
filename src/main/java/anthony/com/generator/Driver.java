//package anthony.com.generator;
//
//import anthony.com.entity.Invoice;
//import anthony.com.persistence.GenericDao;
//
//import java.util.ArrayList;
//import java.util.List;
//
//public class Driver {
//    public static void main(String[] args) {
//        PdfInvoicesBasic pdfInvoiceBasic = new PdfInvoicesBasic();
//
//        GenericDao<Invoice> invoiceDao = new GenericDao<>(Invoice.class);
//        List<Invoice> invoice = new ArrayList<Invoice>();
//        invoice.add(invoiceDao.getById(3));
//        pdfInvoiceBasic.generateInvoice(invoice);
//
//    }
//}
