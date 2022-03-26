package anthony.com.persistence;

import anthony.com.entity.*;
import anthony.com.util.Database;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * The type User dao test.
 */
class RoleDaoTest {


    GenericDao roleDao;
    /**
     * Sets up.
     */
    @BeforeEach
    void setUp() {
        roleDao = new GenericDao(Role.class);
        Database database = Database.getInstance();
        database.runSQL("sql.sql");

    }

    /**
     * Verify successful insert of a role
     */
    @Test
    void insertSuccess() {

        roleDao = new GenericDao(Role.class);
        Database database = Database.getInstance();
        database.runSQL("sql.sql");
        GenericDao userDao = new GenericDao(User.class);
        User user = (User)userDao.getById(1);
        String userName = user.getUserName();
        Role newRole = new Role(user, "employee", userName);

        int id = roleDao.insert(newRole);
        assertNotEquals(0, id);
        Role insertedRole = (Role)roleDao.getById(id);
        assertEquals(newRole, insertedRole);

    }

    /**
     * Verify successful delete of user roles
     */
    @Test
    void deleteSuccess() {

        roleDao.delete(roleDao.getById(1));
        assertNull(roleDao.getById(1));
    }

    /**
     * Verify successful update of invoice
     */
    @Test
    void updateSuccess() {
        String newRole = "New Role";
        Role roleToUpdate = (Role)roleDao.getById(1);

        roleToUpdate.setRoleName(newRole);
        roleDao.saveOrUpdate(roleToUpdate);
        Role retrievedRole = (Role)roleDao.getById(1);
        assertEquals(roleToUpdate, retrievedRole);
    }

    /**
     * Verify successful get by property (equal match)
     */
    @Test
    void getByPropertyEqualSuccess() {
        List<Role> roles = roleDao.getByPropertyEqual("roleName", "admin");
        assertEquals(1, roles.size());
        assertEquals(1, roles.get(0).getId());
    }

    /**
     * Verify successful get by property (like match)
     */
    @Test
    void getByPropertyLikeSuccess() {
        List<Role> roles = roleDao.getByPropertyLike("userName", "anthonyp");
        assertEquals(1, roles.size());
    }


//    /**
//     * Confirms getsa all invoices successfully.
//     */
//    @Test
//    void getAllUsersSuccess() {
//        List<Invoice> invoices = invoiceDao.getAll();
//        assertEquals(1, invoices.size());
//    }
}