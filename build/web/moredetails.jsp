<%-- 
    Document   : moredetails
    Created on : 27-Feb-2024, 5:39:54 pm
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
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<%!
    String vtype, sid, cname, vname, ryear, mileage, trans, ftype, eprice, email, mobile, desc, img;
%>
<%
    int vid = Integer.parseInt(request.getParameter("id"));

    Connection cn = CreateConnection.getConnection();
    Statement smt = cn.createStatement();
    ResultSet rs = smt.executeQuery("SELECT * FROM autosell WHERE id = " + vid);
    if (rs.next()) {
        vtype = rs.getString(2);
        sid = rs.getString(3);
        cname = rs.getString(4);
        vname = rs.getString(5);
        ryear = rs.getString(6);
        mileage = rs.getString(7);
        trans = rs.getString(8);
        ftype = rs.getString(9);
        eprice = rs.getString(10);
        email = rs.getString(11);
        mobile = rs.getString(12);
        desc = rs.getString(13);
        img = rs.getString(14);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>More Details - Vehicle Valley</title>
        <link rel="stylesheet" href="assests/style/login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                padding-top: 70px; /* Adjust navbar height */
            }

            .navbar {
                background-color: #343a40 !important;
                color: white;
            }

            .car-details-container {
                display: flex;
                align-items: center;
                justify-content: space-around;
                padding: 10px;
            }

            .car-image {
                width: 50%;
                max-width: 500px;
                height: auto;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            }

            .car-info {
                width: 40%;
                max-width: 400px;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            }

            .car-info h2 {
                margin-top: 0;
                color: #343a40;
            }

            .car-info p {
                margin-bottom: 10px;
                color: #6c757d;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Vehicle Valley</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="car-details-container">
                <img src="assests/images/autosell/<%=img%>" alt="Car Image" class="car-image">
                <div class="car-info">
                    <h2>Car Information</h2>
                    <p><strong>Vehicle Type:</strong> <%=vtype%></p>
                    <p><strong>Company Name:</strong> <%=cname%></p>
                    <p><strong>Modal or Vehicle Name:</strong> <%=vname%></p>
                    <p><strong>Registration Year:</strong> <%=ryear%></p>
                    <p><strong>Mileage:</strong> <%=mileage%> kmpl</p>
                    <p><strong>Transmission:</strong> <%=trans%></p>
                    <p><strong>Fuel Type:</strong> <%=ftype%></p>

                    <br>
                    <p><strong>Expected Price:</strong> <%=eprice%></p>
                    <br>
                    <p><strong>Description:</strong> <%=desc%></p>
                    <br>

                    <h4>Seller Contact Info</h4>
                    <p><strong>Email:</strong> <%=email%></p>
                    <p><strong>Mobile:</strong> <%=mobile%></p>

                    <li style="padding: 1px 8px; background-color: #007bff; border-radius: 15px; text-align: center; list-style: none;"><a href="chat.jsp?id=<%=sid%>" style="text-decoration: none; color: white; font-size: 16px; font-weight: bold;">Chat With Seller</a></li>
 
                </div>
            </div>
        </div>
    </body>
</html>
