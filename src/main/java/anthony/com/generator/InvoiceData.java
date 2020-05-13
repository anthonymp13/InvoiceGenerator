///*
// * Code written by Bruno Lowagie in the context of an example for the ZUGFeRD book.
// * See http://developers.itextpdf.com/content/zugferd-future-invoicing/
// */
package anthony.com.generator;
//
//import java.util.Map;
//import java.util.TreeMap;
//
//import anthony.com.entity.Company;
//import anthony.com.entity.Customer;
//import anthony.com.entity.Invoice;
//import anthony.com.entity.Item;
//import anthony.com.persistence.GenericDao;
////import com.itextpdf.zugferd.profiles.BasicProfileImp;
////import com.itextpdf.zugferd.profiles.ComfortProfileImp;
////import com.itextpdf.zugferd.profiles.IBasicProfile;
////import com.itextpdf.zugferd.profiles.IComfortProfile;
////import com.itextpdf.zugferd.validation.basic.DateFormatCode;
////import com.itextpdf.zugferd.validation.basic.DocumentTypeCode;
////import com.itextpdf.zugferd.validation.basic.TaxIDTypeCode;
////import com.itextpdf.zugferd.validation.basic.TaxTypeCode;
////import com.itextpdf.zugferd.validation.comfort.FreeTextSubjectCode;
////import com.itextpdf.zugferd.validation.comfort.PaymentMeansCode;
////import com.itextpdf.zugferd.validation.comfort.TaxCategoryCode;
//
///**
// * Class in which we can store all the data of an {@link Invoice} object.
// *
// * @author Bruno Lowagie (iText Software)
// */
public class InvoiceData {
//
//    /**
//     * Creates a new {@link InvoiceData} instance.
//     */
//    public InvoiceData() {
//    }
//
//    /**
//     * Creates a object that implements the {@link IBasicProfile} interface,
//     * given a specific {@link Invoice} object.
//     *
//     * @param invoice the invoice
//     * @return the {@link IBasicProfile} implementation
//     */
//    public IBasicProfile createBasicProfileData(Invoice invoice) {
//        BasicProfileImp profileImp = new BasicProfileImp(true);
//        importData(profileImp, invoice);
//        importBasicData(profileImp, invoice);
//        return profileImp;
//    }
//
//    /**
//     * Creates a object that implements the {@link IComfortProfile} interface,
//     * given a specific {@link Invoice} object.
//     *
//     * @param invoice the invoice
//     * @return the {@link IComfortProfile} implementation
//     */
//    public IComfortProfile createComfortProfileData(Invoice invoice) {
//        ComfortProfileImp profileImp = new ComfortProfileImp(true);
//        importData(profileImp, invoice);
//        importComfortData(profileImp, invoice);
//        return profileImp;
//    }
//
//    /**
//     * Imports the data from an invoice into a {@link BasicProfileImp} instance.
//     *
//     * @param profileImp the {IBasicProfile} implementation
//     * @param invoice the invoice
//     */
//    public void importData(BasicProfileImp profileImp, Invoice invoice) {
//        GenericDao companyDao = new GenericDao(Company.class);
////        TODO: Finish getting company data based on current user
//        Company company = (Company)companyDao.getById(1);
//
//
//        profileImp.setTest(true);
//        profileImp.setId(String.format("I/%05d", invoice.getId()));
//        profileImp.setId(String.format("I/%05d", invoice.getId()));
//        profileImp.setName("INVOICE");
//        profileImp.setTypeCode(DocumentTypeCode.COMMERCIAL_INVOICE);
//        profileImp.setDate(invoice.getInvoiceDate(), DateFormatCode.YYYYMMDD);
//        profileImp.setSellerName("Das Company");
//        profileImp.setSellerLineOne("ZUG Business Center");
//        profileImp.setSellerLineTwo("Highway 1");
//        profileImp.setSellerPostcode("9000");
//        profileImp.setSellerCityName("Ghent");
//        profileImp.setSellerCountryID("BE");
//        profileImp.addSellerTaxRegistration(TaxIDTypeCode.FISCAL_NUMBER, "201/113/40209");
//        profileImp.addSellerTaxRegistration(TaxIDTypeCode.VAT, "BE123456789");
//        Customer customer = invoice.getCustomer();
//        profileImp.setBuyerName(String.format("%s, %s", customer.getLastName(), customer.getFirstName()));
//        profileImp.setBuyerPostcode(Integer.toString(customer.getPostalcode()));
//        profileImp.setBuyerLineOne(customer.getStreet());
//        profileImp.setBuyerLineTwo("");
//        profileImp.setBuyerCityName(customer.getCity());
//        profileImp.setBuyerCountryID(customer.getCountryId());
//        profileImp.setPaymentReference(String.format("%09d", invoice.getId()));
//        profileImp.setInvoiceCurrencyCode("EUR");
//    }
//
//    /**
//     * Import the basic data into a {@link BasicProfileImp} instance.
//     *
//     * @param profileImp the {IBasicProfile} implementation
//     * @param invoice the invoice
//     */
//    public void importBasicData(BasicProfileImp profileImp, Invoice invoice) {
//        profileImp.addNote(
//                new String[]{"This is a test invoice.\nNothing on this invoice is real.\nThis invoice is part of a tutorial."});
//        profileImp.addPaymentMeans("", "", "BE 41 7360 0661 9710", "", "", "KREDBEBB", "", "KBC");
//        profileImp.addPaymentMeans("", "", "BE 56 0015 4298 7888", "", "", "GEBABEBB", "", "BNP Paribas");
//        Map<Double,Double> taxes = new TreeMap<Double, Double>();
//        double tax;
//        for (Item item : invoice.getItems()) {
//            tax = item.getProduct().getVat();
//            if (taxes.containsKey(tax)) {
//                taxes.put(tax, taxes.get(tax) + item.getCost());
//            }
//            else {
//                taxes.put(tax, item.getCost());
//            }
//            profileImp.addIncludedSupplyChainTradeLineItem(format4dec(item.getQuantity()), "C62", item.getProduct().getName());
//        }
//        double total, tA;
//        double ltN = 0;
//        double ttA = 0;
//        double gtA = 0;
//        for (Map.Entry<Double, Double> t : taxes.entrySet()) {
//            tax = t.getKey();
//            total = round(t.getValue());
//            gtA += total;
//            tA = round((100 * total) / (100 + tax));
//            ttA += (total - tA);
//            ltN += tA;
//            profileImp.addApplicableTradeTax(format2dec(total - tA), "EUR", TaxTypeCode.VALUE_ADDED_TAX, format2dec(tA), "EUR", format2dec(tax));
//        }
//        profileImp.setMonetarySummation(format2dec(ltN), "EUR",
//                format2dec(0), "EUR",
//                format2dec(0), "EUR",
//                format2dec(ltN), "EUR",
//                format2dec(ttA), "EUR",
//                format2dec(gtA), "EUR");
//    }
//
//    /**
//     * Import comfort data into a {@link ComfortProfileImp} instance.
//     *
//     * @param profileImp the {IComfortProfile} implementation
//     * @param invoice the invoice
//     */
//    public void importComfortData(ComfortProfileImp profileImp, Invoice invoice) {
//        profileImp.addNote(
//                new String[]{"This is a test invoice.\nNothing on this invoice is real.\nThis invoice is part of a tutorial."},
//                FreeTextSubjectCode.REGULATORY_INFORMATION);
//        profileImp.addPaymentMeans(
//                PaymentMeansCode.PAYMENT_TO_BANK_ACCOUNT,
//                new String[]{"This is the preferred bank account."},
//                "", "",
//                "", "",
//                "BE 41 7360 0661 9710", "", "",
//                "", "", "",
//                "KREDBEBB", "", "KBC");
//        profileImp.addPaymentMeans(
//                PaymentMeansCode.PAYMENT_TO_BANK_ACCOUNT,
//                new String[]{"Use this as an alternative account."},
//                "", "",
//                "", "",
//                "BE 56 0015 4298 7888", "", "",
//                "", "", "",
//                "GEBABEBB", "", "BNP Paribas");
//        Map<Double,Double> taxes = new TreeMap<Double, Double>();
//        double tax;
//        int counter = 0;
//        for (Item item : invoice.getItems()) {
//            counter++;
//            tax = item.getProduct().getVat();
//            if (taxes.containsKey(tax)) {
//                taxes.put(tax, taxes.get(tax) + item.getCost());
//            }
//            else {
//                taxes.put(tax, item.getCost());
//            }
//            profileImp.addIncludedSupplyChainTradeLineItem(
//                    String.valueOf(counter),
//                    null,
//                    format4dec(item.getProduct().getPrice()), "EUR", null, null,
//                    null, null, null, null,
//                    null, null, null, null,
//                    format4dec(item.getQuantity()), "C62",
//                    new String[]{TaxTypeCode.VALUE_ADDED_TAX},
//                    new String[1],
//                    new String[]{TaxCategoryCode.STANDARD_RATE},
//                    new String[]{format2dec(item.getProduct().getVat())},
//                    format2dec(item.getCost()), "EUR",
//                    null, null,
//                    String.valueOf(item.getProduct().getId()), null,
//                    item.getProduct().getName(), null
//            );
//        }
//        double total, tA;
//        double ltN = 0;
//        double ttA = 0;
//        double gtA = 0;
//        for (Map.Entry<Double, Double> t : taxes.entrySet()) {
//            tax = t.getKey();
//            total = round(t.getValue());
//            gtA += total;
//            tA = round((100 * total) / (100 + tax));
//            ttA += (total - tA);
//            ltN += tA;
//            profileImp.addApplicableTradeTax(
//                    format2dec(total - tA), "EUR", TaxTypeCode.VALUE_ADDED_TAX,
//                    null, format2dec(tA), "EUR",
//                    TaxCategoryCode.STANDARD_RATE, format2dec(tax));
//        }
//        profileImp.setMonetarySummation(format2dec(ltN), "EUR",
//                format2dec(0), "EUR",
//                format2dec(0), "EUR",
//                format2dec(ltN), "EUR",
//                format2dec(ttA), "EUR",
//                format2dec(gtA), "EUR");
//    }
//
    /**
     * Round a double value.
     *
     * @param d the double value
     * @return the rounded double
     */
    public static double round(double d) {
        d = d * 100;
        long tmp = Math.round(d);
        return (double) tmp / 100;
    }

    /**
     * Format a double so that it has 2 decimals.
     *
     * @param d the double value
     * @return a string representation of the double value
     */
    public static String format2dec(double d) {
        return String.format("%.2f", d);
    }

//    /**
//     * Format a double so that it has 4 decimals.
//     *
//     * @param d the double value
//     * @return a string representation of the double value
//     */
//    public static String format4dec(double d) {
//        return String.format("%.4f", d);
//    }
//
}