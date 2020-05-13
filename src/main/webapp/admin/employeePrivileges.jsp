<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/27/2020
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="title" value="Search Results" />
<c:import url="../template/head.jsp" />
<html>
<body>
<%--TODO: pull company name from databases and display in h2--%>
<h2>Company User Search</h2>
<a href = "SearchUser">Go to the User Search</a>

<div class="container-fluid">
    <h2>Employees Results</h2>
    <table>
        <thead>
        <td>Username</td>
        <td>First Name</td>
        <td>Last Name</td>
        <td>Role</td>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.userName}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td><a href="/invoiceGenerator/admin/updatePrivileges.jsp?userName=${employee.userName}">Update privileges</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>

