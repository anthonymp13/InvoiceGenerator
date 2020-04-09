/*
 * Part of a set of classes based on a sample database.
 * This example was written by Bruno Lowagie in the context of a book.
 * See http://developers.itextpdf.com/content/zugferd-future-invoicing/3-simple-invoice-database
 */
package anthony.com.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Objects;

/**
 * Plain Old Java Object containing info about an Item.
 *
 * @author Bruno Lowagie (iText Software)
 */
@Entity(name="Item")
@Table(name="item")
public class Item {

    /** The item. */
    /** The id. */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name="native", strategy = "native")
    @Column(name = "id")
    private int item;

    /** The product. */
    @ManyToOne
    @JoinColumn(name = "productId", referencedColumnName = "id")
    private Product product;

    /** The quantity. */
    private int quantity;

    private double cost;

    /** The product. */
    @ManyToOne
    @JoinColumn(name = "invoiceId", referencedColumnName = "id")
    private Invoice invoice;


    /**
     * Instantiates a new Item.
     */
    public Item() {
    }

    /**
     * Instantiates a new Item.
     *
     * @param item     the item
     * @param product  the product
     * @param quantity the quantity
     * @param invoice  the invoice
     */
    public Item(int item, Product product, int quantity, double cost, Invoice invoice) {
        this.item = item;
        this.product = product;
        this.quantity = quantity;
        this.cost = cost;
        this.invoice = invoice;
    }

    /**
     * Gets the item.
     *
     * @return the item
     */
    public int getItem() {
        return item;
    }

    /**
     * Sets the item.
     *
     * @param item the new item
     */
    public void setItem(int item) {
        this.item = item;
    }

    /**
     * Gets the product.
     *
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * Sets the product.
     *
     * @param product the new product
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    /**
     * Gets invoice.
     *
     * @return the invoice
     */
    public Invoice getInvoice() {
        return invoice;
    }

    /**
     * Sets invoice.
     *
     * @param invoice the invoice
     */
    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

    /**
     * Gets the quantity.
     *
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * Sets the quantity.
     *
     * @param quantity the new quantity
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Item item1 = (Item) o;
        return item == item1.item &&
                quantity == item1.quantity &&
                cost == item1.cost &&
                Objects.equals(product, item1.product) &&
                Objects.equals(invoice, item1.invoice);
    }

    @Override
    public int hashCode() {
        return Objects.hash(item, product, quantity, cost, invoice);
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("  #").append(item);
        sb.append(product.toString());
        sb.append("\tQuantity: ").append(quantity);
        sb.append("\tCost: ").append(cost).append("\u20ac");
        return sb.toString();
    }
}