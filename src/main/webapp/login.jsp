<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/5/2020
  Time: 10:58 AM
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<html>
<c:import url="template/head.jsp" />

<body>

<c:import url="template/navbar.jsp"/>

<div id="loginContainer">
    <h1>Login:</h1>

    <FORM ACTION="j_security_check" METHOD="POST">
        <TABLE>
            <TR><TD><label>User name:</label> <INPUT class="form-control" TYPE="TEXT" NAME="j_username">
            <TR><TD><label>Password:</label> <INPUT class="form-control" TYPE="PASSWORD" NAME="j_password">
            <TR><TH><INPUT TYPE="SUBMIT" name="login" class="btn btn-primary" VALUE="Log In">
        </TABLE>
    </FORM>
    <a href="#">Forgot username/password?</a>
    <a href="user/createUser.jsp">Sign Up</a>

</div>

</body>
</html>