<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@include file="/template/head.jsp"%>
<html>
<body>
<%--TODO: pull company name from databases and display in h2--%>
<h2>Welcome to the Invoice Generator</h2>
<a href="search.jsp">Click here to get to admin page</a>
<a href="CreateUser.jsp">Create user</a>

<form action="ChooseCustomer">
    <button type="submit">Start Generate Invoice Process</button>
</form>
</body>
</html>