package anthony.com.webapp;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;;
import org.openqa.selenium.WebElement;;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.LoadableComponent;
import org.openqa.selenium.support.ui.Select;

import static org.testng.AssertJUnit.assertTrue;

public class InvoiceIssue extends LoadableComponent<InvoiceIssue> {


    private final WebDriver driver;
    private final LoadableComponent<?> parent;
    private Select terms;
    private Select customer;
    private WebElement description;
    private WebElement unitPrice;
    private WebElement quantity;
    private WebElement submit;

//    private final String termsText;
//    private final String customerText;
//    private final String descriptionText;
//    private final String unitPriceText;
//    private final String quantityText;


//    public InvoiceIssue(WebDriver driver, LoadableComponent<?> parent, String terms, String customer, String description, String unitPrice, String quantity) {
//        this.driver = driver;
//        this.parent = parent;
//        termsText = terms;
//        customerText = customer;
//        descriptionText = description;
//        unitPriceText = unitPrice;
//        quantityText = quantity;
//
//
//        PageFactory.initElements(driver, this);
//    }
//


    public InvoiceIssue(WebDriver driver, LoadableComponent<?> parent) {
        this.driver = driver;
        this.parent = parent;

        PageFactory.initElements(driver, this);
    }



    @Override
    protected void load() {
        parent.get();
        String originalUrl = driver.getCurrentUrl();

        driver.get("http://localhost:8080/invoiceGenerator/GenerateInvoice");
        terms = new Select(driver.findElement(By.id("terms")));
        customer = new Select(driver.findElement(By.id("customerSelectBox")));
    }

    @Override
    protected void isLoaded() {
        String url = driver.getCurrentUrl();
        assertTrue("Not on the issue entry page: " + url, url.endsWith("/GenerateInvoice"));
        assertTrue(description, )


    }

    public void setTerms(String terms) {
        this.terms.selectByValue(terms);

    }


    public void setCustomer(String customer) {

        this.customer.selectByValue(customer);
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


    public InvoiceIssue submit() {
        submit.click();
        return new InvoiceIssue(driver, parent);
    }

    private void clearAndType(WebElement field, String text) {
        field.clear();
        field.sendKeys(text);
    }

}
