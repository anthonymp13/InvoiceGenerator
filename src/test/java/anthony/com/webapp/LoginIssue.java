package anthony.com.webapp;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.Before;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Disabled;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.safari.SafariDriver;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.LoadableComponent;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.time.Duration;

import static org.testng.AssertJUnit.assertTrue;

public class LoginIssue extends LoadableComponent<LoginIssue> {


    private final WebDriver driver;
    @FindBy(name="j_username") private WebElement userName;
    @FindBy(name="j_password") private WebElement password;
    private WebElement login;

    public LoginIssue(WebDriver driver) {
        this.driver = driver;

        PageFactory.initElements(driver, this);
    }

    @Override
    protected void load() {
        driver.get("http://localhost:8080/invoiceGenerator/Dashboard");

    }

    @Override
    protected void isLoaded() throws Error {

        String url = driver.getCurrentUrl();
        assertTrue("not on the login page: " + url, url.endsWith("/Dashboard"));

    }

    public void setUserName(String loginUserName) {
        clearAndType(userName, loginUserName);

    }

    public void setPassword(String loginPassword) {
        clearAndType(password, loginPassword);
    }


    public LoginIssue login() {
        login.click();
        return new LoginIssue(driver);
    }


    private void clearAndType(WebElement field, String text) {
        field.clear();
        field.sendKeys(text);
    }

    @Test
    private void runTest() {
        LoginIssue page = new LoginIssue(driver).get();
        page.setUserName("anthonyp");
        page.setPassword("giggity");
        page.login();

    }


//    public void login() {
//        WebDriverManager.firefoxdriver().setup();
//        FirefoxOptions options = new FirefoxOptions();
//        WebDriver driver = new FirefoxDriver(options);
//
//        driver.get("http://localhost:8080/invoiceGenerator/Dashboard");
//        driver.manage().timeouts().implicitlyWait(Duration.ofMillis(500));
//
//
//
//        WebElement userName = driver.findElement(By.name("j_username"));
//        WebElement password = driver.findElement(By.name("j_password"));
//        WebElement login = driver.findElement(By.name("login"));
//
//        userName.sendKeys("anthonyp");
//        password.sendKeys("giggity");
//        login.click();
//
//        String expectedUrl = "http://localhost:8080/invoiceGenerator/Dashboard";
//        String actualUrl  = driver.getCurrentUrl();
//
//        Assert.assertEquals(expectedUrl, actualUrl);
//
//        driver.quit();
//    }






}