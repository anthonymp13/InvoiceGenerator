<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/30/2020
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<jsp:include page="/template/head.jsp" />

<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<jsp:include page="/template/navbar.jsp"/>

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
