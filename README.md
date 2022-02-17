## Anthony Poleski Individual Project

Individual Project for Enterprise Java

### Problem Statement:

A problem that small businesses face is expensive accounting software that is complex and has extra functionality that 
you pay for, but may never use or understand. My goal is to create a simpler application that is free for any number of 
users to use. This will allow for businesses to put more time and resources into their mission. 

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
* Unit Testing
  * JUnit tests to achieve 80%+ code coverage 
* IDE: IntelliJ IDEA


### Design

* [User Stories](DesignDocuments/userStories.md)"
