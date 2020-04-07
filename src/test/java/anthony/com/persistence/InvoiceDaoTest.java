package anthony.com.persistence;

import anthony.com.entity.*;
import anthony.com.util.Database;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The type User dao test.
 */
class InvoiceDaoTest {

    GenericDao invoiceDao;
    /**
     * Sets up.
     */
    @BeforeEach
    void setUp() {
        invoiceDao = new GenericDao(Invoice.class);
        Database database = Database.getInstance();
        database.runSQL("sql.sql");
    }

    /**
     * Verify successful insert of a invoice
     */
    @Test
    void insertWithInvoiceAndProduct() {
        GenericDao userDao= new GenericDao(User.class);
        User user = (User)userDao.getById(1);
        GenericDao customerDao = new GenericDao(Customer.class);
        Customer customer = (Customer)customerDao.getById(1);
        Date date = new Date(2020, 2, 27);
        Invoice newInvoice = new Invoice(date, 1500.00, "Upon completion", user, customer);

        GenericDao productDao = new GenericDao(Product.class);
        Product product = (Product)productDao.getById(1);

        Item item = new Item(1, product, 5, newInvoice);
        newInvoice.addItem(item);

        int id = userDao.insert(newInvoice);
        assertNotEquals(0,id);
        Invoice insertedInvoice = (Invoice)invoiceDao.getById(id);
        assertEquals(newInvoice, insertedInvoice);
        assertNotNull(insertedInvoice);

    }

    /**
     * Verify successful delete of invoice and descriptions
     */
    @Test
    void deleteSuccess() {
        invoiceDao.delete(invoiceDao.getById(1));
        assertNull(invoiceDao.getById(1));

        GenericDao<Item> itemDao = new GenericDao(Item.class);
        List<Item> items = itemDao.getAll();
        assertEquals(0, items.size());
    }

    /**
     * Verify successful update of invoice
     */
    @Test
    void updateSuccess() {
        String newTerms = "New terms";
        Invoice invoiceToUpdate = (Invoice)invoiceDao.getById(1);
        invoiceToUpdate.setTerms(newTerms);
        invoiceDao.saveOrUpdate(invoiceToUpdate);
        Invoice retrievedInvoice = (Invoice)invoiceDao.getById(1);
        assertEquals(invoiceToUpdate, retrievedInvoice);
    }

    /**
     * Verify successful get by property (equal match)
     */
    @Test
    void getByPropertyEqualSuccess() {

        List<Invoice> invoices = invoiceDao.getByPropertyEqual("terms", "Due upon receipt");
        assertEquals(1, invoices.size());
        assertEquals(1, invoices.get(0).getId());
    }

    /**
     * Verify successful get by property (like match)
     */
    @Test
    void getByPropertyLikeSuccess() {
        List<Invoice> invoices = invoiceDao.getByPropertyLike("terms", "Upon receipt");
        assertEquals(1, invoices.size());
    }

    /**
     * Confirms getsa all invoices successfully.
     */
    @Test
    void getAllUsersSuccess() {
        List<Invoice> invoices = invoiceDao.getAll();
        assertEquals(1, invoices.size());
    }
}