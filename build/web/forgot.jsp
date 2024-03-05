<%-- 
    Document   : forgot
    Created on : 21-Feb-2024, 2:40:50 pm
    Author     : neera
--%>
<%@page import="java.util.Random"%>
<%@page import="com.vehiclevalley.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Info - Vehicle Valley</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assests/style/forgot.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>

        </nav>

        <!--Start Form-->
        <div class="login-box">
            <h2>Forgot Password</h2>
            <div id="error" style="color: red; font-weight: bold; font-size: 18.5px; text-align: center; margin-bottom: 18px;">
                <!--Error Message Shown Here-->
                <%
                    String emailerr = (String) session.getAttribute("emailinvalid");
                    if (emailerr != null && !emailerr.isEmpty()) {
                %>
                <div id="error" style="color: red; font-weight: bold; font-size: 18.5px; text-align: center; margin-bottom: 18px;">
                    <%= emailerr%>
                </div>
                <%
                        // Clear the session attribute after displaying the error message
                        session.removeAttribute("emailinvalid");
                    }
                %>
            </div>

            
            <form action="UpdateForgot?action=forgot" method="post">
                <div class="user-box">
                    <input type="email" name="email" required="">
                    <label>Enter Email</label>
                </div>

               
                <!--href="#"-->
                <a href="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <button type="submit" style="background: none; border: none; color: #03e9f4; cursor: pointer;" onmouseover="this.style.color = '#fff';" onmouseout="this.style.color = '#03e9f4';">Request For OTP</button>
                    <!--Submit-->
                </a>
            </form>
        </div>
    </body>
    <script>
        // Function to clear error message after 5 seconds
        setTimeout(function () {
            document.getElementById('error').style.display = 'none';
        }, 10000); // 10000 milliseconds = 10 seconds
    </script>
</html>
