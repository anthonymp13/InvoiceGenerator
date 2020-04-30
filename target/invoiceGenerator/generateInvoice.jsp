<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
        <jsp:include page="/css/generateInvoice.css"/>
        <script type="text/javascript" src="generateInvoice.js"> </script>
        <link rel="stylesheet" type="text/css" href="/css/generateInvoice.css">
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

    <table class="table  table-bordered">
        <tablehead>
            <tr class="bg-primary">
                <th scope="col">Customer Id</th>
                <th scope="col">Terms</th>
            </tr>
        </tablehead>
        <tbody>
        <tr>
            <td scope="row">1</td>
            <td>Due Upon Receipt</td>
        </tr>
        </tbody>

    </table>
</div>

<p>Image place holder</p>



<form action="/java/GenerateInvoice" method="POST">


    <div class="companyInfo">
        <p>${company.companyName}</p>
        <p>${company.address}</p>
        <p>${company.city}, ${company.state} ${company.zip}</p>
        <p>${company.phoneNumber}</p>
    </div>

    <div style="overflow-x: auto;" id="customerContainer">
    <table id="billToTable" class="table  table-bordered" style="overflow-y:auto;">
        <tablehead>
            <tr class="bg-primary">
                <th colspan="3" scope="col">Bill To:</th>
            </tr>
        </tablehead>
        <tbody>
        <c:forEach var="customer" items="${company.customers}">
            <tr>
                <td>${customer.firstName} ${customer.lastName}</td>
                <td>${customer.phoneNumber}</td>
                <td>${customer.street}, ${customer.city}, ${customer.state} ${customer.zipcode}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    <br/>
    <br/>
    <table id="table">
        <tr>
            <th>Description</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Amount</th>
        </tr>
        <tr>
            <td>
                <label for="description1">Description</label>
                <input type="text" id="description1">
            </td>
            <td>
                <label for="quantity1">Quantity</label>
                <input type="text" id="quantity1">
            </td>
            <td>
                <label for="unitPrice1">Unit Price</label>
                <input type="text" id="unitPrice1">
            </td>
            <td>
                <p id="amount1"></p>
            </td>
        </tr>

    </table>
    <button type="button" id="addRow">Add Row </button>
    <input type="submit" value="Submit">
</form>

</body>
</html>
