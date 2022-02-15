<%--
  Created by IntelliJ IDEA.
  User: apoleski
  Date: 2/14/22
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
<c:import url="template/head.jsp" />

<link rel="stylesheet" type="text/css" href="css/about.css">
</head>
<head>
    <title>About us:</title>
</head>
<body>

<c:import url="template/navbar.jsp"/>


<div class="jumbotron jumbotron-fluid" id="invoiceJumbotron">
    <div class="container" id="invoiceDescription">
        <h1><span>Free</span> Invoices</h1>
        <p>The invoice generator is an easy and free way to generate invoices for your company. Employees will be able to use this application to store data about customers. Then store and generate invoices for those customers.</p>
        <a href="GenerateInvoice" class="btn btn-outline-primary">Generate Invoice</a>
    </div>

</div>

<c:import url="template/footer.jsp"/>


</body>
</html>
