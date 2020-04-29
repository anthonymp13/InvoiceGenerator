<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/8648d72440.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/8648d72440.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="generateInvoice.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="css/masterstylesheet.css">
    <link rel="stylesheet" type="text/css" href="../css/dashboard.css">
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<script src="" async defer></script>
<h1>Invoice Generator</h1>

<div class="displayContainer" id="usersContainer">
    <form>
        <label for="userSearch">Users</label>
        <input type="text" id="userSearch" name="invoiceSearch">
        <input type="submit" value="Search">
    </form>
    <table class="table table-bordered">
        <tr>
            <th class="ch1">Name</th>
            <th>Privileges</th>
            <th class="ch3">Actions</th>
        </tr>

        <tr>
            <td>Anthony Poleski</td>
            <td>Admin</td>
            <td><a href="#">Update</a><a href="#">Delete</a></td>
        </tr>

    </table>
</div>

<div class="displayContainer" id="invoicesContainer">
    <form>
        <label for="invoiceSearch">Invoices</label>
        <input type="text"  id="invoiceSearch" name="invoiceSearch">
        <input type="submit" value="Search">
    </form>
    <table class="table table-bordered">
        <tr>
            <th class="ch1">Name</th>
            <th>Invoice Date</th>
            <th class="ch3">Actions</th>
        </tr>
        <tr>
            <td>Anthony Poleski</td>
            <td>4/16/2020</td>
            <td><a href="#">Edit</a><a href="#">Delete</a></td>
        </tr>
    </table>
    <button>Add Invoice</button>
</div>

<div class="displayContainer" id="customerContainer">
    <form>
        <label for="customerSearch">Customers</label>
        <input type="text" id="customerSearch" name="customerSearch">
        <input type="submit" value="Search">
    </form>
    <table class="table table-bordered">
        <tr>
            <th class="ch1">Name</th>
            <th>Address</th>
            <th class="ch3">Actions</th>
        </tr>
        <tr>
            <td>Anthony Poleski</td>
            <td>5941 State Road</td>
            <td><a href="#">Edit</a><a href="#">Delete</a></td>
        </tr>
    </table>
    <button>Add Customer</button>
</div>
</body>
</html>