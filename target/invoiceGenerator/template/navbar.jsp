<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 4/29/2020
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->
    <a class="navbar-brand" href="index.jsp">Invoice Generator</a>

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
        <c:if test="${user == null}">
            <li class="nav-item">
                <a class="nav-link" href="about.jsp">About us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contribute</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"></a>
            </li>
        </c:if>
        <c:if test="${user != null}">
            <li class="nav-item">
                <a class="nav-link" href="Dashboard">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Logout">logout</a>
            </li>
        </c:if>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact Us</a>
            </li>

            <c:if test="${user == null}">
                <li class="nav-item">
                    <a class="nav-link" href="Dashboard">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CreateUser.jsp">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="createCompany.jsp">Company Sign Up</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>

