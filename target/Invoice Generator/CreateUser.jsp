<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <jsp:include page="/template/head.jsp" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/invoiceGenerator/css/createUser.css">
</head>
<body>
<jsp:include page="/template/navbar.jsp"/>

<c:if test="${success} = false">
    <div class="alert alert-danger" role="alert">
        <p>Username has already been taken</p>
    </div>
</c:if>

<p>Create account here:</p>

<form action="CreateUser">

    <div class="form-group">
        <label for="userName">Username</label>
        <input type="text" required="required"  class="form-control" placeholder="Username" id="userName" name="userName">
    </div>
    <div class="form-group">
        <label for="firstName">First Name</label>
        <input type="text" required="required"  class="form-control" placeholder="First name" id="firstName" name="firstName">
    </div>
    <div class="form-group">
        <label for="lastName">Last Name</label>
        <input type="text" required="required" class="form-control" placeholder="Last name" id="lastName" name="lastName">
    </div>
    <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" required="required" class="form-control" placeholder="Email" id="email" name="email">
    </div>
    <div class="form-group">
        <label for="pwd">Password</label>
        <input type="password" required="required" class="form-control" placeholder="Password" id="pwd" name="password">
    </div>
    <div class="form-group">
        <label for="pwdConf">Confirm Password</label>
        <input type="password" required="required" class="form-control" placeholder="Confirm password" id="pwdConf" name="passwordConfirmation">
    </div>

    <div class="form-group">
        <label for="company">Company Name</label>
        <input type="text" required="required" class="form-control" placeholder="Organization" id="company" name="company">
    </div>


    <!-- <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox"> Remember me
      </label>
    </div> -->
    <button type="submit"  value="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-secondary">Reset</button>
</form>

</body>
</html>
