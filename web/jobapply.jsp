<%-- 
    Document   : jobapply
    Created on : 10-Mar-2024, 10:48:10 am
    Author     : neera
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    com.vehiclevalley.logincheck.LoginCheck.checklogin(request, response);
%>
<%
    String jobtitle = request.getParameter("title");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Job Post - Vehicle Valley</title>

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
                        <h1>Apply For Job</h1>
                    </div>
                    <div class="formbg-outer">
                        <div class="formbg">
                            <div class="formbg-inner padding-horizontal--48">
                                <!--<span class="padding-bottom--15">Sign in to your account</span>-->

                                <form id="stripe-login" action="Job?action=applyjob" method="post">
                                    
                                    <!--<div class="field padding-bottom--24">-->
                                    <!--<label for="name">Job Title / Name</label>-->
                                    <input type="text" name="jobtitle" value="<%=jobtitle%>" placeholder="<%=jobtitle%>" required="" hidden="" readonly="">
                                    <!--</div>-->
                                    
                                    <div class="field padding-bottom--24">
                                        <label for="name">Name</label>
                                        <input type="text" name="name" value="${name}" required="" readonly="">
                                    </div>
                                    
                                    <div class="field padding-bottom--24">
                                        <label for="experience">Experience</label>
                                        <select class="form-select" aria-label="Default select example" name="experience">
                                            <option selected>Choose Experience</option>
                                            <option value="Fresher">Fresher</option>
                                            <option value="Below 6 Month">Below 6 Month</option>
                                            <option value="1 Year">1 Year</option>
                                            <option value="2 Year">2 Year</option>
                                            <option value="5 Year">5 Year or 5+ Year Experience</option>
                                        </select>
                                    </div>
                                    
                                    <div class="field padding-bottom--24">
                                        <label for="email">Email</label>
                                        <input type="email" name="email" value="${email}" required="" readonly="">
                                    </div>
                                    
                                    <div class="field padding-bottom--24">
                                        <label for="mobile">Mobile</label>
                                        <input type="mobile" name="mobile" pattern="[6789][0-9]{9}" maxlength="10" value="${mobile}" required="" readonly="">
                                    </div>
                                    
                                    <div class="mb-3 form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                                        <label class="form-check-label" for="exampleCheck1">I Agree</label>
                                    </div>
                                    <div class="field padding-bottom--24">
                                        <input type="submit" name="submit" value="Apply">
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

                           

