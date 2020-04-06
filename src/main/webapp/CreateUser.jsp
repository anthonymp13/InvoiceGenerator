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

<form action="CreateUser">
    <div class="form-group">
        <label for="company">Organization</label>
        <input type="text" class="form-control" placeholder="Organization" id="company" name="company">
    </div>
    <div class="form-group">
        <label for="company">Organization</label>
        <input type="text" class="form-control" placeholder="Username" id="userName" name="userName">
    </div>
    <div class="form-group">
        <label for="firstName">First Name:</label>
        <input type="text" class="form-control" placeholder="First name" id="firstName" name="firstName">
    </div>
    <div class="form-group">
        <label for="lastName">Last Name:</label>
        <input type="text" class="form-control" placeholder="Last name" id="lastName" name="lastName">
    </div>
    <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" class="form-control" placeholder="Email" id="email" name="email">
    </div>
    <div class="form-group">
        <label for="pwd">Password</label>
        <input type="password" class="form-control" placeholder="Password" id="pwd" name="password">
    </div>
    <div class="form-group">
        <label for="pwdConf">Confirm Password</label>
        <input type="password" class="form-control" placeholder="Confirm password" id="pwdConf" name="passwordConfirmation">
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
