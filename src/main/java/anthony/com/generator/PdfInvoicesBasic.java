/*
 * This example was written by Bruno Lowagie in the context of a book.
 * See http://developers.itextpdf.com/content/zugferd-future-invoicing/5-creating-pdf-invoices-basic-profile
 */
package anthony.com.generator;

import anthony.com.entity.*;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Reads invoice data from a test database and creates ZUGFeRD invoices
 * (Basic profile).
 * @author Bruno Lowagie
 */
public class PdfInvoicesBasic {

    /** The pattern of the destination paths. */
    public static final String DEST = "./target/classes/results/zugferd/pdf/basic%05d.pdf";

    /** The path to the color profile. */
    public static final String ICC = "./target/classes/color/sRGB_CS_profile.icm";

    /** The path to a regular font. */
    public static final String REGULAR = "./target/classes/fonts/OpenSans-Regular.ttf";

    /** The path to a bold font. */
    public static final String BOLD = "./target/classes/fonts/OpenSans-Bold.ttf";

    /** A <code>String</code> with a newline character. */
    public static final String NEWLINE = "\n";


    private final Logger logger = LogManager.getLogger(this.getClass());
    /**
     * The main method.
     *
     * @throws IOException Signals that an I/O exception has occurred.
     * @throws ParserConfigurationException the parser configuration exception
     * @throws SQLException the SQL exception
     * @throws SAXException the SAX exception
     * @throws TransformerException the transformer exception
     * @throws ParseException the parse exception
     */
    public void generateInvoice(List<Invoice> invoices) {

        File file = new File(DEST);
        file.getParentFile().mkdirs();
        PdfInvoicesBasic app = new PdfInvoicesBasic();

        try {
            for (Invoice invoice : invoices) {
                app.createPdf(invoice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Creates a PDF file, given a certain invoice.
     *
     * @param invoice the invoice
     * @throws ParserConfigurationException the parser configuration exception
     * @throws SAXException the SAX exception
     * @throws TransformerException the transformer exception
     * @throws IOException Signals that an I/O exception has occurred.
     * @throws ParseException the parse exception
     */
    public void createPdf(Invoice invoice) throws IOException, ParseException {

        String dest = String.format(DEST, invoice.getId());

        // Create the XML
//        InvoiceData invoiceData = new InvoiceData();
//        IBasicProfile basic = invoiceData.createBasicProfileData(invoice);
//        InvoiceDOM dom = new InvoiceDOM(basic);

        // Create the ZUGFeRD document
//        ZugferdDocument pdfDocument = new ZugferdDocument(
//                new PdfWriter(dest), ZugferdConformanceLevel.ZUGFeRDBasic,
//                new PdfOutputIntent("Custom", "", "http://www.color.org",
//                        "sRGB IEC61966-2.1", new FileInputStream(ICC)));
//        pdfDocument.addFileAttachment("ZUGFeRD invoice", PdfFileSpec.createEmbeddedFileSpec(
//                pdfDocument, dom.toXML(), "ZUGFeRD invoice", "ZUGFeRD-invoice.xml",
//                PdfName.ApplicationXml, new PdfDictionary(), PdfName.Alternative));

        PdfDocument pdfDocument = new PdfDocument(new PdfWriter(dest));

        // Create the document
        Document document = new Document(pdfDocument);
        document.setFont(PdfFontFactory.createFont(REGULAR, true))
                .setFontSize(12);
        PdfFont bold = PdfFontFactory.createFont(BOLD, true);

        // Add the header
        document.add(
                new Paragraph()
                        .	setTextAlignment(TextAlignment.RIGHT)
                        .setMultipliedLeading(1)
                        .add(new Text(String.format("%s %s\n", "Invoice", invoice.getId()))
                                .setFont(bold).setFontSize(14))
                        .add("Issue Date " + convertDate(invoice.getInvoiceDate(), "MMM dd, yyyy")).add(NEWLINE)
//                        .add("Due Date " + convertDate(invoice.getInvoiceDate(), "MMM dd, yyyy") + "(" + invoice.getTerms() +")")
        );
        // Add the seller and buyer address
        document.add(getAddressTable(bold, invoice));
        // Add the line items
        document.add(getLineItemTable(invoice, bold));
//        // Add the grand totals
//        document.add(getTotalsTable(
//                basic.getTaxBasisTotalAmount(), basic.getTaxTotalAmount(), basic.getGrandTotalAmount(), basic.getGrandTotalAmountCurrencyID(),
//                basic.getTaxTypeCode(), basic.getTaxApplicablePercent(),
//                basic.getTaxBasisAmount(), basic.getTaxCalculatedAmount(), basic.getTaxCalculatedAmountCurrencyID(), bold));
        // Add the payment info
//        document.add(getPaymentInfo(basic.getPaymentReference(), basic.getPaymentMeansPayeeFinancialInstitutionBIC(), basic.getPaymentMeansPayeeAccountIBAN()));

//      Create totals table
        String total = calculateTotal(invoice);
        document.add(
                new Paragraph()
                        .setTextAlignment(TextAlignment.RIGHT)
                        .add(new Text("Subtotal "))
                        .add(new Text(total)).add(NEWLINE)
                        .add(new Text("Tax (10%) "))
                        .add(new Text(Double.toString(Integer.parseInt(total) * .1))).add(NEWLINE)
                        .add(new Text("Amount Due ").setFont(bold))
                        .add(new Text(Double.toString(Integer.parseInt(total) * 1.1)))
        );

        document.close();
    }

    /**
     * Get total cost of all items
     */
    public String calculateTotal(Invoice invoice) {
        int total = 0;


        for (Item item : invoice.getItems()) {
            total += item.getCost();
        }


        return Integer.toString(total);
    }

    /**
     * Convert a date to a String in a certain format.
     *
     * @param d the date
     * @param newFormat the new format
     * @return the date as a string
     * @throws ParseException the parse exception
     */
    public String convertDate(Date d, String newFormat) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(newFormat);
        return sdf.format(d);
    }

    /**
     * Gets the address table.
     *
     * @param bold a bold font
     * @return the address table
     */
    public Table getAddressTable(PdfFont bold, Invoice invoice) {
//      GenericDao customerDao = new GenericDao(Customer.class);
        Customer customer = invoice.getCustomer();
        Company company = customer.getCompany();

        Table table = new Table(new UnitValue[]{
                new UnitValue(UnitValue.PERCENT, 50),
                new UnitValue(UnitValue.PERCENT, 50)})
                .setWidth(UnitValue.createPercentValue(100));
        table.addCell(getPartyAddress("From:",
                company.getCompanyName(),
                company.getPhoneNumber(),
                company.getAddress(),
                company.getCity(),
                company.getState(),
                Integer.toString(company.getZip()),
                bold));

//      Set customer full name
        String fullName = customer.getFirstName() + " " + customer.getLastName();
        table.addCell(getPartyAddress("To:",
                fullName,
                customer.getPhoneNumber(),
                customer.getStreet(),
                customer.getCity(),
                customer.getState(),
                Integer.toString(customer.getPostalcode()),
                bold));
//        table.addCell(getPartyTax(basic.getSellerTaxRegistrationID(),
//                basic.getSellerTaxRegistrationSchemeID(), bold));
//        table.addCell(getPartyTax(basic.getBuyerTaxRegistrationID(),
//                basic.getBuyerTaxRegistrationSchemeID(), bold));
        return table;
    }

    /**
     * Gets the party address.
     *
     * @param who either "To:" or "From:"
     * @param name the addressee
     * @param city the city
     * @param bold a bold font
     * @return a formatted address cell
     */
    public Cell getPartyAddress(String who, String name, String phoneNumber, String street, String city, String state, String postalCode, PdfFont bold) {
        String line2 = city + ", " + state + " " + postalCode;
        Paragraph p = new Paragraph()
                .setMultipliedLeading(1.0f)
                .add(new Text(who).setFont(bold)).add(NEWLINE)
                .add(name).add(NEWLINE)
                .add(phoneNumber).add(NEWLINE)
                .add(street).add(NEWLINE)
                .add(line2).add(NEWLINE);
        Cell cell = new Cell()
                .setBorder(Border.NO_BORDER)
                .add(p);
        return cell;
    }

    /**
     * Gets the party tax.
     *
     * @param taxId the tax id
     * @param taxSchema the tax schema
     * @param bold a bold font
     * @return a formatted cell
     */
    public Cell getPartyTax(String[] taxId, String[] taxSchema, PdfFont bold) {
        Paragraph p = new Paragraph()
                .setFontSize(10).setMultipliedLeading(1.0f)
                .add(new Text("Tax ID(s):").setFont(bold));
        if (taxId.length == 0) {
            p.add("\nNot applicable");
        }
        else {
            int n = taxId.length;
            for (int i = 0; i < n; i++) {
                p.add(NEWLINE)
                        .add(String.format("%s: %s", taxSchema[i], taxId[i]));
            }
        }
        return new Cell().setBorder(Border.NO_BORDER).add(p);
    }

    /**
     * Gets the line item table.
     *
     * @param invoice the invoice
     * @param bold a bold font
     * @return the line item table
     */
    public Table getLineItemTable(Invoice invoice, PdfFont bold) {
        Table table = new Table(new UnitValue[]{
                new UnitValue(UnitValue.PERCENT, 59.5f),
                new UnitValue(UnitValue.PERCENT, 12.5f),
                new UnitValue(UnitValue.PERCENT, 12.5f),
//                new UnitValue(UnitValue.PERCENT, 12.5f),
//                new UnitValue(UnitValue.PERCENT, 12.5f),
                new UnitValue(UnitValue.PERCENT, 15.5f)})
                .setWidth(UnitValue.createPercentValue(100))
                .setMarginTop(10).setMarginBottom(10);
        table.addHeaderCell(createCell("Item:", bold));
        table.addHeaderCell(createCell("Price:", bold));
        table.addHeaderCell(createCell("Qty:", bold));
//        table.addHeaderCell(createCell("Subtotal:", bold));
//        table.addHeaderCell(createCell("VAT:", bold));
        table.addHeaderCell(createCell("Amount:", bold));
        Product product;
        for (Item item : invoice.getItems()) {
            product = item.getProduct();
            table.addCell(createCell(product.getName()));
            table.addCell(createCell(
                    InvoiceData.format2dec(InvoiceData.round(product.getPrice())))
                    .setTextAlignment(TextAlignment.RIGHT));
            table.addCell(createCell(String.valueOf(item.getQuantity()))
                    .setTextAlignment(TextAlignment.RIGHT));
//            table.addCell(createCell(
//                    InvoiceData.format2dec(InvoiceData.round(item.getCost())))
//                    .setTextAlignment(TextAlignment.RIGHT));
//            table.addCell(createCell(
//                    InvoiceData.format2dec(InvoiceData.round(product.getVat())))
//                    .setTextAlignment(TextAlignment.RIGHT));
            table.addCell(createCell(
                    InvoiceData.format2dec(InvoiceData.round(
                            (item.getCost()))))
                    .setTextAlignment(TextAlignment.RIGHT));
        }
        return table;
    }

    /**
     * Creates a cell with specific properties set.
     *
     * @param text the text that will be in the cell
     * @return the cell
     */

    public Cell createCell(String text) {
        return new Cell().setPadding(0.8f)
                .add(new Paragraph(text)
                        .setMultipliedLeading(1));
    }

    /**
     * Creates a cell with specific properties set.
     *
     * @param text the text that will be in the cell
     * @param font the font
     * @return the cell
     */
    public Cell createCell(String text, PdfFont font) {
        return new Cell().setPadding(0.8f)
                .add(new Paragraph(text)
                        .setFont(font).setMultipliedLeading(1));
    }

    /**
     * Gets the totals table.
     *
     * @param tBase the total tax base
     * @param tTax the total tax amount
     * @param tTotal the total tax
     * @param tCurrency the tax currency
     * @param type the tax types
     * @param percentage the tax percentages
     * @param base the base amounts
     * @param tax the tax amounts
     * @param currency the currencies
     * @param bold a bold font
     * @return the totals table
     */
//    public Table getTotalsTable(String tBase, String tTax, String tTotal, String tCurrency,
//                                String[] type, String[] percentage, String base[], String tax[], String currency[],
//                                PdfFont bold) {
//        Table table = new Table(new UnitValue[]{
//                new UnitValue(UnitValue.PERCENT, 8.33f),
//                new UnitValue(UnitValue.PERCENT, 8.33f),
//                new UnitValue(UnitValue.PERCENT, 25f),
//                new UnitValue(UnitValue.PERCENT, 25f),
//                new UnitValue(UnitValue.PERCENT, 25f),
//                new UnitValue(UnitValue.PERCENT, 8.34f)})
//                .setWidth(UnitValue.createPercentValue(100));
//        table.addCell(createCell("TAX:", bold));
//        table.addCell(createCell("%", bold)
//                .setTextAlignment(TextAlignment.RIGHT));
//        table.addCell(createCell("Base amount:", bold));
//        table.addCell(createCell("Tax amount:", bold));
//        table.addCell(createCell("Total:", bold));
//        table.addCell(createCell("Curr.:", bold));
//        int n = type.length;
//        for (int i = 0; i < n; i++) {
//            table.addCell(createCell(type[i])
//                    .setTextAlignment(TextAlignment.RIGHT));
//            table.addCell(createCell(percentage[i])
//                    .setTextAlignment(TextAlignment.RIGHT));
//            table.addCell(createCell(base[i])
//                    .setTextAlignment(TextAlignment.RIGHT));
//            table.addCell(createCell(tax[i])
//                    .setTextAlignment(TextAlignment.RIGHT));
//            double total = Double.parseDouble(base[i]) + Double.parseDouble(tax[i]);
//            table.addCell(createCell(
//                    InvoiceData.format2dec(InvoiceData.round(total)))
//                    .setTextAlignment(TextAlignment.RIGHT));
//            table.addCell(createCell(currency[i]));
//        }
//        table.addCell(new Cell(1, 2).setBorder(Border.NO_BORDER));
//        table.addCell(createCell(tBase, bold)
//                .setTextAlignment(TextAlignment.RIGHT));
//        table.addCell(createCell(tTax, bold)
//                .setTextAlignment(TextAlignment.RIGHT));
//        table.addCell(createCell(tTotal, bold)
//                .setTextAlignment(TextAlignment.RIGHT));
//        table.addCell(createCell(tCurrency, bold));
//        return table;
//    }

    /**
     * Gets the payment info.
     *
     * @param ref the reference
     * @param bic the BIC code
     * @param iban the IBAN code
     * @return the payment info
     */
    public Paragraph getPaymentInfo(String ref, String[] bic, String[] iban) {
        Paragraph p = new Paragraph(String.format(
                "Please wire the amount due to our bank account using the following reference: %s",
                ref));
        int n = bic.length;
        for (int i = 0; i < n; i++) {
            p.add(NEWLINE).add(String.format("BIC: %s - IBAN: %s", bic[i], iban[i]));
        }
        return p;
    }
}