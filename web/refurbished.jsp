<%-- 
    Document   : refurbished
    Created on : 25-Feb-2024, 12:56:07 pm
    Author     : neera
--%>
<%@page import="com.vehiclevalley.connection.CreateConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Vehicle Valley</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/style/profile.css">
        <style>
            .card {
                margin-bottom: 20px;
            }
            /* For screens smaller than 768px */
            @media (max-width: 767.98px) {
                .card img {
                    height: 100px;
                    object-fit: cover;
                }
            }
            /* For screens 768px and above */
            @media (min-width: 768px) {
                .card img {
                    height: 250px;
                    object-fit: cover;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>
        </nav>
        <!-- End Navbar -->

        <!-- Card Start-->
        <div class="container mt-5">
            <div class="row row-cols-2 row-cols-md-2 row-cols-lg-3">
                <% try {
                        Connection cn = CreateConnection.getConnection();
                        Statement smt = cn.createStatement();
                        ResultSet rs = smt.executeQuery("select * from autosell");
                        while (rs.next()) {
                            int vid = rs.getInt(1);
                            String vtype = rs.getString(2);
                            String sid = rs.getString(3);
                            String cname = rs.getString(4);
                            String vname = rs.getString(5);
                            String ryear = rs.getString(6);
                            String mileage = rs.getString(7);
                            String trans = rs.getString(8);
                            String ftype = rs.getString(9);
                            String eprice = rs.getString(10);
                            String email = rs.getString(11);
                            String mobile = rs.getString(12);
                            String desc = rs.getString(13);
                            String img = rs.getString(14);
                %>
                <div class="col" style="margin-top: 30px;">
                    <div class="card h-100">
                        <img src="assests/images/autosell/<%=img%>" class="card-img-top" alt="Vehicle Image">
                        <div class="card-body">
                            <h5 class="card-title"><%=cname%> <%= vname%></h5>
                            <p class="card-text"><b>Description</b>: <%= desc%></p>
                            <a href="moredetails.jsp?id=<%=vid%>" class="btn btn-primary">More Details</a>
                        </div>
                    </div>
                </div>
                <% }
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
            </div>
        </div>
        <!-- End Card -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

