<%--
  Created by IntelliJ IDEA.
  User: Anthony
  Date: 3/12/2020
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/masterstylesheet.css">
    <link rel="stylesheet" type="text/css" href="css/createUser.css">
    <script type="text/javascript" src="generateInvoice.js"> </script>
</head>

<body>

<h1>Invoice Generator</h1>
<p>Create account here:</p>
<%--TODO: Add form validation--%>
<form action="/CreateUser">
    <div class="form-group">
        <label for="company">Organization</label>
        <input type="text" class="form-control" placeholder="Enter organization" id="company">
    </div>
    <div class="form-group">
        <label for="userName">User Name:</label>
        <input type="text" class="form-control" placeholder="Enter user name" id="userName">
    </div>
    <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" class="form-control" placeholder="Enter first name" id="firstName">
    </div>
    <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" class="form-control" placeholder="Enter last name" id="lastName">
    </div>
    <div class="form-group">
        <label for="pwd">Password</label>
        <input type="password" class="form-control" placeholder="Enter password" id="pwd">
    </div>
    <div class="form-group">
        <label for="pwdConf">Confirm Password</label>
        <input type="password" class="form-control" placeholder="Enter password" id="pwdConf">
    </div>
    <!-- <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox"> Remember me
      </label>
    </div> -->
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-secondary">Reset</button>
</form>

</body>
</html>
