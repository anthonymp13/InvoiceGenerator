## Anthony Poleski Individual Project

Anthony Poleski's Individual Project for Enterprise Java

### Problem Statement:

My goal is to allow for small businesses, specifically in the tree care industry to 
send invoices from an online application, to save time, money, and effort. This application
will also allow for easier analytics and file management.

### Project Technologies/Techniques 

* Security/Authentication
  * Tomcat's JDBC Realm Authentication
  * Admin role: create/read/update/delete (crud) of all data
  * User role: create invoice, edit data they have entered previously, delete invoice
* Database
  * MySQL
  * Store users and roles
  * Store all data for the invoice
* ORM Framework
  * Hibernate 5
* Dependency Management
  * Maven
* CSS 
  * Bootstrap
* Data Validation
  * Bootstrap Validator for front end
* Logging
  * Configurable logging using Log4J2. In production, only errors will normally be logged, but logging at a debug level can be turned on to facilitate trouble-shooting. 
* Hosting
  * AWS
* Independent Research Topic/s
  * iText
  * PdfBox
* Project Lombok to eliminate boilerplate code like getters/setters/equals
* Unit Testing
  * JUnit tests to achieve 80%+ code coverage 
* IDE: IntelliJ IDEA


### Design

* [User Stories](DesignDocuments/userStories.md)"
