package anthony.com.persistence;

import anthony.com.entity.Company;
import anthony.com.entity.Customer;
import anthony.com.entity.User;
import anthony.com.util.Database;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The type User dao test.
 */
class UserDaoTest {


    GenericDao userDao;
    /**
     * Sets up.
     */
    @BeforeEach
    void setUp() {
        userDao = new GenericDao(User.class);
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
        User newUser = new User("Jim", "Jones", "jimj", company, "jimjp");

        int id = userDao.insert(newUser);
        assertNotEquals(0,id);
        User insertedUser = (User)userDao.getById(id);
        assertEquals(newUser, insertedUser);
        assertNotNull(insertedUser.getUserId());
        assertEquals(company, insertedUser.getCompany());
    }

    /**
     * Verify successful delete of user and not company
     */
    @Test
    void deleteSuccess() {
        Company userCompany = ((User)userDao.getById(1)).getCompany();
        userDao.delete(userDao.getById(1));
        assertNull(userDao.getById(1));
        assertNotNull(userCompany);
    }

    /**
     * Verify successful update of user
     */
    @Test
    void updateSuccess() {
        String newLastName = "Davis";
        User userToUpdate = (User)userDao.getById(1);
        userToUpdate.setLastName(newLastName);
        userDao.saveOrUpdate(userToUpdate);
        User retrievedUser = (User)userDao.getById(1);
        assertEquals(userToUpdate, retrievedUser);
    }

    /**
     * Verify successful get by property (equal match)
     */
    @Test
    void getByPropertyEqualSuccess() {
        List<User> users = userDao.getByPropertyEqual("lastName", "Poleski");
        assertEquals(1, users.size());
        assertEquals(1, users.get(0).getUserId());
    }



    /**
     * Verify successful get by property (like match)
     */
    @Test
    void getByPropertyLikeSuccess() {
        List<User> users = userDao.getByPropertyLike("lastName", "p");
        assertEquals(1, users.size());
    }

    /**
     * Confirms gets all users success.
     */
    @Test
    void getAllUsersSuccess() {
        List<User> users = userDao.getAll();
        assertEquals(2, users.size());
    }



    /**
     * Verifies a user is returned correctly based on id search
     */
    @Test
    void getByIdSuccess() {
        User retrievedUser = (User)userDao.getById(1);
        assertNotNull(retrievedUser);
        assertEquals("Anthony", retrievedUser.getFirstName());
    }

    /**
     * Verifies getting customers from a company by getting the userId
     */
    @Test
    void getCustomersByUserId() {
        List<User> users = userDao.getByPropertyEqual("userName", "anthonyp");
        Company userCompany = users.get(0).getCompany();
        Set<Customer> customers = userCompany.getCustomers();

        GenericDao customerDao = new GenericDao(Customer.class);

        customers.size();
        assertEquals(1, customers.size());
    }

}