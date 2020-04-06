/*
 * Part of a set of classes based on a sample database.
 * This example was written by Bruno Lowagie in the context of a book.
 * See http://developers.itextpdf.com/content/zugferd-future-invoicing/3-simple-invoice-database
 */
package anthony.com.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

/**
 * Plain Old Java Object containing info about a Customer.
 *
 * @author Bruno Lowagie (iText Software)
 */
@Entity(name="Customer")
@Table(name="customer")
public class Customer {

    /**
     * The id.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name="native", strategy = "native")
    @Column(name = "id")
    protected int id;

    /**
     * The first name.
     */
    @Column(name = "firstName")
    protected String firstName;

    /**
     * The last name.
     */
    @Column(name = "lastName")
    protected String lastName;

    /**
     * The street.
     */
    @Column(name = "street")
    protected String street;

    @Column(name = "state")
    private String state;

    @Column(name = "phoneNumber")
    private String phoneNumber;

    /**
     * The postal code.
     */
    @Column(name = "postalCode")
    protected int postalcode;

    /**
     * The postal code.
     */
    @Column(name = "email")
    protected String email;

    /**
     * The city.
     */
    @Column(name = "city")
    protected String city;

    /**
     * The country id.
     */
    @Column(name = "countryId")
    protected String countryId;

    @ManyToOne
    @JoinColumn(name = "companyId", referencedColumnName = "id")
    private Company company;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<Invoice> invoices = new HashSet<>();

    /**
     * Instantiates a new Customer.
     */
    public Customer() {
    }

    /**
     * Instantiates a new Customer.
     *
     * @param firstName   the first name
     * @param lastName    the last name
     * @param street      the street
     * @param city        the city
     * @param state       the state
     * @param postalcode  the postalcode
     * @param phoneNumber the phone number
     * @param company     the company
     * @param countryId   the country id
     * @param email       the email
     */
    public Customer(String firstName, String lastName, String street, String city, String state, int postalcode, String phoneNumber, Company company, String countryId, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.street = street;
        this.city = city;
        this.state = state;
        this.countryId = countryId;
        this.email = email;
        this.postalcode = postalcode;
        this.phoneNumber = phoneNumber;
        this.company = company;
    }


    /**
     * Gets the id.
     *
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the first name.
     *
     * @return the first name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets the first name.
     *
     * @param firstName the new first name
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets the last name.
     *
     * @return the last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets the last name.
     *
     * @param lastName the new last name
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Gets the street.
     *
     * @return the street
     */
    public String getStreet() {
        return street;
    }

    /**
     * Sets the street.
     *
     * @param street the new street
     */
    public void setStreet(String street) {
        this.street = street;
    }

    /**
     * Gets the city.
     *
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * Sets the city.
     *
     * @param city the new city
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * Gets the postal code.
     *
     * @return the postal code
     */
    public int getPostalcode() {
        return postalcode;
    }

    /**
     * Sets the postal code.
     *
     * @param postalcode the new postalcode
     */
    public void setPostalcode(int postalcode) {
        this.postalcode = postalcode;
    }

    /**
     * Gets the country id.
     *
     * @return the country id
     */
    public String getCountryId() {
        return countryId;
    }

    /**
     * Sets the country id.
     *
     * @param countryId the new country id
     */
    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    /**
     * Gets state.
     *
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * Sets state.
     *
     * @param state the state
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * Gets phone number.
     *
     * @return the phone number
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Sets phone number.
     *
     * @param phoneNumber the phone number
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * Gets email.
     *
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets email.
     *
     * @param email the email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets company.
     *
     * @return the company
     */
    public Company getCompany() {
        return company;
    }

    /**
     * Sets company.
     *
     * @param company the company
     */
    public void setCompany(Company company) {
        this.company = company;
    }

    /**
     * Gets invoices.
     *
     * @return the invoices
     */
    public Set<Invoice> getInvoices() {
        return invoices;
    }

    /**
     * Sets invoices.
     *
     * @param invoices the invoices
     */
    public void setInvoices(Set<Invoice> invoices) {
        this.invoices = invoices;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Customer customer = (Customer) o;
        return id == customer.id &&
                Objects.equals(firstName, customer.firstName) &&
                Objects.equals(lastName, customer.lastName) &&
                Objects.equals(street, customer.street) &&
                Objects.equals(state, customer.state) &&
                Objects.equals(phoneNumber, customer.phoneNumber) &&
                Objects.equals(postalcode, customer.postalcode) &&
                Objects.equals(email, customer.email) &&
                Objects.equals(city, customer.city) &&
                Objects.equals(countryId, customer.countryId) &&
                Objects.equals(company, customer.company);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, firstName, lastName, street, state, phoneNumber, postalcode, email, city, countryId, company);
    }


    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", street='" + street + '\'' +
                ", state='" + state + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", postalcode='" + postalcode + '\'' +
                ", email='" + email + '\'' +
                ", city='" + city + '\'' +
                ", countryId='" + countryId + '\'' +
                ", company=" + company +
                '}';
    }
}