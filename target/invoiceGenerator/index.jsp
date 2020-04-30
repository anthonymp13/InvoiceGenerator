<html>
<jsp:include page="/template/head.jsp" />

<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<script src="" async defer></script>

<jsp:include page="/template/navbar.jsp"/>

<div class="jumbotron jumbotron-fluid" id="invoiceJumbotron">
    <div class="container" id="invoiceDescription">
        <h1><span>Free</span> Invoices</h1>
        <p>The invoice generator is an easy and free way to generate invoices for your company. Employees will be able to use this application to store data about customers. Then store and generate invoices for those customers.</p>
        <a href="GenerateInvoice" class="btn btn-outline-primary">Generate Invoice</a>
    </div>
    <div class="imageContainer">
        <img id="invoiceExampleImage" alt="image of invoice" src="images/invoice.png">
    </div>
</div>

<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <h6>About</h6>
                <p class="text-justify">The invoice generator was made by Anthony Poleski for small businesses that want a free alternative to costly invoicing programs without losing functionality.</p>
            </div>

            <div class="col-xs-6 col-md-3">
                <h6>Categories</h6>
                <ul class="footer-links">
                    <li><a href="#">C</a></li>
                    <li><a href="#">UI Design</a></li>
                    <li><a href="#">PHP</a></li>
                    <li><a href="#">Java</a></li>
                    <li><a href="#">Android</a></li>
                    <li><a href="#">Templates</a></li>
                </ul>
            </div>

            <div class="col-xs-6 col-md-3">
                <h6>Quick Links</h6>
                <ul class="footer-links">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Contribute</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Sitemap</a></li>
                </ul>
            </div>
        </div>
        <hr>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-sm-6 col-xs-12">
                <p class="copyright-text">Copyright &copy; 2017 All Rights Reserved by
                    <a href="#">Scanfcode</a>.
                </p>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12">
                <ul class="social-icons">
                    <li><a class="facebook" href="#"><i aria-hidden="true" class="fa fa-facebook"></i></a></li>
                    <li><a class="twitter" href="#"><i aria-hidden="true" class="fa fa-twitter"></i></a></li>
                    <li><a class="dribbble" href="#"><i aria-hidden="true" class="fa fa-dribbble"></i></a></li>
                    <li><a class="linkedin" href="#"><i aria-hidden="true" class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</body>
</html>