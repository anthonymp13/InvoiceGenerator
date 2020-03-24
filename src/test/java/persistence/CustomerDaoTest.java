package persistence;

import entity.Company;
import entity.Customer;
import util.Database;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The type User dao test.
 */
class CustomerDaoTest {


    GenericDao customerDao;
    /**
     * Sets up.
     */
    @BeforeEach
    void setUp() {
        customerDao = new GenericDao(Customer.class);
        Database database = Database.getInstance();
        database.runSQL("sql.sql");
    }

    /**
     * Verify successful insert of a user
     */
    @Test
    void insertSuccess() {
        GenericDao companyDao = new GenericDao(Company.class);
        Company company = (Company)companyDao.getById(1);
        Customer newCustomer = new Customer("Sam", "Smith", "5342  South st", "madison", "Wisconsin", 53705, "543-234-2354", company, "BE", "samsmith@gmail.com");

        int id = customerDao.insert(newCustomer);
        assertNotEquals(0, id);
        Customer insertedCustomer = (Customer)customerDao.getById(id);
        assertEquals(newCustomer, insertedCustomer);
        assertNotNull(insertedCustomer.getId());
        assertEquals(company, insertedCustomer.getCompany());
    }

    /**
     * Verify successful delete of user and not company
     */
    @Test
    void deleteSuccess() {
        Company userCompany = ((Customer)customerDao.getById(1)).getCompany();
        customerDao.delete(customerDao.getById(1));
        assertNull(customerDao.getById(1));
        assertNotNull(userCompany);
    }

    /**
     * Verify successful update of user
     */
    @Test
    void updateSuccess() {
        String newLastName = "Davis";
        Customer userToUpdate = (Customer)customerDao.getById(1);
        userToUpdate.setLastName(newLastName);
        customerDao.saveOrUpdate(userToUpdate);
        Customer retrievedUser = (Customer)customerDao.getById(1);
        assertEquals(userToUpdate, retrievedUser);
    }

    /**
     * Verify successful get by property (equal match)
     */
    @Test
    void getByPropertyEqualSuccess() {
        List<Customer> customers = customerDao.getByPropertyEqual("firstName", "Tim");
        assertEquals(1, customers.size());
        assertEquals(1, customers.get(0).getId());
    }

    /**
     * Verify successful get by property (like match)
     */
    @Test
    void getByPropertyLikeSuccess() {
        List<Customer> customers = customerDao.getByPropertyLike("lastName", "w");
        assertEquals(1, customers.size());
    }

    /**
     * Confirms gets all users success.
     */
    @Test
    void getAllUsersSuccess() {
        List<Customer> customers = customerDao.getAll();
        assertEquals(1, customers.size());
    }

    /**
     * Verifies a user is returned correctly based on id search
     */
    @Test
    void getByIdSuccess() {
        Customer retrievedCustomer = (Customer)customerDao.getById(1);
        assertNotNull(retrievedCustomer);
        assertEquals("Tim", retrievedCustomer.getFirstName());
    }

}