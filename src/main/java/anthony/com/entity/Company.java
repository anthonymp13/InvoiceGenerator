package anthony.com.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * A class that represents a Company.
 */
@Entity(name="Company")
@Table(name="company")
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY, generator = "AUTO")
    @GenericGenerator(name="native", strategy = "native")
    @Column(name = "id")
    private int companyId;

    @Column(name = "companyName")
    private String companyName;

    @Column(name = "address")
    private String address;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "zip")
    private int zip;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<User> users = new HashSet<>();

    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<Customer> customers = new HashSet<>();

    /**
     * Instantiates a new Company.
     */
    public Company() {}

    /**
     * Instantiates a new Company
     *
     * @param companyName the company name
     * @param address     the address
     * @param city        the city
     * @param state       the state
     * @param zip         the zip
     * @param phoneNumber the phone number
     */
    public Company(String companyName, String address, String city, String state, int zip, String phoneNumber) {
        this.companyName = companyName;
        this.address = address;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.phoneNumber = phoneNumber;
    }

    /**
     * Get users fk
     *
     * @return users users
     */
    public Set<User> getUsers() {
        return users;
    }


    /**
     * Get company id
     *
     * @return company id
     */
    public int getCompanyId() {
        return companyId;
    }

    /**
     * Set company id
     *
     * @param companyId the company id
     * @return
     */
    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    /**
     * Get company name
     *
     * @return company name
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * Set company name
     *
     * @param companyName the company name
     * @return
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * Get address
     *
     * @return address address
     */
    public String getAddress() {
        return address;
    }

    /**
     * Set address
     *
     * @param address the address
     * @return
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * Get city
     *
     * @return city city
     */
    public String getCity() {
        return city;
    }

    /**
     * Set city
     *
     * @param city the city
     * @return
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * Get state
     *
     * @return state state
     */
    public String getState() {
        return state;
    }

    /**
     * Set state
     *
     * @param state the state
     * @return
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * Get zip
     *
     * @return zip zip
     */
    public int getZip() {
        return zip;
    }

    /**
     * Set zip
     *
     * @param zip the zip
     * @return
     */
    public void setZip(int zip) {
        this.zip = zip;
    }

    /**
     * Get phone number
     *
     * @return phone number
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Set phone number
     *
     * @param phoneNumber the phone number
     * @return
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * Sets users.
     *
     * @param users the users
     */
    public void setUsers(Set<User> users) {
        this.users = users;
    }

    /**
     * Gets customers.
     *
     * @return the customers
     */
    public Set<Customer> getCustomers() {
        return customers;
    }

    /**
     * Sets customers.
     *
     * @param customers the customers
     */
    public void setCustomers(Set<Customer> customers) {
        this.customers = customers;
    }

    /**
     * Add user.
     *
     * @param user the user
     */
    public void addUser(User user) {
        users.add(user);
        user.setCompany(this);

    }

    /**
     * Remove user.
     *
     * @param user the user
     */
    public void removeUser(User user) {
        users.remove(user);
        user.setCompany(null);
    }

    /**
     * Add customer.
     *
     * @param customer the customer
     */
    public void addCustomer(Customer customer) {
        customers.add(customer);
        customer.setCompany(this);

    }

    /**
     * Remove customer.
     *
     * @param customer the customer
     */
    public void removeCustomer(Customer customer) {
        customers.remove(customer);
        customer.setCompany(null);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Company company = (Company) o;
        return companyId == company.companyId &&
                zip == company.zip &&
                companyName.equals(company.companyName) &&
                address.equals(company.address) &&
                city.equals(company.city) &&
                state.equals(company.state) &&
                phoneNumber.equals(company.phoneNumber);
    }

    @Override
    public int hashCode() {
        return Objects.hash(companyId, companyName, address, city, state, zip, phoneNumber);
    }

    @Override
    public String toString() {
        return "Company{" +
                "companyId=" + companyId +
                ", companyName='" + companyName + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", state='" + state + '\'' +
                ", zip=" + zip +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", users=" + users +
                '}';
    }
}
