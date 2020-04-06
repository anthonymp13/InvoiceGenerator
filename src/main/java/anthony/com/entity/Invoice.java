/*
 * Part of a set of classes based on a sample database.
 * This example was written by Bruno Lowagie in the context of a book.
 * See http://developers.itextpdf.com/content/zugferd-future-invoicing/3-simple-invoice-database
 */
package anthony.com.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.*;

/**
 * Plain Old Java Object containing info about an Invoice.
 *
 * @author Bruno Lowagie (iText Software)
 */
@Entity(name="Invoice")
@Table(name="invoice")
public class Invoice {

    /** The id. */
    /** The id. */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name="native", strategy = "native")
    @Column(name = "id")
    private int id;

    /** The total. */
    @Column(name = "total")
    private double total;

    /** The invoice date. */
    @Column(name = "invoiceDate")
    private Date invoiceDate;

    @Column(name = "terms")
    private String terms;

    @OneToMany(mappedBy = "invoice", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private List<Item> items = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "customerId", referencedColumnName = "id")
    private Customer customer;

    /**
     * Instantiates a new Invoice.
     */
    public Invoice() {}

    /**
     * Instantiates a new Invoice.
     *
     * @param date     the date
     * @param total    the total
     * @param terms    the terms
     * @param user     the user
     * @param customer the customer
     */
    public Invoice(Date date, double total, String terms, User user, Customer customer) {
        this.invoiceDate = date;
        this.terms = terms;
        this.total = total;
        this.customer = customer;
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
     * Gets the customer.
     *
     * @return the customer
     */
    public Customer getCustomer() {
        return customer;
    }

    /**
     * Gets terms.
     *
     * @return the terms
     */
    public String getTerms() {
        return terms;
    }

    /**
     * Sets terms.
     *
     * @param terms the terms
     */
    public void setTerms(String terms) {
        this.terms = terms;
    }

    /**
     * Sets the customer.
     *
     * @param customer the new customer
     */
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    /**
     * Gets the total.
     *
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * Sets the total.
     *
     * @param total the new total
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     * Gets the items.
     *
     * @return the items
     */
    public List<Item> getItems() {
        return items;
    }

    /**
     * Sets the items.
     *
     * @param items the new items
     */
    public void setItems(List<Item> items) {
        this.items = items;
    }

    /**
     * Gets the invoice date.
     *
     * @return the invoice date
     */
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    /**
     * Sets the invoice date.
     *
     * @param invoiceDate the new invoice date
     */
    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    /**
     * Add item.
     *
     * @param item the item
     */
    public void addItem(Item item) {
        items.add(item);
        item.setInvoice(this);

    }

    /**
     * Remove item.
     *
     * @param item the item
     */
    public void removeItem(Item item) {
        items.remove(item);
        item.setInvoice(null);

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Invoice invoice = (Invoice) o;
        return id == invoice.id &&
                Double.compare(invoice.total, total) == 0 &&
                Objects.equals(invoiceDate, invoice.invoiceDate) &&
                Objects.equals(terms, invoice.terms) &&
                Objects.equals(customer, invoice.customer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, total, invoiceDate, terms, customer);
    }


    //    TODO: Generator equals and hash methods

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Invoice id: ").append(id).append(" Date: ").append(invoiceDate).append(" Total cost: ").append(total).append("\u20ac\n");
        sb.append("Customer: ").append(customer.toString()).append("\n");
        for (Item item : items) {
            sb.append(item.toString()).append("\n");
        }
        return sb.toString();
    }
}