<%-- 
    Document   : booknow
    Created on : 29-Feb-2024, 10:26:08 pm
    Author     : neera
--%>
<%@page import="com.vehiclevalley.connection.CreateConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    com.vehiclevalley.logincheck.LoginCheck.checklogin(request, response);
%>
<%
    String cname="", vname="";
    String type = request.getParameter("type");
    int id = Integer.parseInt(request.getParameter("id"));

    Connection cn = CreateConnection.getConnection();
    Statement smt = cn.createStatement();
    if (type.equals("Bike")) {

        ResultSet rs = smt.executeQuery("SELECT * FROM rentbike WHERE id = " + id);
        if (rs.next()) {
            cname = rs.getString(2);
            vname = rs.getString(3);
        } else {
            out.println("Data Not Get");
        }
    } else if (type.equals("Car")) {
        ResultSet rs = smt.executeQuery("SELECT * FROM rentcar WHERE id = " + id);
        if (rs.next()) {
            cname = rs.getString(2);
            vname = rs.getString(3);
        } else {
            out.println("Data Not Get");
        }
    } else {
        out.println("Invalid Action");
    }
    String desc = type + " Id : " + id + " Company " + cname + " Modal " + vname;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Info - Vehicle Valley</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assests/style/edit.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>

        </nav>
        <div class="login-root">
            <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
                <div class="loginbackground box-background--white padding-top--64">
                    <div class="loginbackground-gridContainer">
                        <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
                            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
                            </div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
                            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
                            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
                            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
                            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
                            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
                            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
                            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
                        </div>
                        <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
                            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
                        </div>
                    </div>
                </div>
                <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
                    <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
                        <!--<h1><a href="http://blog.stackfindover.com/" rel="dofollow">Update Info</a></h1>-->
                        <h1>Book The Vehicle For Rent</h1>
                    </div>
                    <div class="formbg-outer">
                        <div class="formbg">
                            <div class="formbg-inner padding-horizontal--48">
                                <!--<span class="padding-bottom--15">Sign in to your account</span>-->

                                <form id="rental-form" action="BookNow?action=book" method="post">

                                    <div class="field padding-bottom--24">
                                        <label for="name">Name</label>
                                        <input type="text" name="name" value="${name}" id="name" readonly>
                                    </div>
                                    <!--<div class="field padding-bottom--24">-->
                                    <!--<label for="email">Email</label>-->
                                    <input type="email" name="email" id="email" value="${email}" readonly hidden>
                                    <!--</div>-->
                                    <!--<div class="field padding-bottom--24">-->
                                    <!--<label for="mobile">Mobile</label>-->
                                    <input type="tel" name="mobile" id="mobile" value="${mobile}" pattern="[6789][0-9]{9}" maxlength="10" readonly hidden>
                                    <!--</div>-->

                                    <div class="field padding-bottom--24">
                                        <label for="start_date">Start Date</label>
                                        <input type="date" name="start_date" id="start_date" required="">
                                    </div>

                                    <div class="field padding-bottom--24">
                                        <label for="start_time">Start Time</label>
                                        <input type="time" name="start_time" id="start_time" required="">
                                    </div>

                                    <div class="field padding-bottom--24">
                                        <label for="end_date">End Date</label>
                                        <input type="date" name="end_date" id="end_date" required="">
                                    </div>

                                    <div class="field padding-bottom--24">
                                        <label for="end_time">End Time</label>
                                        <input type="time" name="end_time" id="end_time" required="">
                                    </div>

                                    <div class="form-floating mb-3">
                                        <select class="form-select" aria-label="Default select example" name="city">
                                            <option selected>Select City</option>
                                            <option value="Indore">Indore</option>
                                            <option value="Pune">Pune</option>
                                            <option value="Mumbai">Mumbai</option>
                                            <option value="Delhi">Delhi</option>
                                        </select>
                                    </div>

                                    <input type="text" name="descrip" id="descrip" value="<%=desc%>" readonly hidden>


                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="terms" required="">
                                        <!--<label class="form-check-label" for="terms">I agree to the terms and conditions</label>-->
                                        <label class="form-check-label" for="terms">Apply Charges if Drop Off Delay. 599 Rs Per Hour.</label>
                                    </div>

                                    <div class="field padding-bottom--24">
                                        <input type="submit" name="submit" value="Submit">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
