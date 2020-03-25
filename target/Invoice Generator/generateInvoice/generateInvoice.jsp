<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/generateInvoice.css">
    <script type="text/javascript" src="generateInvoice.js"> </script>
</head>

<body>



<h1>Invoice Generator</h1>
<p>Select a customer</p>W

<table id="billToTable" class="table  table-bordered" style="overflow-y:auto;">
    <tablehead>
        <tr class="bg-primary">
            <th colspan="4" scope="col">Bill To:</th>
        </tr>
    </tablehead>
    <tbody>
    <c:forEach var="customer" items="${company.customers}">
        <tr>
            <td>${customer.firstName} ${customer.lastName}</td>
            <td>${customer.phoneNumber}</td>
            <td>${customer.street}, ${customer.city}, ${customer.state} ${customer.postalcode}</td>
            <td><a href="generateInvoice/addItems.jsp?id=${customer.id}">Select customer</a></td>
        </tr>
    </c:forEach>
    1        </tbody>
</table>

</body>
</html>