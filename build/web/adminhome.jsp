<%-- 
    Document   : adminhome
    Created on : 23-Feb-2024, 5:52:06 pm
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
        loginouturl = "admin.jsp";
    } else {
        loginlogout = "Logout";
        loginouturl = "AdminLoginSign?action=logout";
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
                overflow-y: hidden; /* Hide vertical scrollbar */
            }
        </style>
    </head>
    <body>
        <!--navbar start-->
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark"">
            <div class="container-fluid">
                <a class="navbar-brand" href="adminhome.jsp" style="font-size: 32px; margin-right: 55px;">Vehicle Valley</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="adminhome.jsp">Admin Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Job Application</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="rentrequest.jsp">Rent Request</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                To Rent
                            </a>
                            <ul class="dropdown-menu">
                                <!--<li><a class="dropdown-item" href="#">Bus</a></li>-->
                                <li><a class="dropdown-item" href="arentcar.jsp">Car</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="arentbike.jsp">Bike $ Scooty</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Accounts
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="adminprofile.jsp">Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<%=loginouturl%>"><%=loginlogout%></a></li>
                            </ul>
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
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
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
    </body>
</html>
