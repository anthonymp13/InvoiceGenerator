<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="../template/head.jsp" />

<link rel="stylesheet" type="text/css" href="css/viewInvoice.css">
</head>
<body>

    <p class="browsehappy">You are using an <strxong>outdated</strxong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>


    <c:import url="../template/navbar.jsp"/>


    <div class="displayContainer">

    <div id="tables">
    <table class="table  table-bordered">
        <tablehead>
            <tr class="bg-primary">
                <th scope="col">Invoice #</th>
                <th scope="col">Date</th>
            </tr>
        </tablehead>
        <tbody>
        <tr>
            <td scope="row">${invoice.id}</td>
            <td>${invoice.invoiceDate}</td>
        </tr>
        </tbody>
    </table>

    <table class="table  table-bordered">
        <tablehead>
            <tr class="bg-primary">
                <th scope="col">Customer Id</th>
                <th scope="col">Terms</th>
            </tr>
        </tablehead>
        <tbody>
        <tr>
            <td scope="row">${invoice.customer.id}</td>
            <td>
                ${invoice.terms}
            </td>
        </tr>
        </tbody>
    </table>
</div>
    <p>Image place holder</p>
    <div class="companyInfo">
        <td>${company.companyId}</td>
        <td>${company.companyName}</td>
        <td>${company.phoneNumber}</td>
        <td>${company.address}</td>
    </div>

    <table id="billToTable" class="table  table-bordered" style="overflow-y:auto;">
        <tablehead>
            <tr class="bg-primary">
                <th colspan="4" scope="col">Bill To:</th>
            </tr>
        </tablehead>
            <tr>
                <td>${invoice.customer.firstName} ${invoice.customer.lastName}</td>
                <td>${invoice.customer.street}, ${invoice.customer.city}, ${invoice.customer.state} ${invoice.customer.postalcode}</td>
                <td>${invoice.customer.phoneNumber}</td>
                <td>${invoice.customer.email}</td>
            </tr>
    </table>

    <br/>
    <br/>
    <table class="table  table-bordered" id="table">
        <tr class="bg-primary">
            <th>Description</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Amount</th>
        </tr>

        <c:forEach var="item" items="${invoice.items}">
        <tr class="descriptionRow">
            <td>
                ${item.product.name}
            </td>
            <td>
                ${item.quantity}
            </td>
            <td>
                ${item.product.price}
            </td>
            <td>
                ${item.cost}
            </td>
        </tr>
        </c:forEach>
    </table>

    <h2>Total: ${invoice.total} (Taxes are calculated upon download of invoices)</h2>
    <a href="GenerateInvoice?invoiceId=${invoice.id}">Edit</a>
    <a href="DeleteInvoice?invoiceId=${invoice.id}">Delete</a>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    </div>


</body>
</html>


</body>
</html>