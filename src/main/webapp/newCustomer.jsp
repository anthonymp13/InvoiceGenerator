<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="/template/head.jsp" />
<title></title>
<link rel="stylesheet" type="text/css" href="/invoiceGenerator/css/newCustomer.css">
</head>
<body>
<jsp:include page="/template/navbar.jsp"/>

<p>New Customer:</p>

<form action="CreateCustomer">

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

</body>
</html>
