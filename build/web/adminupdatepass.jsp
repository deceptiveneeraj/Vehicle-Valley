<%-- 
    Document   : adminupdatepass
    Created on : 23-Feb-2024, 6:33:42 pm
    Author     : neera
--%>

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
                <a class="navbar-brand" href="adminhome.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="adminhome.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>
        </nav>

        <!--Start Form-->
        <div class="login-box">
            <h2>Update Password</h2>

            <h4 style="color: pink; text-align: center;">Welcome ${name}</h4>
            <div id="error" style="color: red; font-weight: bold; font-size: 18.5px; text-align: center; margin-bottom: 18px;">
                <!--Error Message Shown Here-->
            </div>
            <form action="AdminUpdateForgot?action=updatepass" method="post">
                <div class="user-box">
                    <input type="email" name="email" value="${email}" readonly>
                </div>
                <div class="user-box">
                    <input id="pwd1" type="password" name="password" required="">
                    <label>Enter New Password</label>
                </div>
                <div class="user-box">
                    <input id="pwd2" type="password" required>
                    <label>Confirm Password</label>
                </div>
                <!--href="#"-->
                <a href="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <button type="submit" onclick="return valid()" style="background: none; border: none; color: #03e9f4; cursor: pointer;" onmouseover="this.style.color = '#fff';" onmouseout="this.style.color = '#03e9f4';">Update Password</button>
                    <!--Submit-->
                </a>
            </form>
        </div>
    </body>
    <script>
        function valid() {
            var pwd1 = document.getElementById("pwd1").value; // Captcha value displayed
            var pwd2 = document.getElementById("pwd2").value; // Captcha value entered by user

            if (pwd1 === pwd2) {
                // Captcha matched, allow form submission
                return true;
            } else {
                // Captcha not matched, display error message and prevent form submission
                document.getElementById("error").innerHTML = "Password and Confirm Password Not Match.";
                return false;
            }
        }
    </script>
</html>

