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
<%! String id, name, email, mobile, sdate, stime, edate, etime, city, vinfo, limg;%>
<%
    try {
        Connection cn = CreateConnection.getConnection();
        Statement smt = cn.createStatement();
        ResultSet rs = smt.executeQuery("SELECT * FROM booknow;");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile - Vehicle Valley</title>
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
                <a href="adminhome.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>
        </nav>
        <!-- Navbar End -->

        <div class="container mt-5">
            <!-- Table -->
            <h2 style="text-align: center; margin: 30px;">Booking Requests</h2>
            <table class="table table-striped table-bordered">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Start Date</th>
                        <th>Start Time</th>
                        <th>End Date</th>
                        <th>End Time</th>
                        <th>City</th>
                        <th>Vehicle Info</th>
                        <th>License Image</th>
                        <th>Confirm Booking</th>
                        <th>Cancel Booking</th>
                    </tr>
                </thead>
                <tbody>
                    <%while (rs.next()) {
                            id = rs.getString(1);
                            name = rs.getString(2);
                            email = rs.getString(3);
                            mobile = rs.getString(4);
                            sdate = rs.getString(5);
                            stime = rs.getString(6);
                            edate = rs.getString(7);
                            etime = rs.getString(8);
                            city = rs.getString(9);
                            vinfo = rs.getString(10);
                            limg = rs.getString(11);
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=name%></td>
                        <td><%=email%></td>
                        <td><%=mobile%></td>
                        <td><%=sdate%></td>
                        <td><%=stime%></td>
                        <td><%=edate%></td>
                        <td><%=etime%></td>
                        <td><%=city%></td>
                        <td><%=vinfo%></td>
                        <td>
                            <a href="licenseimg.jsp?id=<%=id%>"><img src="assests/images/license/<%= limg%>" class="license-img" alt="License Image"></a>
                        </td>
                        <td>
                            <a href="ConfirmBooking?email=<%=email%>&name=<%=name%>">Confirm Booking</a>
                        </td>
                        <td> 
                            <a href="CancelBooking?email=<%=email%>&name=<%=name%>">Cancel Booking</a>
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
