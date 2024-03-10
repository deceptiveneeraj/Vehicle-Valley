<%
    // Login or Logout
    String email = (String) session.getAttribute("email");
    String name = (String) session.getAttribute("name");
    String loginlogout = "";
    String loginouturl = "";
    if (email == null) {
        loginlogout = "Login";
        loginouturl = "login.jsp";
    } else {
        loginlogout = "Logout";
        loginouturl = "LoginSignup?action=logout";
    }
%>
<%@ page import="com.vehiclevalley.logincheck.LoginCheck" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">

        <!-- title of site -->
        <title>Vehicle Valley</title>

        <!-- For favicon png -->
        <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png" />

        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
        <link rel="stylesheet" href="assets/css/linearicons.css">

        <!--flaticon.css-->
        <link rel="stylesheet" href="assets/css/flaticon.css">

        <!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- bootsnav -->
        <link rel="stylesheet" href="assets/css/bootsnav.css">

        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

        <!--[if lt IE 9]>
                        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

        <!--welcome-hero start -->
        <section id="home" class="welcome-hero">

            <!-- top-area Start -->
            <div class="top-area">
                <div class="header-area">
                    <!-- Start Navigation -->
                    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"
                         data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

                        <div class="container">

                            <!-- Start Header Navigation -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse"
                                        data-target="#navbar-menu">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <a class="navbar-brand" href="adminhome.jsp" style="margin-left: -30px; font-size: 20px;">Vehicle Valley<span></span></a>

                            </div><!--/.navbar-header-->
                            <!-- End Header Navigation -->

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu" style="margin-right: -50px;">
                                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                                    <li class=" scroll active"><a href="#home" style="margin-right: -17px;"> Admin home</a></li>
                                    <li class="scroll"><a href="#service" style="margin-right: -17px;">service</a></li>
                                    
                                    <li class="nav-item dropdown" style="margin-right: -17px;">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Jobs
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="ajobpost.jsp" style="font-size: 16px;">job post</a></li>
                                            <li><hr class="dropdown-divider"></li><br>
                                            <li><a href="jobsapplication.jsp" style="font-size: 16px;">Jobs Applications</a></li>
                                        </ul>
                                    </li>
                                    
                                    <li><a href="rentrequest.jsp" style="margin-right: -17px;">Rent Request</a></li>
                                    <li class="scroll"><a href="#contact" style="margin-right: -17px;">contact</a></li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Accounts
                                        </a>
                                        <ul class="dropdown-menu">		
                                            <li><a class="dropdown-item" href="profile.jsp" style="font-size: 18px;">Profile</a></li><br>
                                            <li><a href="messages.jsp" style="font-size: 18px;">Messages</a></li>
                                            <li><a class="dropdown-item" href="aboutus.jsp"style="font-size: 18px;">About Us</a></li>
                                            <li><hr class="dropdown-divider"></li><br>
                                            <li><a class="dropdown-item" style="font-size: 18px;" href="<%=loginouturl%>"><%=loginlogout%></a></li>
                                        </ul>
                                    </li>
                                </ul><!--/.nav -->
                            </div><!-- /.navbar-collapse -->
                        </div><!--/.container-->
                    </nav><!--/nav-->
                    <!-- End Navigation -->
                </div><!--/.header-area-->
                <div class="clearfix"></div>

            </div><!-- /.top-area-->
            <!-- top-area End -->

            <div class="container">
                <div class="welcome-hero-txt">
                    <h2>Admin Home Page</h2>
                    <p>
                        <!--Take the vehicle on rent form here in the resonable price and also buy from here.-->
                        <br><br><br>
                    </p>
                    <!--<button class="welcome-btn" onclick="window.location.href = '#'">contact us</button>-->
                    <!--<br><br>-->
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="model-search-content">


                            <!--form start-->
                            <form action="AutoSell?action=sellinfo" method="post" onsubmit="return valid();">

                                <!--<h3 style="color:black; text-align: center;">Add Your Old Vehicle To Sell Here</h3>-->

                                <div id="error" style="color: red; font-weight: bold; font-size: 18.5px; text-align: center; margin-bottom: 18px;">
                                    <h3 style="color:black; text-align: center;">Add Your Old Vehicle To Sell Here</h3>

                                </div>

                                <div class="row" style="margin: 20px;">
                                    <div class="col-md-offset-5 col-md-3 col-sm-12">
                                        <div class="model-select-icon" style="align-items: center; text-align: center;">
                                            <select class="form-control" name="vtype">
                                                <option selected>Vehicle Type</option>
                                                <option value="Car">Car</option>
                                                <option value="Bike">Bike</option>
                                                <option value="Scooty">Scooty</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!--<div class="form-floating mb-3">-->
                                <input type="text" class="form-control" id="floatingInput" name="sid" value="${id}" placeholder="" readonly hidden style="display: none;">
                                <!--<label for="floatingInput">Email address</label>-->
                                <!--</div>-->

                                <!--<div class="form-floating mb-3">-->
                                <input type="email" class="form-control" id="floatingInput" name="email" value="${email}" placeholder="name@example.com" readonly="" hidden="" style="display: none;"> 
                                <!--<label for="floatingInput">Email address</label>-->
                                <!--</div>-->

                                <div class="row" style="margin: 20px;">
                                    <div class="col-md-offset-1 col-md-3 col-sm-12">
                                        <div class="single-model-search">
                                            <h2>Vehicle Company Name</h2>
                                            <input type="text" class="form-control" id="floatingInput" name="cname" placeholder="Vehicle Company Name" required="">
                                        </div>

                                        <div class="single-model-search">
                                            <h2>Transmission</h2>
                                            <div class="model-select-icon">
                                                <select class="form-control" name="trans">
                                                    <option value="default">Transmission</option>
                                                    <option value="Manual">Manual</option>
                                                    <option value="Automatic">Automatic</option>
                                                    <option value="Manual + Automatic">Manual + Automatic</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="single-model-search">
                                            <h2>At What Price You want to Sell</h2>
                                            <input type="text" class="form-control" id="floatingInput" name="eprice" placeholder="Expected Price" required="">
                                        </div>
                                    </div>

                                    <div class="col-md-offset-1 col-md-3 col-sm-12">
                                        <div class="single-model-search">
                                            <h2>Vehicle / Modal Name</h2>
                                            <input type="text" class="form-control" id="floatingInput" name="vname" placeholder="Vehicle Name" required="">
                                        </div>

                                        <div class="single-model-search">
                                            <h2 style="margin-top: 35px;">Mileage</h2>
                                            <input type="text" class="form-control" id="floatingInput" name="mileage" placeholder="Mileage" required="" style="margin-bottom: 50px;">
                                        </div>

                                        <div class="single-model-search">
                                            <h2>Mobile Number</h2>
                                            <input type="text" class="form-control" id="floatingInput" name="mobile" pattern="[6789][0-9]{9}" placeholder="Mobile Number" maxlength="10" required="">
                                        </div>
                                    </div>

                                    <div class="col-md-offset-1 col-md-3 col-sm-12">
                                        <div class="single-model-search">
                                            <h2>Registration Year</h2>
                                            <input type="text" class="form-control" id="floatingInput" name="ryear" placeholder="Registration Year" required="">
                                        </div>

                                        <div class="single-model-search">
                                            <h2>Fuel Type</h2>
                                            <div class="model-select-icon">
                                                <select class="form-control" name="ftype">
                                                    <option value="default">Fuel Type</option>
                                                    <option value="Petrol">Petrol</option>
                                                    <option value="Diesel">Diesel</option>
                                                    <option value="Electric">Electric</option>
                                                    <option value="CNG">CNG</option>
                                                    <option value="Hybrid">Hybrid</option>
                                                    <option value="Petrol + Diesel">Petrol + Diesel</option>
                                                    <option value="Petrol + Electric">Petrol + Electric</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="single-model-search">
                                            <h2>Features And Specifications</h2>
                                            <textarea rows="2" class="form-control" id="floatingInput" name="desc" placeholder="Vehicle Description" required=""></textarea>
                                        </div>
                                    </div>
                                    <center>
                                        <button type="submit" class="btn btn-primary" onclick="return valid()" style="align-items: center; text-align: center;">Submit</button>
                                    </center>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </section><!--/.welcome-hero-->
        <!--welcome-hero end -->

        <!--service start -->
        <section id="service" class="service">
            <div class="container">
                <div class="service-content">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <a href="autosell.jsp">
                                <div class="single-service-item">
                                    <div class="single-service-icon">
                                        <img src="assets/images/service/sell.jpg" alt="Vehicle Image" style="height:200px; margin-top: -50px;">
                                        <!--<i class="flaticon-car"></i>-->
                                    </div>
                                    <h2><a href="autosell.jsp">Add Old Vehicle for Sell<span> </span> Here</a></h2>
                                    <p>
                                        Add Old Bike and Car for Sell.
                                    </p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <a href="arentbike.jsp">
                                <div class="single-service-item">
                                    <div class="single-service-icon">
                                        <img src="assets/images/service/BikeRent.jpg" alt="Vehicle Image" style="height:200px; margin-top: -50px;">
                                        <!--<i class="flaticon-car-repair"></i>-->
                                    </div>
                                    <h2><a href="arentbike.jsp">Add Bike And Scooty For Rent</a></h2>
                                    <p>
                                        Sell 2 Wheeler Vehicle for Rent.
                                    </p>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <a href="arentcar.jsp">
                                <div class="single-service-item">
                                    <div class="single-service-icon">
                                        <img src="assets/images/service/CarRent.jpg" alt="Vehicle Image" style="height:200px; margin-top: -50px;">
                                        <!--<i class="flaticon-car-1"></i>-->
                                    </div>
                                    <h2><a href="arentcar.jsp">Add Car For Rent</a></h2>
                                    <p>
                                        Sell 4 Wheeler Vehicle for Rent.
                                    </p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div><!--/.container-->

        </section><!--/.service-->
        <!--service end-->

        <!-- clients-say strat -->
        <section id="clients-say" class="clients-say">
            <div class="container">
                <div class="section-header">
                    <h2>Developers</h2>
                    <!--<h2>what our clients say</h2>-->
                </div><!--/.section-header-->
                <div class="row">
                    <div class="owl-carousel testimonial-carousel">
                        <div class="col-sm-3 col-xs-12">
                            <div class="single-testimonial-box">
                                <div class="testimonial-description">
                                    <div class="testimonial-info">
                                        <div class="testimonial-img">
                                            <!--<img src="assets/images/clients/c1.png" alt="image of clients person" />-->
                                            <img src="assests/images/aboutus/anju.jpeg" alt="image of clients person" />
                                        </div><!--/.testimonial-img-->
                                    </div><!--/.testimonial-info-->
                                    <div class="testimonial-comment">
                                        <p>
                                            Java Developer

                                        </p>
                                    </div><!--/.testimonial-comment-->
                                    <div class="testimonial-person">
                                        <h2><a href="https://www.linkedin.com/in/anjali-ujjaini-8982anjali/">Anjali Ujjaini</a></h2>
                                        <h4>Ujjain</h4>
                                    </div><!--/.testimonial-person-->
                                </div><!--/.testimonial-description-->
                            </div><!--/.single-testimonial-box-->
                        </div><!--/.col-->
                        <div class="col-sm-3 col-xs-12">
                            <div class="single-testimonial-box">
                                <div class="testimonial-description">
                                    <div class="testimonial-info">
                                        <div class="testimonial-img">
                                            <img src="assests/images/aboutus/neera.jpeg" alt="image of clients person" />
                                        </div><!--/.testimonial-img-->
                                    </div><!--/.testimonial-info-->
                                    <div class="testimonial-comment">
                                        <p>
                                            Java Developer

                                        </p>
                                    </div><!--/.testimonial-comment-->
                                    <div class="testimonial-person">
                                        <h2><a href="https://www.linkedin.com/in/neeraj-solanki-a776b620b/">Neeraj Solanki</a></h2>
                                        <h4>Dewas</h4>
                                    </div><!--/.testimonial-person-->
                                </div><!--/.testimonial-description-->
                            </div><!--/.single-testimonial-box-->
                        </div><!--/.col-->
                        <div class="col-sm-3 col-xs-12">
                            <div class="single-testimonial-box">
                                <div class="testimonial-description">
                                    <div class="testimonial-info">
                                        <div class="testimonial-img">
                                            <img src="assets/images/clients/c3.png" alt="image of clients person" />
                                        </div><!--/.testimonial-img-->
                                    </div><!--/.testimonial-info-->
                                    <div class="testimonial-comment">
                                        <p>
                                            Java Developer
                                        </p>
                                    </div><!--/.testimonial-comment-->
                                    <div class="testimonial-person">
                                        <h2><a href="#">Khushbu Raikwar</a></h2>
                                        <h4>Indore</h4>
                                    </div><!--/.testimonial-person-->
                                </div><!--/.testimonial-description-->
                            </div><!--/.single-testimonial-box-->
                        </div><!--/.col-->
                    </div><!--/.testimonial-carousel-->
                </div><!--/.row-->
            </div><!--/.container-->

        </section><!--/.clients-say-->
        <!-- clients-say end -->

        <!--brand strat -->
        <section id="brand" class="brand">
            <div class="container">
                <div class="brand-area">
                    <div class="owl-carousel owl-theme brand-item">
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br1.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br2.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br3.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br4.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->

                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br5.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->

                        <div class="item">
                            <a href="#">
                                <img src="assets/images/brand/br6.png" alt="brand-image" />
                            </a>
                        </div><!--/.item-->
                    </div><!--/.owl-carousel-->
                </div><!--/.clients-area-->

            </div><!--/.container-->

        </section><!--/brand-->
        <!--brand end -->

        <!--blog start -->
        <section id="blog" class="blog"></section><!--/.blog-->
        <!--blog end -->

        <!--contact start-->
        <footer id="contact" class="contact">
            <div class="container">
                <div class="footer-top">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="single-footer-widget">
                                <div class="footer-logo">
                                    <a href="index.html">Vehicle Valley</a>
                                </div>
                                <p>
                                    We sell the old Vehicle, buy the old vehicle and also provide the vehicle give on rent facility. 
                                </p>
                                <div class="footer-contact">
                                    <p>vehiclevalley@gmail.com</p>
                                    <p>+91 88188 33190</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-6">
                            <div class="single-footer-widget">
                                <h2>About</h2>
                                <ul>
                                    <li><a href="aboutus.jsp">About Us</a></li>
                                    <li><a href="#">Career</a></li>
                                    <li><a href="#">terms <span> of service</span></a></li>
                                    <li><a href="#">privacy policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-xs-12">
                            <div class="single-footer-widget">
                                <h2>Services</h2>
                                <div class="row">
                                    <div class="col-md-7 col-xs-6">
                                        <ul>
                                            <li><a href="#">Car Wash</a></li>
                                            <li><a href="#">Auto Parts</a></li>
                                            <li><a href="#">Car Accessories</a></li>
                                            <li><a href="#">Bike Accessories</a></li>
                                            <li><a href="#">infiniti</a></li>
                                            <li><a href="#">nissan</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-5 col-xs-6">
                                        <ul>
                                            <li><a href="#">ferrari</a></li>
                                            <li><a href="#">porsche</a></li>
                                            <li><a href="#">land rover</a></li>
                                            <li><a href="#">aston martin</a></li>
                                            <li><a href="#">mersedes</a></li>
                                            <li><a href="#">opel</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-offset-1 col-md-3 col-sm-6">
                            <div class="single-footer-widget">
                                <h2>news letter</h2>
                                <div class="footer-newsletter">
                                    <p>
                                        Subscribe to get latest news update and informations
                                    </p>
                                </div>
                                <div class="hm-foot-email">
                                    <div class="foot-email-box">
                                        <input type="text" class="form-control" placeholder="Add Email">
                                    </div><!--/.foot-email-box-->
                                    <div class="foot-email-subscribe">
                                        <span><i class="fa fa-arrow-right"></i></span>
                                    </div><!--/.foot-email-icon-->
                                </div><!--/.hm-foot-email-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Vehicle Valley</a>
                            </p>

                        </div>
                        <div class="col-sm-6">
                            <div class="footer-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!--/.footer-copyright-->
            </div><!--/.container-->

            <div id="scroll-Top">
                <div class="return-to-top">
                    <i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title=""
                       data-original-title="Back to Top" aria-hidden="true"></i>
                </div>

            </div><!--/.scroll-Top-->

        </footer><!--/.contact-->
        <!--contact end-->



        <!-- Include all js compiled plugins (below), or include individual files as needed -->

        <script src="assets/js/jquery.js"></script>

        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

        <!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- bootsnav js -->
        <script src="assets/js/bootsnav.js"></script>

        <!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>



    </body>

    <script>

                                    function valid() {
                                        var email = <%= email%>; // Enclose JSP expression in quotes and declare variables with var keyword
                                        if (email != null) {
                                            return true;
                                        } else {
                                            document.getElementById("error").innerHTML = "To Add the Vehicle Please Login First ";
                                            return false; // Prevent form submission
                                        }
                                    }

    </script>
</html>