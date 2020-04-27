<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/30/2020
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="title" value="Update Privileges" />
<%@include file="/template/head.jsp"%>
<body>

<h1>Update Employee Privileges</h1>
<h2>Employee information:</h2>
<p>Employee Name: ${employee.firstName} ${employee.lastName}</p>
<p>Current Role: ${role.roleName}</p>

<form action="/invoiceGenerator/UpdatePrivileges">
    <select name="updateRole">
        <option value="basic">Basic</option>
        <option value="admin">Admin</option>
    </select>
    <button type="submit" name="Update" value="Update" class="btn btn-primary">Update</button>
</form>

</body>
</html>
