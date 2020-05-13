<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html>
<jsp:include page="/template/head.jsp" />
<link rel="stylesheet" type="text/css" href="/invoiceGenerator/css/dashboard.css">
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<jsp:include page="/template/navbar.jsp"/>

<div class="displayContainer" id="usersContainer">
    <form>
        <label for="userSearch">Users</label>
        <input type="text" id="userSearch" name="invoiceSearch">
        <input type="submit" value="Search">
    </form>
    <table class="table table-bordered">
        <tr>
            <th class="ch1">Name</th>
            <th>Privileges</th>
            <th class="ch3">Actions</th>
        </tr>

        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.firstName} ${user.lastName}</td>
                <c:forEach var="role" items="${user.roles}">
                    <td>${role.roleName}</td>
                </c:forEach>
                <td><a href="/invoiceGenerator/ViewEmployee?userId=${user.userId}">Edit</a></td>
            </tr>
        </c:forEach>

    </table>
</div>

<div class="displayContainer" id="invoicesContainer">
    <form>
        <label for="invoiceSearch">Invoices</label>
        <input type="text"  id="invoiceSearch" name="invoiceSearch">
        <input type="submit" value="Search">
    </form>
    <table class="table table-bordered">
        <tr>
            <th class="ch1">Name</th>
            <th>Invoice Date</th>
            <th class="ch3">Actions</th>
        </tr>
        <c:forEach var="invoice" items="${invoices}">
            <tr>
                <td>${invoice.customer.firstName} ${invoice.customer.lastName}</td>
                <td>${invoice.invoiceDate}</td>
                <td>
                    <a href="/basic/updateInvoice.jsp?invoiceId=${invoice.id}">Edit</a>
                    <p> | </p>
                    <a href="/Dashboard?invoiceId=${invoice.id}">Download</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/invoiceGenerator/GenerateInvoice">Add Invoice</a>
</div>

<div class="displayContainer" id="customerContainer">
    <form>
        <label for="customerSearch">Customers</label>
        <input type="text" id="customerSearch" name="customerSearch">
        <input type="submit" value="Search">
    </form>
    <table class="table table-bordered">
        <tr>
            <th class="ch1">Name</th>
            <th>Address</th>
            <th class="ch3">Actions</th>
        </tr>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.firstName}, ${customer.lastName}</td>
                <td>${customer.street}, ${customer.state} ${customer.postalcode}</td>
                <td>
                    <a href="/basic/updateCustomer.jsp?customerId=${customer.id}">Edit</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="newCustomer.jsp">Add Customer</a>
</div>
</body>
</html>