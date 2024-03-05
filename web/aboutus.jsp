<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - Vehicle Valley</title>
        <link rel="stylesheet" href="assets/style/aboutus.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <style>
            .about-section {
                padding: 50px;
                text-align: center;
                background-color: #474e5d;
                color: white;
            }

            .card {
                margin-bottom: 20px;
            }

            .card-title {
                margin-bottom: 0.5rem;
            }

            .card-text {
                color: #6c757d;
            }

            .btn-dark {
                background-color: #343a40;
                border-color: #343a40;
            }

            .btn-dark:hover {
                background-color: #212529;
                border-color: #212529;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp" >Vehicle Valley</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
<!--                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp" style="color:white;">Home</a>
                        </li>-->
                    </ul>
                </div>
            </div>
        </nav>
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar fixed-top bg-body-tertiary"data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp" style="color: white; font-size: 25px; margin-right: 30px;">Vehicle Valley</a>
                <a href="index.jsp" style="color: white; text-decoration: none; margin: 15px;">Home</a>
            </div>
        </nav>
        <div class="about-section">
            <h1>About Us Page</h1>
            <!--<p>Some text about who we are and what we do.</p>-->
            <p>Welcome to Vehicle Valley, your premier destination for buying, selling, and renting vehicles. With a focus on customer satisfaction, we offer a seamless platform for hassle-free transactions. Whether you're looking to upgrade, buy, sell, or rent, Vehicle Valley has you covered.</p>
        </div>

        <h2 class="text-center" style="margin:40px;">Our Team</h2>
        <div class="container">
            <div class="row justify-content-center">

                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="assests/images/aboutus/neera.jpeg" class="img-fluid rounded-start" alt="Neeraj">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Neeraj</h5>
                                <p class="card-text">Java Web Developer</p>
                                <p class="card-text">Here I work as a Frontend and Backend Developer.</p>
                                <p class="card-text"><small class="text-body-secondary">solankineeraj39@gmail.com</small></p>
                                <a href="https://www.linkedin.com/in/neeraj-solanki-a776b620b/"><button class="btn btn-primary">Linkedin</button></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="assests/images/aboutus/anju.jpeg" class="img-fluid rounded-start" alt="Neeraj">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Anjali</h5>
                                <p class="card-text">Java Web Developer</p>
                                <p class="card-text">Here I work as a Frontend and Backend Developer.</p>
                                <p class="card-text"><small class="text-body-secondary">anjuujjaini@gmail.com</small></p>
                                <a href="https://www.linkedin.com/in/anjali-ujjaini-8982anjali/"><button class="btn btn-primary">Linkedin</button></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
