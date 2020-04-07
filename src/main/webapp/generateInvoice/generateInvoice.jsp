<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/generateInvoice.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="../js/generateInvoice.js"> </script>

</head>

<body>


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
            <td>2/28/2020</td>
        </tr>
        </tbody>

    </table>
    <form method="POST" action="GenerateInvoice" id="invoiceForm">
        <table class="table  table-bordered">
            <tablehead>
                <tr class="bg-primary">
                    <th scope="col">Customer Id</th>
                    <th scope="col"><label for="terms">Terms</label></th>
                </tr>
            </tablehead>
            <tbody>
            <tr>
                <td scope="row">1</td>
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
    </form>
</div>

<p>Image place holder</p>

<form action="GenerateInvoice" method="POST">
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
    <select id="customerSelectBox">
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

        <tr class="descriptionRow">
            <td><label for="description">Description</label>
                <input type="text" id="description" class="description" name="description"></td>
            <td>
                <label for="quantity">Quantity</label>
                <input type="text" id="quantity" class="quantity" name="quantity">
            </td>
            <td>
                <label for="unitPrice">Unit Price</label>
                <input type="text" id="unitPrice" class="unitPrice" name="unitPrice">
            </td>
            <td>
                <p class="amount"></p>
            </td>
            <td><a href="#" class="delete">Delete</a></td>
        </tr>
    </table>

</form>

<button class="add_form_field">Add New Field &nbsp; <span style="font-size:16px; font-weight:bold;">+ </span></button>
<button id="submit">Submit</button>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</form>

</body>
</html>
