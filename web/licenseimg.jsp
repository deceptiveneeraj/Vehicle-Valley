<%-- 
    Document   : licenseimg
    Created on : 04-Mar-2024, 8:38:19 pm
    Author     : neera
--%>

<%-- 
    Document   : rentrequest
    Created on : 04-Mar-2024, 6:54:16 pm
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
<%!
    int id;
    String limg;
%>
<%
    id = Integer.parseInt(request.getParameter("id"));
    try {
        Connection cn = CreateConnection.getConnection();
        Statement smt = cn.createStatement();
        ResultSet rs = smt.executeQuery("SELECT * FROM booknow WHERE id = " + id);
        if(rs.next()) {
            limg = rs.getString(11);
        }
        CreateConnection.closeConnection();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Vehicle Valley</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <style>
            /* Custom CSS to center the image */
            .center-image {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-fixed-top" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="adminhome.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="adminhome.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>
        </nav>
        <!-- Navbar End -->
        <div class="center-image">
            <img src="assests/images/license/<%= limg%>" class="license-img" alt="License Image">
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
