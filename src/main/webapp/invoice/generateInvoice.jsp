<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="../template/head.jsp" />
<link rel="stylesheet" type="text/css" href="css/invoice/generateInvoice.css">
<%--<link rel="stylesheet" type="text/css" href="css/invoice/viewInvoice.css">--%>

</head>
<body>
    <c:import url="../template/navbar.jsp"/>

    <script type="text/javascript" src="/invoiceGenerator/js/test.js"></script>
    <script type="text/javascript" src="/invoiceGenerator/js/generateInvoice.js"></script>


    <main class="displayContainer">
    <h1>Generate invoice</h1>




    <div class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Product/Service</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="input">
                        <label for="quantity">Quantity</label>
                        <input type="number" id="quantity" class="quantity" name="quantity" required>
                    </div>
                    <div class="input">
                        <label for="unitPrice">Unit Price</label>
                        <input type="number" id="unitPrice" class="unitPrice" name="unitPrice" required>
                    </div>
                    <div class="input">
                        <label id="descriptionLabel" for="description">Description</label>
                        <textarea type="text" id="description" placeholder="Description" class="description" name="description" required></textarea>

                    </div>
                    <p class="amount">Amount:</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="remove" class="btn btn-danger">Remove</button>
                    <button type="button" id="saveChanges" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>

    <form action="GenerateInvoice" method="POST"  id="invoiceForm">
        <div class="input">
            <label for="customerSelectBox">Customer (Required)</label>
            <select form="invoiceForm" name="customerSelectBox" id="customerSelectBox">
                <c:if test="${customer != null}">
                    <option value="${customer.id}" selected>${customer.firstName} ${customer.lastName}</option>
                    <c:forEach var="customer" items="${company.customers}">
                        <option value="${customer.id}">${customer.firstName} ${customer.lastName}</option>
                    </c:forEach>
                </c:if>
                <c:if test="${customer == null}">
                    <c:forEach var="customer" items="${company.customers}">
                        <option value="${customer.id}">${customer.firstName} ${customer.lastName}</option>
                    </c:forEach>
                </c:if>
            </select>
        </div>
        <div class="input">
            <label for="terms">Terms</label>
            <select id="terms" name="termList" form="invoiceForm">
                <option value="No Terms Set">(No terms set)</option>
                <option value="Due upon completion">Payment in advance</option>
                <option value="Due upon completion">Immediate payment</option>
            </select>
        </div>


<%--        <table id="items">--%>
<%--            <tr>--%>
<%--                <th>Description</th>--%>
<%--                <th>Quantity</th>--%>
<%--                <th>Price</th>--%>
<%--            </tr>--%>
<%--            <tr class="product">--%>
<%--                <td class="description">Remove multiple trees</td>--%>
<%--                <td class="quantity">1</td>--%>
<%--                <td class="price">18000</td>--%>
<%--            </tr>--%>
<%--            <tr class="product">--%>
<%--                <td class="description">Remove multiple trees</td>--%>
<%--                <td class="quantity">1</td>--%>
<%--                <td class="price">18000</td>--%>
<%--            </tr>--%>
<%--            <tr class="product">--%>
<%--                <td class="description">Remove multiple trees</td>--%>
<%--                <td class="quantity">1</td>--%>
<%--                <td class="price">18000</td>--%>
<%--            </tr>--%>
<%--            <tr class="product">--%>
<%--                <td class="description">Remove multiple trees</td>--%>
<%--                <td class="quantity">1</td>--%>
<%--                <td class="price">18000</td>--%>
<%--            </tr>--%>

<%--        </table>--%>

                <table  id="items">
                    <tr>
                        <th>Description</th>
                        <th>Qty</th>
                        <th>Unit Price</th>
                    </tr>

<%--                    <tr class="product">--%>
<%--                        <td class="description">--%>
<%--                            <label for="description">Description</label>--%>
<%--                            <input type="text" class="addedDescription"  name="description">--%>
<%--                        </td>--%>
<%--                        <td class="quantity">--%>
<%--                            <label for="quantity">Quantity</label>--%>
<%--                            <input type="text" class="addedQuantity"  name="quantity">--%>
<%--                        </td>--%>
<%--                        <td class="unitPrice">--%>
<%--                            <label for="unitPrice">Unit Price</label>--%>
<%--                            <input type="text" class="addedUnitPrice"  name="unitPrice">--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <a href="#" class="delete">Delete</a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
            </table>

<%--        <a href="#" class="delete">Delete</a>--%>

<%--        <input type="submit" id="submit" value="Submit"/>--%>
    </form>

    <button type="button" class="btn btn-primary add_form_field"  data-toggle="modal" data-target=".modal">Add product&nbsp; <span style="font-size:16px; font-weight:bold;">+ </span></button>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


</main>
<%--        <table class="table  table-bordered" id="table">--%>
<%--            <tr class="bg-primary">--%>
<%--                <th>Description</th>--%>
<%--                <th>Qty</th>--%>
<%--                <th>Unit Price</th>--%>
<%--                <th>Amount</th>--%>
<%--                <th>Remove row</th>--%>
<%--            </tr>--%>

<%--            <tr class="descriptionRow">--%>
<%--                <td><label for="description">Description</label>--%>
<%--                    <input type="text" id="description" class="description" name="description"></td>--%>
<%--                <td>--%>
<%--                    <label for="quantity">Quantity</label>--%>
<%--                    <input type="text" id="quantity" class="quantity" name="quantity">--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <label for="unitPrice">Unit Price</label>--%>
<%--                    <input type="text" id="unitPrice" class="unitPrice" name="unitPrice">--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <p class="amount"></p>--%>
<%--                </td>--%>

<%--                <td><a href="#" class="delete">Delete</a></td>--%>
<%--            </tr>--%>
<%--        </table>--%>




</body>
</html>
