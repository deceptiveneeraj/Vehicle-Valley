<%-- 
    Document   : autosell
    Created on : 22-Feb-2024, 6:19:03 pm
    Author     : neera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    com.vehiclevalley.logincheck.LoginCheck.checklogin(request, response);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Auto Sell - Vehicle Valley</title>
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
            <form action="AutoSell?action=sellinfo" method="post" style="">
                <h3 style="color: black; padding: 17px; text-align: center;">Sell Your Old Vehicle</h3>
                <div id="error" style="color: red; font-size: 17px; font-weight: bold; text-align: center; margin-bottom: 15px;">
                    <!--Here error message shown-->
                </div>

                <div class="form-floating mb-3">
                    <select class="form-select" aria-label="Default select example" name="vtype">
                        <option selected>Vehicle Type</option>
                        <option value="Car">Car</option>
                        <option value="Bike">Bike</option>
                        <option value="Scooty">Scooty</option>
                    </select>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="cname" placeholder="Vehicle Company Name" required="">
                    <label for="floatingInput">Vehicle Company Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="vname" placeholder="Vehicle Name" required="">
                    <label for="floatingInput">Vehicle Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="ryear" placeholder="Registration Year" required="">
                    <label for="floatingInput">Registration Year</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="mileage" placeholder="Mileage" required="">
                    <label for="floatingInput">Mileage</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-select" aria-label="Default select example" name="trans">
                        <option selected>Transmission</option>
                        <option value="Manual">Manual</option>
                        <option value="Automatic">Automatic</option>
                        <option value="Manual + Automatic">Manual + Automatic</option>
                    </select>
                </div>
                <div class="form-floating mb-3">
                    <select class="form-select" aria-label="Default select example" name="ftype">
                        <option selected>Fuel Type</option>
                        <option value="Petrol">Petrol</option>
                        <option value="Diesel">Diesel</option>
                        <option value="Electric">Electric</option>
                        <option value="CNG">CNG</option>
                        <option value="Hybrid">Hybrid</option>
                        <option value="Petrol + Diesel">Petrol + Diesel</option>
                        <option value="Petrol + Electric">Petrol + Electric</option>
                    </select>
                </div>
                <div class="form-floating mb-3" style="margin-top: 20px;">
                    <input type="text" class="form-control" id="floatingInput" name="eprice" placeholder="Expected Price" required="">
                    <label for="floatingInput">At What Price You want to Sell</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com" required="">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" name="mobile" pattern="[6789][0-9]{9}" placeholder="Mobile Number" maxlength="10" required="">
                    <label for="floatingInput">Mobile</label>
                </div>
                <div class="form-floating mb-3" style="margin-top: 20px;">
                    <textarea rows="2" class="form-control" id="floatingInput" name="desc" placeholder="desc" required=""></textarea>
                    <label for="floatingInput">Features And Specifications</label>
                </div>

                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                    <label class="form-check-label" for="exampleCheck1">Enter Correct Information of Your Vehicle To Sell Quickly</label>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return valid()">Submit</button>
                <br>
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
