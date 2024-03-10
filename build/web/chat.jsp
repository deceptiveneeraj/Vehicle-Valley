<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String rid = request.getParameter("id");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chat - Vehicle Valley</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="assets/style/chat.css">
        <!-- Inline Styles -->
        <style>
            /* Additional Styles */
            body {
                padding-top: 70px; /* Adjusted to accommodate the fixed navbar */
            }
            /* Chat Box Styles */
            .chat-box {
                width: 100%;
                max-width: 600px;
                margin: 20px auto;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                overflow-y: auto;
                height: 300px;
                padding: 10px;
            }
            .message {
                padding: 5px 10px;
                margin-bottom: 5px;
                border-radius: 10px;
            }
            .sent-message {
                text-align: right;
                color: #fff;
                background-color: #007bff;
            }
            .received-message {
                text-align: left;
                color: #000;
                background-color: #f0f0f0;
            }
            /* Navbar Styles */
            .navbar {
                background-color: #343a40; /* Dark navbar background color */
            }
            .navbar-brand, .nav-link {
                color: white !important; /* Navbar text color */
            }
            .navbar-brand {
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
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

        <!-- Chat Box -->
        <div class="container mt-5">
            <div class="chat-box" id="chatBox">
                <!-- Messages will be dynamically added here -->
            </div>
            <form action="Message" method="post" class="mt-3">
                <div class="input-group">
                    <input type="text" name="sender_id" value="${id}" hidden="">
                    <input type="text" name="receiver_id" value="<%=rid%>" hidden="">
                    <input type="text" name="message" id="message" class="form-control" placeholder="Type your message...">
                    <button type="submit" class="btn btn-primary">Send</button>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS (Optional) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
