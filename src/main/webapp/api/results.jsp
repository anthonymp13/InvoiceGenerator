<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="title" value="Search Results" />
<c:import url="../template/head.jsp" />
<html>
<body>
<%--TODO: pull company name from databases and display in h2--%>
<h2>Company User Search</h2>
<a href = "SearchUser">Go to the User Search</a>

<div class="container-fluid">
    <h2>Search Results</h2>
    <table id="companiesTable" class="display" cellspacing="0" width="100%">
        <c:forEach var="company" items="${companies}">
            <thead>
                <th>Company Id</th>
                <th>Company Name</th>
                <th>Company phone number</th>
                <th>Company Address</th>
                <th>Company Users</th>
            </thead>
            <tr>
                <td>${company.companyId}</td>
                <td>${company.companyName}</td>
                <td>${company.phoneNumber}</td>
                <td>${company.address}</td>
                <td>
                    <c:forEach var="user" items="${company.users}">
                        ${user.userId} ${user.userName} ${user.firstName} ${user.lastName}<br>
                    </c:forEach>

                    <c:forEach var="customer" items="${company.customers}">
                        ${customer.id}
                        ${customer.firstName} ${customer.lastName}
                        ${customer.phoneNumber}
                        ${customer.street}, ${customer.city}, ${customer.state} ${customer.postalcode}
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>