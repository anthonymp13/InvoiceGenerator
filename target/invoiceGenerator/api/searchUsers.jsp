<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/24/2020
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Users</title>
</head>
<body>
    <form action="../services/users/get" method="post">
        Enter Name:<input type="text" name="userName"/><br/><br/>
        <input type="submit" value="Search User"/>
    </form>
</body>
</html>
