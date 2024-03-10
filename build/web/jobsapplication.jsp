<%-- 
    Document   : jobsapplication
    Created on : 10-Mar-2024, 3:48:29 pm
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
<%! String id, job_title, name, email, mobile, experience, resume;%>
<%
    try {
        Connection cn = CreateConnection.getConnection();
        Statement smt = cn.createStatement();
        ResultSet rs = smt.executeQuery("SELECT * FROM job_application;");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Jobs Application - Vehicle Valley</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="assests/style/profile.css">
        <style>
            /* Add your custom styles here */
            .table {
                width: 100%;
            }
            .table th, .table td {
                text-align: center;
            }
            .table th:first-child, .table td:first-child {
                text-align: left;
            }
            .table img {
                width: 100px;
                cursor: pointer;
            }
            .modal-content img {
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-fixed-top" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="adminhome.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="adminhome.jsp" style="color: white; text-decoration: none; margin: 15px;">Admin Home</a>
            </div>
        </nav>
        <!-- Navbar End -->

        <div class="container mt-5">
            <!-- Table -->
            <h2 style="text-align: center; margin: 30px;">Application For Jobs</h2>
            <table class="table table-striped table-bordered">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Job Title</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Experience</th>
                        <th>Resume PDF</th>
                        <th>Accept</th>
                        <th>Rejected</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {
                            id = rs.getString(1);
                            job_title = rs.getString(2);
                            name = rs.getString(3);
                            email = rs.getString(4);
                            mobile = rs.getString(5);
                            experience = rs.getString(6);
                            resume = rs.getString(7);
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=job_title%></td>
                        <td><%=name%></td>
                        <td><%=email%></td>
                        <td><%=mobile%></td>
                        <td><%=experience%></td>
                        <td>
                            <a href="assests/resume/<%=resume%>" style="color:purple; text-decoration: none;">Resume</a>
                        </td>
                        <td>
                            <a href="Approved?email=<%=email%>&name=<%=name%>&job=<%=job_title%>" style="text-decoration: none;">Approve</a>
                        </td>
                        <td> 
                            <a href="Rejected?email=<%=email%>&name=<%=name%>&job=<%=job_title%>" style="text-decoration: none;">Rejected</a>
                        </td>
                    </tr>
                    <%
                            }
                            CreateConnection.closeConnection();
                        } catch (Exception e) {
                            out.println(e.getMessage());
                        }
                    %>
                </tbody>
            </table>
            <!-- Table End -->
        </div>

        <!-- Modal -->
        <div id="imageModal" class="modal fade">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <img src="" class="modal-img" alt="License Image">
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal End -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
