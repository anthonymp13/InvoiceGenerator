package anthony.com.persistence;

import anthony.com.entity.*;
import anthony.com.util.Database;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The Company dao tests.
 */
class CompanyDaoTest {

    GenericDao companyDao;
    /**
     * Sets up.
     */

    @BeforeEach
    void setUp() {
        companyDao = new GenericDao(Company.class);
        Database database = Database.getInstance();
        database.runSQL("sql.sql");
    }

    /**
     * Verify successful insert of a user
     */
    @Test
    void insertSuccess() {
        Company newCompany = new Company("Test Insert", "testAddress", "Madison", "Wisconsin", 53704, "608-598-9342");
        int id = companyDao.insert(newCompany);
        assertNotEquals(0,id);
        Company insertedCompany = (Company)companyDao.getById(id);
        assertEquals(newCompany, insertedCompany);
    }

    /**
     * Insert a company with a user and customer
     */
    @Test
    void insertWithCompanySuccess() {
        Company newCompany = new Company("Test Insert", "testAddress", "Madison", "Wisconsin", 53704, "608-598-9342");
        User user = new User("Jim", "Jones", "jimj", newCompany,  "jimjp");
        Customer customer = new Customer("Sam", "Smith", "5342  South st", "madison", "Wisconsin", 53705, "543-234-2354", newCompany, "BE", "samsmith@gmail.com");

        newCompany.addUser(user);
        newCompany.addCustomer(customer);
        int id = companyDao.insert(newCompany);

        assertNotEquals(0,id);
        Company insertedCompany = (Company)companyDao.getById(id);
        assertEquals(newCompany, insertedCompany);
        assertEquals(1, insertedCompany.getCustomers().size());
        assertEquals(1, insertedCompany.getUsers().size());
    }
    /**
     * Verify successful delete of user
     */
    @Test
    void deleteSuccess() {
        companyDao.delete(companyDao.getById(1));
        assertNull(companyDao.getById(1));


        // Test if users were deleted
        GenericDao userDao = new GenericDao(User.class);
        // TODO: make database delete everything related to a company upon deletion
        List<User> users = userDao.getAll();

        assertEquals(0, users.size());
    }

    /**
     * Verify successful update of company
     */
    @Test
    void updateSuccess() {
        String newCompanyName = "Hauser Tree Service";
        Company companyToUpdate = (Company)companyDao.getById(1);
        companyToUpdate.setCompanyName(newCompanyName);
        companyDao.saveOrUpdate(companyToUpdate);
        Company retrievedCompany = (Company)companyDao.getById(1);
        assertEquals(companyToUpdate, retrievedCompany);
    }

    /**
     * Verify successful get by property (equal match)
     */
    @Test
    void getByPropertyEqualSuccess() {
        List<Company> companies = companyDao.getByPropertyEqual("companyName", "Hauser Tree Care");
        assertEquals(1, companies.size());
        assertEquals(1, companies.get(0).getCompanyId());
    }

    /**
     * Verify successful get by property (like match)
     */
    @Test
    void getByPropertyLikeSuccess() {
        List<Company> companies = companyDao.getByPropertyLike("companyName", "h");
        assertEquals(1, companies.size());
    }

    /**
     * Confirms gets all users success.
     */
    @Test
    void getAllCompaniesSuccess() {
        List<Company> companies = companyDao.getAll();
        assertEquals(1, companies.size());
    }

//    /**
//     * Confirms gets user by last name success.
//     */
//    @Test
//    void getCompanyByName() {
//        List<Company> companies = companyDao.getCompanyByName("Hauser Tree Care");
//        assertEquals(1, companies.size());
//    }

    /**
     * Verifies a user is returned correctly based on id search
     */
    @Test
    void getByIdSuccess() {
        Company retrievedCompanies = (Company)companyDao.getById(1);
        assertNotNull(retrievedCompanies);
        assertEquals("Hauser Tree Care", retrievedCompanies.getCompanyName());
    }

}