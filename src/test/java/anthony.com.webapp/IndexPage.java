package anthony.com.webapp;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.LoadableComponent;

import static org.testng.AssertJUnit.assertTrue;


/**
 * This class is responsible for the testing of the index page.
 */
public class IndexPage extends LoadableComponent<IndexPage> {

    private final WebDriver driver;

    public IndexPage(WebDriver driver) {
        this.driver = driver;
    }

    @Override
    protected void load() {
        driver.get("http://localhost:8080/invoiceGenerator/");

    }

    @Override
    protected void isLoaded() throws Error {
        String url = driver.getCurrentUrl();
        assertTrue(url.contains("invoiceGenerator"));
    }
}
