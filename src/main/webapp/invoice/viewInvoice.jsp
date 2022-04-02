<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="../template/head.jsp" />

<link rel="stylesheet" type="text/css" href="css/invoice/viewInvoice.css">
</head>
<body>

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
                <fmt:formatNumber var="quantity" value="${item.quantity}" pattern="####"/>
                ${quantity}
            </td>
            <td>
                <fmt:formatNumber var="price" value="${item.product.price}" pattern="####"/>
                ${price}
            </td>
            <td>
                <fmt:formatNumber var="cost" value="${item.cost}" pattern="####"/>
                ${cost}
            </td>
        </tr>
        </c:forEach>
    </table>

    <h2>Total: ${invoice.total} (Taxes are calculated upon download of invoices)</h2>
    <a href="UpdateInvoice?invoiceId=${invoice.id}">Edit</a>
    <a href="DeleteInvoice?invoiceId=${invoice.id}">Delete</a>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    </div>

</body>
</html>