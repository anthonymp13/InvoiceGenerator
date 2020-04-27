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
 * Plain Old Java Object containing info about a Product.
 *
 * @author Bruno Lowagie (iText Software)
 */
@Entity(name="Product")
@Table(name="product")
public class Product {

    /** The id. */
    /**
     * The id.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name="native", strategy = "native")
    @Column(name = "id")
    private int id;

    /**
     * The name.
     */
    @Column(name = "name")
    private String name;

    /**
     * The price.
     */
    @Column(name = "price")
    private double price;

    /**
     * The vat.
     */
    @Column(name = "vat")
    private double vat;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<Item> items = new HashSet<>();

    /**
     * Instantiates a new Product.
     *
     * @param name  the name
     * @param price the price
     * @param vat   the vat
     */
    public Product(String name, double price, double vat) {
        this.name = name;
        this.price = price;
        this.vat = vat;
    }

    /**
     * Instantiates a new Product.
     */
    public Product() {
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
     * Gets the name.
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name.
     *
     * @param name the new name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the price.
     *
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * Sets the price.
     *
     * @param price the new price
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * Gets the vat.
     *
     * @return the vat
     */
    public double getVat() {
        return vat;
    }

    /**
     * Sets the vat.
     *
     * @param vat the new vat
     */
    public void setVat(double vat) {
        this.vat = vat;
    }

    /**
     * Add item.
     *
     * @param item the item
     */
    public void addItem(Item item) {
        items.add(item);
        item.setProduct(this);

    }

    /**
     * Remove item.
     *
     * @param item the item
     */
    public void removeItem(Item item) {
        items.remove(item);
        item.setProduct(null);

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id == product.id &&
                Double.compare(product.price, price) == 0 &&
                Double.compare(product.vat, vat) == 0 &&
                Objects.equals(name, product.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, price, vat);
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("\t(").append(id).append(")\t").append(name).append("\t").append(price).append("\u20ac\tvat ").append(vat).append("%");
        return sb.toString();
    }
}