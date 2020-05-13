package anthony.com.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * A class that represents a user
 */
@Entity(name="User")
@Table(name="user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name="native", strategy = "native")
    @Column(name = "id")
    private int userId;

    @Column(name = "userName")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<Role> roles = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "companyId", referencedColumnName = "id")
    private Company company;

    /**
     * No argument constructor
     */
    public User() {}

    /**
     * All argument constructor
     *
     * @param firstName the first name
     * @param lastName  the last name
     * @param userName  the user name
     * @param company   the company
     * @param password  the password
     */
    public User(String firstName, String lastName, String userName, Company company, String password ) {
            this.firstName = firstName;
            this.lastName = lastName;
            this.userName = userName;
            this.company = company;
            this.password = password;
    }

    /**
     * get user_id
     *
     * @return user id
     */
    public int getUserId() {
        return userId;
    }

    /**
     * set user_id
     *
     * @param userId the user id
     * @return
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * get user_name
     *
     * @return user name
     */
    public String getUserName() {
        return userName;
    }

    /**
     * set user_name
     *
     * @param userName the user name
     * @return
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * get password
     *
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * set password
     *
     * @param password the password
     * @return
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * get last name
     *
     * @return first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * set first name
     *
     * @param firstName the first name
     * @return
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * get last name
     *
     * @return last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * set last name
     *
     * @param lastName the last name
     * @return
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }


    /**
     * Add role.
     *
     * @param role the role
     */
    public void addRole(Role role) {
        roles.add(role);
        role.setUser(this);

    }

    /**
     * Remove role.
     *
     * @param role the role
     */
    public void removeRole(Role role) {
        roles.remove(role);
        role.setUser(null);
    }


    /**
     * get company id
     *
     * @return company
     */
    public Company getCompany() {
        return company;
    }

    /**
     * set company id
     *
     * @param company the company
     * @return
     */
    public void setCompany(Company company) {
        this.company = company;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return userId == user.userId &&
                userName.equals(user.userName) &&
                password.equals(user.password) &&
                firstName.equals(user.firstName) &&
                lastName.equals(user.lastName) &&
                company.equals(user.company);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, userName, password, firstName, lastName, company);
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", role='" + roles + '\'' +
                '}';
    }
}