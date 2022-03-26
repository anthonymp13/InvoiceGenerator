<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 5/10/2020
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<c:import url="../template/head.jsp" />
<link rel="stylesheet" type="text/css" href="../css/user/viewEmployee.css">
</head>

<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<c:import url="../template/navbar.jsp"/>
</head>
<body>
<h1>Update Information:</h1>
<form method="POST" action="UpdatePrivileges">
    <input type="text" name="userId" value="${employee.userId}" display="hidden">
    <div class="form-group">
        <label for="userName">Username</label>
        <input type="text" class="form-control" placeholder="userName" value="${employee.userName}" id="userName" name="userName">
    </div>
    <div class="form-group">
        <label for="firstName">First Name</label>
        <input type="text" class="form-control" placeholder="First Name" value="${employee.firstName}" id="firstName" name="firstName">
    </div>
    <div class="form-group">
        <label for="lastName">Last Name</label>
        <input type="text" class="form-control" placeholder="Last Name" value="${employee.lastName}" id="lastName" name="lastName">
    </div>

    <select name="updateRole">
        <option value="basic">Basic</option>
        <option value="admin">Admin</option>
    </select>

    <button type="submit"  value="submit" class="btn btn-primary">Update</button>
    <button type="submit" value="delete" class="btn btn-secondary">Delete</button>
</form>

</body>
</html>
