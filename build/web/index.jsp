<%-- 
    Document   : login
    Created on : 17-Feb-2024, 3:33:51 pm
    Author     : neera
--%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vehicle Valley</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                /*overflow-y: hidden;  Hide vertical scrollbar */
            }

            /*footer*/
            /* Footer Section */
            .footer {
                background-color: black;
                padding: 80px 0;
                color: #fff;
            }

            .footer__contact {
                margin-bottom: 40px;
            }

            .footer__contact__title h2 {
                color: #fff;
                font-size: 24px;
                margin-bottom: 20px;
            }

            .footer__contact__option {
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .option__item {
                margin-right: 20px;
                font-size: 16px;
            }

            .option__item.email {
                margin-right: 0;
            }

            .footer__about {
                margin-bottom: 40px;
            }

            .footer__logo img {
                max-width: 150px;
            }

            .footer__social a {
                display: inline-block;
                width: 40px;
                height: 40px;
                line-height: 40px;
                text-align: center;
                background: #333;
                border-radius: 50%;
                margin-right: 10px;
                font-size: 18px;
            }

            .footer__social a:hover {
                background: #555;
            }

            .footer__widget {
                margin-bottom: 40px;
            }

            .footer__widget h5 {
                font-size: 18px;
                margin-bottom: 20px;
                color: #fff;
            }

            .footer__widget ul {
                padding: 0;
                list-style: none;
            }

            .footer__widget ul li {
                margin-bottom: 10px;
            }

            .footer__widget ul li a {
                color: #ccc;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .footer__widget ul li a:hover {
                color: #fff;
            }

            .footer__brand ul {
                padding: 0;
                list-style: none;
            }

            .footer__brand ul li {
                margin-bottom: 10px;
            }

            .footer__brand ul li a {
                color: #ccc;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .footer__brand ul li a:hover {
                color: #fff;
            }

            .footer__copyright__text {
                text-align: center;
                margin-top: 20px;
                color: #ccc;
            }

            .footer__copyright__text p {
                margin: 0;
            }

            .footer__copyright__text a {
                color: #ccc;
                text-decoration: none;
            }

            .footer__copyright__text a:hover {
                color: #fff;
            }

        </style>
    </head>
    <body>
        <!--navbar start-->
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark"">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp" style="font-size: 32px; margin-right: 55px;">Vehicle Valley</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="autosell.jsp">Vehicle Sell</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="refurbished.jsp">Refurbished</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Career</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                On Rent
                            </a>
                            <ul class="dropdown-menu">
                                <!--<li><a class="dropdown-item" href="#">Bus</a></li>-->
                                <li><a class="dropdown-item" href="rentcar.jsp">Car</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="rentbike.jsp">Bike $ Scooty</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Accounts
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="aboutus.jsp">About Us</a></li>
                                <li><a class="dropdown-item" href="#">Contact Us</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<%=loginouturl%>"><%=loginlogout%></a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="message.jsp">Messages</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link disabled" aria-disabled="true" href="#">AutoXchange</a>
                        </li>
 
                        <!--                        <li class="nav-item">
                                                    <a class="nav-link" href="<%=loginouturl%>"><%=loginlogout%></a>
                                                </li>-->
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <!--navbar end-->

        <!--Carousel start-->
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" style="margin-top:70px;">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://wallpaperaccess.com/full/33120.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="https://wallup.net/wp-content/uploads/2019/09/628301-il-2012-concept-bike-landscape-mountains-motorcycle-motorcyclist-race-road-speed.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="https://s-media-cache-ak0.pinimg.com/originals/06/a6/ab/06a6ab486646888ee44f78a0be6df021.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!--Carousel end-->

        <!-- Services Section Begin -->
        <section class="services spad">
            <div class="container">
                <div class="row" style="text-align: center; margin: 50px 0px;">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span class="text-danger"style="font-weight:bold;">Our Services</span>
                            <h2>What We Offers</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="services__item">
                            <img src="https://cdn5.vectorstock.com/i/thumb-large/53/69/auto-car-logo-rent-vector-38105369.jpg" alt="" style="height: 250px;">
                            <h5>Rental A Cars</h5>
                            <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                                viverra maecenas.</p>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="services__item">
                            <img src="https://1.bp.blogspot.com/-twdKBRBRjk0/XqlLzDzp5iI/AAAAAAAAABE/2Dpdgc8pMEs4_UG05XqTTSihWX1KMccegCLcBGAsYHQ/s1600/download.png" alt="" style="height: 250px;">
                            <h5>Buying A Cars</h5>
                            <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                                viverra maecenas.</p>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="services__item">
                            <img src="https://th.bing.com/th/id/OIP.w8xIexenk4hF56FcwoU-XQAAAA?w=240&h=240&rs=1&pid=ImgDetMain" alt="" style="height: 250px;">
                            <h5>Car Maintenance</h5>
                            <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                                viverra maecenas.</p>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="services__item">
                            <img src="https://www.vippng.com/png/detail/387-3875617_24-7-support-24-7-support-png.png" alt="" style="height: 250px;">
                            <h5>Support 24/7</h5>
                            <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                                viverra maecenas.</p>
                            <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->


        <!-- Footer Section Begin -->
        <footer class="footer set-bg" data-setbg="img/footer-bg.jpg" style="margin-top: 70px;">
            <div class="container">
                <div class="footer__contact">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="footer__contact__title">
                                <h2>Contact Us Now!</h2>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="footer__contact__option">
                                <div class="option__item"><i class="fa fa-phone"></i> (+91) 88188 33190</div>&nbsp; &nbsp; &nbsp; 
                                <div class="option__item email"><i class="fa fa-envelope-o"></i> neerajsolanki271@gmail.com</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="#"><img src="img/footer-logo.png" alt=""></a>
                            </div>
                            <p>Any questions? Let us know in gmail, and whatsapp on this number
                                (+91) 88188 33190</p>
                            <div class="footer__social">
                                <!--                                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                                                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                                                <a href="#" class="google"><i class="fa fa-google"></i></a>
                                                                <a href="#" class="skype"><i class="fa fa-skype"></i></a>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 offset-lg-1 col-md-3">
                        <div class="footer__widget">
                            <h5>Facility</h5>
                            <ul>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Sell Your Old Vehicle</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Purchase Second Hand Vehicle</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Buy Refurbished Vehicle</a></li>
                                <!--<li><a href="#"><i class="fa fa-angle-right"></i> Rent a Vehicle</a></li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <div class="footer__widget">
                            <h5>Rent a vehicle</h5>
                            <ul>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Car</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Bike</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Bus</a></li>
                                <!--<li><a href="#"><i class="fa fa-angle-right"></i> Crossover</a></li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer__brand">
                            <h5>Top Brand</h5>
                            <ul>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Abarth</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Acura</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Alfa Romeo</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Audi</a></li>
                            </ul>
                            <ul>
                                <li><a href="#"><i class="fa fa-angle-right"></i> BMW</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Chevrolet</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Ferrari</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i> Honda</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                <div class="footer__copyright__text">
                    <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved <i class="fa fa-heart" aria-hidden="true"></i> by <a href="#" target="_blank">Vehicle Valley</a></p>
                </div>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </footer>
        <!-- Footer Section End -->

    </body>
</html>
