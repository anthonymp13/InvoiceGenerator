<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="../template/head.jsp" />
<title>New Customer | InvoiceGenerator</title>
<link rel="stylesheet" type="text/css" href="../css/customer/newCustomer.css">
</head>
<body>
<c:import url="../template/navbar.jsp"/>

<c:if test="${insertStatus == true}">
<div class="alert alert-success" role="alert">
    Yay! ${customer.firstName} ${customer.lastName} was successfully created. Want to create an invoice for them?
    <a style="text-decoration: underline" href="GenerateInvoice?customerId=${customer.id}">Click here!</a>
</div>
</c:if>
<c:if test="${insertStatus == false}">
    <div class="alert alert-danger" role="alert">
        Oh no! The customer was unable to be created.
    </div>
</c:if>

<h1>New Customer:</h1>

<form action="CreateCustomer" method="POST">
    <div class="form-group">
        <label for="firstName">First Name</label>
        <input type="text" required="required"  class="form-control" placeholder="First name" id="firstName" name="firstName">
    </div>
    <div class="form-group">
        <label for="lastName">Last Name</label>
        <input type="text" required="required" class="form-control" placeholder="Last name" id="lastName" name="lastName">
    </div>
    <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" required="required" class="form-control" placeholder="Email" id="email" name="email">
    </div>
    <div class="form-group">
        <label for="address">Street Address</label>
        <input type="text" required="required" class="form-control" placeholder="Street Address" id="address" name="address">
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <input type="text" required="required" class="form-control" placeholder="City" id="city" name="city">
    </div>
    <div class="form-group">
        <label for="state">State</label>
        <input type="text" required="required" class="form-control" placeholder="State" id="state" name="state">
    </div>
    <div class="form-group">
        <label for="zipcode">Postal code</label>
        <input type="text" required="required" class="form-control" placeholder="Postal code" id="zipcode" name="zipcode">
    </div>
    <div class="form-group">
        <label for="phoneNumber">Phone Number</label>
        <input type="text" required="required"  class="form-control" placeholder="Phone Number" id="phoneNumber" name="phoneNumber">
    </div>

    <button type="submit"  value="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-secondary">Reset</button>
</form>

<c:import url="../template/footer.jsp"/>
