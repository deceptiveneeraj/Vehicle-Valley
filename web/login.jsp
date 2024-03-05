<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Vehicle Valley</title>
        <link rel="stylesheet" href="assests/style/login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="background-image">
            <!--navbar and form inside this div to overlay on the background image-->
            <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary" data-bs-theme="dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                    <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
                </div>
            </nav>

            <form action="LoginSignup?action=login" method="post">
                <h1 style="color: black; padding: 17px; text-align: center;">Login Here</h1>
                
                <!--Here The Error Messages Shown In Red-->
                
                <%
                    String errmessage = (String) session.getAttribute("lerrmess");
                    if (errmessage != null && !errmessage.isEmpty()) {
                %>
                <div id="error" style="color: red; font-weight: bold; font-size: 18.5px; text-align: center; margin-bottom: 18px;">
                    <%= errmessage%>
                </div>
                <%
                        // Clear the session attribute after displaying the error message
                        session.removeAttribute("lerrmess");
                    }
                %>

                
                <!--Here The Successfully Messages Shown In Green-->
                
                <%
                    String smessage = (String) session.getAttribute("register");
                    if (smessage != null && !smessage.isEmpty()) {
                %>
                <div id="error" style="color: green; font-weight: bold; font-size: 17.5px; text-align: center; margin-bottom: 18px;">
                    <%= smessage%>
                </div>
                <%
                        // Clear the session attribute after displaying the error message
                        session.removeAttribute("register");
                    }
                %>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com" required="">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required="">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <br><br>
                <label><a href='forgot.jsp' style="text-decoration: none; color: green; font-size: 20px;">Forgot Password</a></label>
                <br>
                <label>Don't have an account ? <a href="signup.jsp" style="text-decoration: none;">Registered Here</a></label>
            </form>
        </div>
    </body>
    <script>
        // Function to clear error message after 5 seconds
        setTimeout(function () {
            document.getElementById('error').style.display = 'none';
        }, 10000); // 10000 milliseconds = 5 seconds

    </script>
</html>
