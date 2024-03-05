<%-- 
    Document   : profile
    Created on : 20-Feb-2024, 9:57:53 pm
    Author     : neera
--%>
<%
    com.vehiclevalley.logincheck.LoginCheck.checklogin(request, response);
%>
<%
    String gen = (String) session.getAttribute("gender");
    String link = "";

    if ("Male".equals(gen)) {
        link = "https://static.vecteezy.com/system/resources/previews/000/593/472/original/vector-business-men-icon.jpg";
    } else if ("Female".equals(gen)) {
        link = "https://th.bing.com/th/id/OIP.-4h79T-JY8eJjPA8x_zKUwHaHa?rs=1&pid=ImgDetMain";
    } else {
        link = "https://img.freepik.com/free-vector/gender-neutral-movement-find-your-identity_23-2148541422.jpg?size=338&ext=jpg";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Vehicle Valley</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="assests/style/profile.css">
    </head>
    <body>
        <!--navbar start-->
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>
        </nav>
        <!--navbar end-->

        <!--form start-->
        <div class="page-content page-container" id="page-content" style="margin-top: 40px;">
            <div class="padding">
                <div class="row container d-flex justify-content-center">
                    <div class="col-xl-6 col-md-12">
                        <div class="card user-card-full">
                            <div class="row m-l-0 m-r-0">
                                <div class="col-sm-4 bg-c-lite-green user-profile">
                                    <div class="card-block text-center text-white">
                                        <div class="m-b-25">
                                            <img src="<%=link%>" class="img-radius" alt="User-Profile-Image" style="height:100px; border-radius: 50%">
                                        </div>
                                        <h5 class="f-w-600">${name}</h5>
                                        <!--<p>Web Designer</p>-->
                                        <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                    <div class="card-block">
                                        <h4 class="m-b-20 p-b-5 b-b-default f-w-600">User Information</h4>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p class="m-b-10 f-w-600">Gender</p>
                                                <h6 class="text-muted f-w-400">${gender}</h6>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p class="m-b-10 f-w-600">Phone</p>
                                                <h6 class="text-muted f-w-400">+91 ${mobile}</h6>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p class="m-b-10 f-w-600">Email</p>
                                                <h6 class="text-muted f-w-400">${email}</h6>
                                            </div>
                                        </div>
                                        <ul class="social-link list-unstyled m-t-40 m-b-10">
                                            <li style="padding: 1px 8px; background-color: #007bff; border-radius: 15px;"><a href="update.jsp" style="text-decoration: none; color: white; font-size: 16px; font-weight: bold;"><i>Edit Info</i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
