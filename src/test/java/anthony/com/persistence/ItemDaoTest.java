package anthony.com.persistence;

import anthony.com.entity.*;
import anthony.com.util.Database;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The type User dao test.
 */
class ItemDaoTest {
    Logger logger = LogManager.getLogger(this.getClass()) ;

    GenericDao itemDao;
    /**
     * Sets up.
     */
    @BeforeEach
    void setUp() {
        itemDao = new GenericDao(Item.class);
        Database database = Database.getInstance();
        database.runSQL("sql.sql");
    }

    /**
     * Verify successful insert of a invoice
     */
    @Test
    void insertProduct() {
        // int id, String name, double price, double vat
        GenericDao productDao = new GenericDao(Product.class);
        GenericDao invoiceDao = new GenericDao(Invoice.class);
        Product product = (Product)productDao.getById(1);
        Invoice invoice = (Invoice)invoiceDao.getById(1);

        Item item = new Item(1, product, 2, 2000, invoice);
        itemDao.insert(item);

        Item insertedItem = (Item)itemDao.getById(2);
        logger.info("inserted item" + insertedItem);
        assertEquals(item, insertedItem);

    }
//
//    /**
//     * Verify successful delete of invoice and descriptions
//     */
//    @Test
//    void deleteSuccess() {
//        GenericDao productDao = new GenericDao(Product.class);
//        GenericDao invoiceDao = new GenericDao(Invoice.class);
//        Product product = (Product)productDao.getById(1);
//        Invoice invoice = (Invoice)invoiceDao.getById(1);
//
//        Item item = (Item)itemDao.getByPropertyEqual("cost", "2000");
//        product.removeItem(item);
//        assertEquals(null, item);
//    }

    /**
     * Verify successful update of invoice
     */
    @Test
    void updateSuccess() {
        GenericDao invoiceDao = new GenericDao(Invoice.class);

        String newTerms = "New terms";
        Invoice invoiceToUpdate = (Invoice)invoiceDao.getById(1);
        invoiceToUpdate.setTerms(newTerms);
        invoiceDao.saveOrUpdate(invoiceToUpdate);
        Invoice retrievedInvoice = (Invoice)invoiceDao.getById(1);
        assertEquals(invoiceToUpdate, retrievedInvoice);
    }
//
//    /**
//     * Verify successful get by property (equal match)
//     */
//    @Test
//    void getByPropertyEqualSuccess() {
//
//        List<Invoice> invoices = invoiceDao.getByPropertyEqual("terms", "Due upon receipt");
//        assertEquals(1, invoices.size());
//        assertEquals(1, invoices.get(0).getId());
//    }
//
//    /**
//     * Verify successful get by property (like match)
//     */
//    @Test
//    void getByPropertyLikeSuccess() {
//        List<Invoice> invoices = invoiceDao.getByPropertyLike("terms", "Upon receipt");
//        assertEquals(1, invoices.size());
//    }
//
//    /**
//     * Confirms getsa all invoices successfully.
//     */
//    @Test
//    void getAllUsersSuccess() {
//        List<Invoice> invoices = invoiceDao.getAll();
//        assertEquals(1, invoices.size());
//    }
}