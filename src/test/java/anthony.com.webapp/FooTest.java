package anthony.com.webapp;



import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

public class FooTest {
    private InvoiceIssue invoiceIssue;

    @BeforeTest
    public void prepareComponents() {
        WebDriverManager.firefoxdriver().setup();
        FirefoxOptions options = new FirefoxOptions();
        WebDriver driver = new FirefoxDriver(options);

        IndexPage indexPage = new IndexPage(driver);
        LoginIssue login = new LoginIssue(driver, indexPage, "anthonyp", "giggity");

        invoiceIssue = new InvoiceIssue(driver, login);

        //        invoiceIssue = new InvoiceIssue(driver, login, "Immediate Payment", "Tim", "One", "5", "1");
//        invoiceIssue = new InvoiceIssue(driver, login);
    }

    @Test
    public void createInvoiceTest() {
        invoiceIssue.get();

        invoiceIssue.setTerms("Due upon completion");
        invoiceIssue.setCustomer("1");
        invoiceIssue.setDescription("Remove oak tree");
        invoiceIssue.setQuantity("5");
        invoiceIssue.setUnitPrice("1500");


    }
}
