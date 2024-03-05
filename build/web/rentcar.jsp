<%-- 
    Document   : rentcar.jsp
    Created on : 28-Feb-2024, 9:30:37 pm
    Author     : neera
--%>

<%@page import="com.vehiclevalley.connection.CreateConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                <%! int vid; String cname, vname, mileage, trans, ftype, scapacity, eprice, img; String desc;%>
                <% try {
                        Connection cn = CreateConnection.getConnection();
                        Statement smt = cn.createStatement();
                        ResultSet rs = smt.executeQuery("select * from rentcar");
                        while (rs.next()) {
                            vid = rs.getInt(1);
                            cname = rs.getString(2);
                            vname = rs.getString(3);
                            mileage = rs.getString(4);
                            trans = rs.getString(5);
                            ftype = rs.getString(6);
                            scapacity = rs.getString(7);
                            eprice = rs.getString(8);
                            img = rs.getString(9);
                %>
                <div class="col" style="margin-top: 30px;">
                    <div class="card h-100">
                        <img src="assests/images/rentcar/<%= img%>" class="card-img-top" alt="Vehicle Image">
                        <div class="card-body">
                            <h5 class="card-title"><%=cname%> <%=vname%></h5>
                            <p class="card-title"><b>Description:</b> Mileage <%=mileage%> kmpl, Transmission: <%=trans%>, Fuel Type: <%=ftype%>, Sitting Capacity: <%=scapacity%></p>
                            <h5 class="card-text">Rent Price:<b> <%= eprice%></b>  RS Per Day</h5>
                            <a href="booknow.jsp?type=Car&id=<%=vid%>" class="btn btn-primary">Book Now</a>
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

