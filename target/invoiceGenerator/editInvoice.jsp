<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="template/head.jsp" />
<title>Edit Invoice ${invoice.id}</title>
<link rel="stylesheet" type="text/css" href="/invoiceGenerator/css/generateInvoice.css">
</head>
<body>
<c:import url="template/navbar.jsp"/>
<script src="/invoiceGenerator/js/generateInvoice.jsp"></script>
<h1>Invoice Generator</h1>
<p>Welcome to the Invoice Generator</p>

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
            <td scope="row">1</td>
            <td>${invoice.invoiceDate}</td>
        </tr>
        </tbody>
    </table>

    <table class="table  table-bordered">
        <tablehead>
            <tr class="bg-primary">
                <th scope="col">Customer Id</th>
                <th scope="col"><label for="terms">Terms</label></th>
            </tr>
        </tablehead>
        <tbody>
        <tr>
            <td scope="row">${invoice.id}</td>
            <td>
                <select id="terms" name="termList" form="invoiceForm">

                    <option value="Terms of Sale">Terms of Sale</option>
                    <option value="Due upon completion">Payment in Advance</option>
                    <option value="Due upon completion">Immediate Payment</option>
                    <%--                    TODO: Add more options button... and/or custom option input--%>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<form method="POST" action="UpdateInvoice" id="invoiceForm">
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
    </table>
    <select form="invoiceForm" name="customerSelectBox" id="customerSelectBox">
        <c:forEach var="customer" items="${company.customers}">
            <option value="${customer.id}">
                    ${customer.firstName} ${customer.lastName},
                Address: ${customer.street}, ${customer.city}, ${customer.state} ${customer.postalcode}
            </option>
        </c:forEach>
    </select>

    <br/>
    <br/>
    <table class="table  table-bordered" id="table">
        <tr class="bg-primary">
            <th>Description</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Amount</th>
            <th>Remove row</th>
        </tr>

    <c:forEach var="item" items="${invoice.items}">
        <tr class="descriptionRow">
            <td><label for="description">Description</label>
                <input type="text" id="description" value="
                ${item.product.name}" class="description" name="description"></td>
            <td>
                <label for="quantity">Quantity</label>
                <input type="text" value="${item.quantity}" id="quantity" class="quantity" name="quantity">
            </td>
            <td>
                <label for="unitPrice">Unit Price</label>
                <input type="text" value="${item.product.price}" id="unitPrice" class="unitPrice" name="unitPrice">
            </td>
            <td>
                <p class="amount"></p>
            </td>
            <td><a href="#" class="delete">Delete</a></td>
        </tr>
    </c:forEach>
    </table>
    <input type="submit" id="submit" value="Submit"/>
</form>

<button class="add_form_field">Add New Field &nbsp; <span style="font-size:16px; font-weight:bold;">+ </span></button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</form>

</body>
</html>
