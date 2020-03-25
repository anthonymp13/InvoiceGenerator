
<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/24/2020
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body><%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/generateInvoice.css">
    <script type="text/javascript" src="generateInvoice.js"> </script>
</head>

<body>



<h1>Invoice Generator</h1>
<p>Select a customer</p>

<form id="invoiceForm">
    <select name="customers">
        <c:forEach var="customer" items="${company.customers}">
            <option value="${customer.id}">
                    ${customer.firstName} ${customer.lastName},
                    Address: ${customer.street}, ${customer.city}, ${customer.state} ${customer.postalcode}
            </option>
        </c:forEach>
    </select>


    <button type="button" id="addRow">Add Row </button>
    <button type="button" id="confirm">Confirms</button>
    <input type="submit" value="Submit">
</form>


</body>
</html>




