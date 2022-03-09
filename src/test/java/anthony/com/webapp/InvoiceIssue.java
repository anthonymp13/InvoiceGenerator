package anthony.com.webapp;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.LoadableComponent;

import static org.testng.AssertJUnit.assertTrue;

public class InvoiceIssue extends LoadableComponent<InvoiceIssue> {


    private final WebDriver driver;
    private WebElement terms;
    @FindBy(name="customerSelectBox") private WebElement customer;
    private WebElement description;
    private WebElement unitPrice;
    private WebElement quantity;

    public InvoiceIssue(WebDriver driver) {
        this.driver = driver;

        PageFactory.initElements(driver, this);
    }


    @Override
    protected void load() {

        driver.get("http://localhost:8080/invoiceGenerator/GenerateInvoice");

    }

    @Override
    protected void isLoaded() {
        String url = driver.getCurrentUrl();
        assertTrue("Not on the issue entry page: " + url, url.endsWith("/GenerateInvoice"));

    }

    public void setTerms(String terms) {
        clearAndType(this.terms, terms);
    }


    public void setCustomer(String customer) {
        clearAndType(this.customer, customer);
    }


    public void setDescription(String description) {
        clearAndType(this.description, description);
    }


    public void setUnitPrice(String unitPrice) {
        clearAndType(this.unitPrice, unitPrice);
    }

    public void setQuantity(String quantity) {
        clearAndType(this.quantity, quantity);
    }

    private void clearAndType(WebElement field, String text) {
        field.clear();
        field.sendKeys(text);
    }

}
