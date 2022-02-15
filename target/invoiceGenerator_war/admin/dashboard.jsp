<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<c:import url="../template/head.jsp" />
<link rel="stylesheet" type="text/css" href="/invoiceGenerator/css/dashboard.css">
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<c:import url="../template/navbar.jsp"/>


<%-- TODO: add deleted customer confirmation--%>
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
                <td>
                    <a href="/invoiceGenerator/EditEmployee?userId=${user.userId}">Edit</a>
                    <a href="/invoiceGenerator/DeleteUser?userId=${user.userId}">Delete</a>
                </td>
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
                    <a href="updateInvoice?invoiceId=${invoice.id}">Edit</a>
                    <a href="ViewInvoice?invoiceId=${invoice.id}">View</a>
                    <a href="DeleteInvoice?invoiceId=${invoice.id}">Delete</a>

                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="GenerateInvoice">Add Invoice</a>
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
                <td>${customer.firstName} ${customer.lastName}</td>
                <td>${customer.street} ${customer.city}, ${customer.state} ${customer.postalcode}</td>
                <td>
                    <a href="updateCustomer?customerId=${customer.id}">Edit</a>
                    <a href="DeleteCustomer?customerId=${customer.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="newCustomer.jsp">Add Customer</a>
</div>
</body>
</html>