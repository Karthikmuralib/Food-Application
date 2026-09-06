<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Restaurants</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="swadexpress.css">

    <style>
        body { background-color: #F1F1F1; font-family: 'Poppins', sans-serif; color: #3E4E5E; margin:0; padding:0; }
        .navbar { background: #FF6F91; }
        .navbar-brand { font-weight: bold; font-size: 28px; }
        .btn-logout { background:#FFD166; color:#3E4E5E; border-radius:25px; font-weight:bold; }
        .btn-logout:hover { background:#FF6F91; color:white; }
        .restaurant-card { border-radius: 18px; overflow: hidden; background: white; cursor: pointer; transition: transform .3s; }
        .restaurant-card:hover { transform: scale(1.05); box-shadow: 0 12px 30px rgba(62, 78, 94, .3); border-top: 4px solid #FFD166; }
        .restaurant-card img { width: 100%; height: 200px; object-fit: cover; }
        .card-title { font-size: 1.3rem; font-weight: 600; }
        .restaurant-details p { font-size: 0.95rem; color: #555; }
        footer { text-align:center; padding:15px; background:#FF6F91; color:white; margin-top:50px; }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>

    <div class="ms-auto d-flex align-items-center">
        <%
            if (username != null) {
        %>
            <span class="text-white me-3">Hello, <b><%= username %></b></span>
            <a href="LogoutServlet" class="btn btn-logout">Logout</a>
        <%
            } else {
        %>
            <a href="LoginServlet" class="btn btn-logout">Login</a>
            <a href="RegisterServlet" class="btn btn-logout">Register</a>
        <%
            }
        %>
    </div>
</nav>

<!-- RESTAURANT LIST -->
<!-- WELCOME MESSAGE -->
<div class="container mt-4">
    <h1 class="text-center fw-bold mb-4">Great food, delivered your way</h1>
</div>
<div class="container mt-4">
    <h2 class="text-center fw-bold mb-4">Popular Restaurants</h2>
    <div class="row g-4">
        <%
            List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
            if (restaurants != null && !restaurants.isEmpty()) {
                for (Restaurant r : restaurants) {
                    String imagePath = r.getImagePath();
                    if (imagePath == null || imagePath.isEmpty()) {
                        imagePath = "Images/spicegarden.jpg";
                    }
        %>
        <div class="col-sm-6 col-md-4 col-lg-3">
            <div class="card restaurant-card shadow-sm">
                <a href="menu?restaurantId=<%=r.getRestaurantid()%>" style="text-decoration:none;color:black;">
                    <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="Restaurant Image">
                    <div class="card-body restaurant-details">
                        <h4 class="card-title"><%= r.getName() %></h4>
                        <p><%= r.getAddress() %></p>
                        <p>⭐ <%= r.getRating() %></p>
                        <p><b>Cuisine:</b> <%= r.getCuisineType() %></p>
                        <p><b>ETA:</b> <%= r.getEta() %> mins</p>
                    </div>
                </a>
            </div>
        </div>
        <%  } } else { %>
            <p class="text-center text-danger">😋 “We’re cooking something special for you… stay hungry!”.</p>
        <% } %>
    </div>
</div>

<footer>© 2026 CraveRoute | Fresh food from kitchens worth knowing.</footer>

</body>
</html>
