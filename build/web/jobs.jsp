<%-- 
    Document   : jobs
    Created on : 10-Mar-2024, 9:23:17 am
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
        <title>Jobs - Vehicle Valley</title>
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
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                <%!
                    int jid;
                    String jobname, location, experience, jobdesc;%>
                <% try {
                        Connection cn = CreateConnection.getConnection();
                        Statement smt = cn.createStatement();
                        ResultSet rs = smt.executeQuery("select * from jobs");
                        while (rs.next()) {
                            jid = rs.getInt(1);
                            jobname = rs.getString(2);
                            location = rs.getString(3);
                            experience = rs.getString(4);
                            jobdesc = rs.getString(5);
                %>
                <div class="col" style="margin-top: 30px;">
                    <div class="card border-primary mb-3" style="max-width: 25rem;">

                        <div class="card-header bg-dark border-success text-light" style="text-align: center; font-size: 24px;">Job Title : <%=jobname%></div>
                        <div class="card-body text-success" style="background-color: #F0F8FF;">
                            <h6 class="text-success">Experience : <%=experience%></h6>
                            <h6 class="text-dark">Job Description : <%=jobdesc%></h6>
                            <h6 class="text-danger">Location : <%=location%></h6>
                        </div>
                        <a href="jobapply.jsp?title=<%=jobname%>" style="text-decoration: none;"><div class="card-footer bg-primary border-success text-light" style="text-align: center; font-size: 18px;">Apply Here</div></a>


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



