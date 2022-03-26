<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 2/26/2020
  Time: 3:31 PM
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../template/head.jsp"%>
<html>
<body>
<h2>Customers</h2>
<table id="companiesTable" class="display" cellspacing="0" width="100%">
        <thead>
        <th>Customer Id</th>
        <th>Customer Name</th>
        <th>Customer phone number</th>
        <th>Customer Address</th>
        <th>Select Customer</th>
        </thead>
        <c:forEach var="customer" items="${company.customers}">
        <tr>
            <td>${customer.customerId}</td>
            <td>${customer.firstName} ${customer.lastName}</td>
            <td>${customer.phoneNumber}</td>
            <td>${customer.address}, ${customer.city}, ${customer.state} ${customer.zipcode}</td>
            <td><a href="addItem.jsp?id=${customer.customerId}">Select customer</a></td>
        </tr>
        </c:forEach>
</table>

</body>
</html>
