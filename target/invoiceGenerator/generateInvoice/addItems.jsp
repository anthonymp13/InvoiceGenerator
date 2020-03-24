<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/20/2020
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Items</title>
</head>
<body>

<table>
    <form action="invoiceGenerator/AddItem">
    <table class="table  table-bordered" id="table">
        <tr class="bg-primary">
            <th>Description</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Amount</th>
            <th>Remove row</th>
        </tr>
        <tr class="descriptionRow">

            <td>
                <label for="description">Description</label>
                <input type="text" id="description">
            </td>
            <td>
                <label for="quantity">Quantity</label>
                <input type="text" id="quantity">
            </td>
            <td>
                <label for="unitPrice">Unit Price</label>
                <input type="text" id="unitPrice">
            </td>
            <td>
                <p id="amount1"></p>
            </td>
        </tr>



    </table>
        <button type="submit">Add row</button>
    </form>
</table>

</body>
</html>
