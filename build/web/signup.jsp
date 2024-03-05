<%-- 
    Document   : signup
    Created on : 17-Feb-2024, 4:33:39 pm
    Author     : neera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up - Vehicle Valley</title>
        <link rel="stylesheet" href="assests/style/login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="background-image">
            <!--navbar and form inside this div to overlay on the background image-->
            <!--navbar start-->
            <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                    <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
                </div>

            </nav>
            <!--navbar end-->

            <!--form start-->
            <form action="LoginSignup?action=signup" method="post" style="">
                <h1 style="color: black; padding: 17px; text-align: center;">SignUp Here</h1>
                <div id="error" style="color: red; font-size: 17px; font-weight: bold; text-align: center; margin-bottom: 15px;">
                    <!--Here error message shown-->
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="name" placeholder="Name" required="">
                    <label for="floatingInput">Name</label>
                </div>
                <span style="padding: 10px;">Gender</span>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male" id="inlineRadio1" value="option1" required>
                    <label class="form-check-label" for="inlineRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female" id="inlineRadio2" value="option2" required>
                    <label class="form-check-label" for="inlineRadio2">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Other" id="inlineRadio3" value="option3" required>
                    <label class="form-check-label" for="inlineRadio3">Other</label>
                </div>
                <div class="form-floating mb-3" style="margin-top: 20px;">
                    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com" required="">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="mobile" pattern="[6789][0-9]{9}" placeholder="Mobile Number" maxlength="10" required="">
                    <label for="floatingInput">Mobile</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="Password" name="password" placeholder="Password" required="">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="ConfirmPassword" placeholder="Password" required="">
                    <label for="floatingPassword">Confirm Password</label>
                </div>

                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return valid()">Submit</button>
                <br>
                <label for="floatingPassword">Don't have an account ? <a href="login.jsp" style="text-decoration: none;">Login Here</a></label>
            </form>
            <!--form end-->
        </div>
        <script>
            function valid()
            {
                pwd1 = document.getElementById("Password").value;
                pwd2 = document.getElementById("ConfirmPassword").value;
                if (pwd1 == pwd2)
                {
                    return true;
                } else
                {
                    document.getElementById("error").innerHTML = "Password and Confirm Confirm Not Matched.";
                    return false;
                }
            }

        </script>
    </body>
</html>
