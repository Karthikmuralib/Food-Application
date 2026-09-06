<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>CraveRoute - Login</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="swadexpress.css">

    <!-- Custom CSS -->
    <style>
        /* BODY */
        body {
            background-color: #F1F1F1;
            font-family: 'Poppins', sans-serif;
            color: #3E4E5E;
        }

        /* CARD */
        .card {
            border-radius: 18px;
            overflow: hidden;
            border: none;
        }

        .card-header {
            background: #FF6F91 !important;
            text-align: center;
            padding: 25px;
        }

        .card-header h3 {
            margin: 0;
            font-weight: 700;
            color: white;
        }

        /* INPUTS */
        .form-control {
            border-radius: 12px;
            padding: 12px;
            font-size: 15px;
        }

        .form-label {
            font-weight: 600;
            color: #3E4E5E;
        }

        /* LOGIN BUTTON */
        .btn-primary {
            background-color: #FFD166;
            border: none;
            color: #3E4E5E;
            font-weight: bold;
            padding: 12px;
            border-radius: 25px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #FF6F91;
            color: white;
        }

        /* REGISTER LINK */
        a {
            color: #FF6F91;
            font-weight: 600;
            text-decoration: none;
        }

        a:hover {
            color: #FFD166;
        }

        /* ERROR MESSAGE */
        .alert-danger {
            border-radius: 10px;
            font-weight: 600;
        }
    </style>
</head>

<body class="auth-page login-page">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">

                <!-- HEADER -->
                <div class="card-header">
                    <h3>Welcome back</h3>
                </div>

                <div class="card-body">

                    <!-- Error Message -->
                    <% 
                       String error = (String) request.getAttribute("error");
                       if (error != null) { 
                    %>
                        <div class="alert alert-danger text-center"><%= error %></div>
                    <% } %>

                    <!-- LOGIN FORM -->
                    <form action="LoginServlet" method="post">

                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input 
                                type="text" 
                                name="username" 
                                id="username" 
                                class="form-control" 
                                required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input 
                                type="password" 
                                name="password" 
                                id="password" 
                                class="form-control" 
                                required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            Login
                        </button>
                    </form>

                    <!-- REGISTER LINK -->
                    <div class="mt-3 text-center">
                        <a href="register.jsp">New user? Register here</a>
                    </div>

                </div><!-- card-body -->
            </div><!-- card -->
        </div>
    </div>
</div>

</body>
</html>
