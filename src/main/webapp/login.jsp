<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/5/2020
  Time: 10:58 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<FORM ACTION="j_security_check" METHOD="POST">
    <TABLE>
        <TR><TD>User name: <INPUT TYPE="TEXT" NAME="j_username">
        <TR><TD>Password: <INPUT TYPE="PASSWORD" NAME="j_password">
        <TR><TH><INPUT TYPE="SUBMIT" VALUE="Log In">
    </TABLE>
</FORM>

<%--TODO: Add forgot username and/or password button--%>
</body>
</html>