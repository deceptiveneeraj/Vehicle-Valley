<%-- 
    Document   : arentcarimg
    Created on : 28-Feb-2024, 7:00:28 pm
    Author     : neera
--%>

<%-- 
    Document   : autosellimg
    Created on : 25-Feb-2024, 9:37:16 am
    Author     : neera
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rent Car - Vehicle Valley</title>
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
            <form action="RentCar?action=rentcarimg" method="post" enctype="multipart/form-data">
                <h3 style="color: black; padding: 17px; text-align: center;">Rent Car Image</h3>
                <div id="error" style="color: red; font-size: 17px; font-weight: bold; text-align: center; margin-bottom: 15px;">
                    <!--Here error message shown-->
                </div>

                <div class="form-floating mb-3">
                    <input type="file" class="form-control" id="img" name="img" placeholder="image" required="">
                    <label for="img" class="form-label">Choose Car Image</label>
                </div>

                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                    <label class="form-check-label" for="exampleCheck1">Enter Correct Information of Your Vehicle To Sell Quickly</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <br>
            </form>
            <!--form end-->
        </div>
        <script>
            function valid() {
                pwd1 = document.getElementById("Password").value;
                pwd2 = document.getElementById("ConfirmPassword").value;
                if (pwd1 == pwd2) {
                    return true;
                } else {
                    document.getElementById("error").innerHTML = "Password and Confirm Confirm Not Matched.";
                    return false;
                }
            }
        </script>
    </body>
</html>
