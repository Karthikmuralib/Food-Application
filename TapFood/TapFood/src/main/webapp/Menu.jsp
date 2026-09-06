<%@ page language="java" contentType="text/html; charset=UTF-8" 
    import="java.util.List, com.tap.model.Menu" %>

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
    <title>CraveRoute - Menu</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="swadexpress.css">

    <style>
        /* BODY & FONT */
        body {
            background-color: #F1F1F1;
            font-family: 'Poppins', sans-serif;
            color: #3E4E5E;
            margin: 0; 
            padding: 0;
        }

        /* NAVBAR */
        .navbar { background: #FF6F91; }
        .navbar-brand { font-weight: bold; font-size: 28px; }

        /* PAGE HEADER */
        h2 { text-align:center; font-weight:700; margin-bottom:35px; color:#3E4E5E; }

        /* COMMON CARD */
        .card-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card {
            border-radius: 18px;
            overflow: hidden;
            transition: transform .3s;
            background: white;
            cursor: pointer;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 30px rgba(62,78,94,0.3);
        }

        .card-title { font-size: 1.3rem; font-weight:600; color:#3E4E5E; }
        .card-text { font-size:0.95rem; color:#555; }
        .price { font-weight:bold; font-size:1.1rem; color:#FF6F91; }

        /* BUTTONS */
        .btn-cart {
            width: 100%;
            background-color: #FFD166;
            color: #3E4E5E;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px;
            border: none;
            transition: 0.3s;
        }
        .btn-cart:hover {
            background-color: #FF6F91;
            color: white;
        }

        .btn-back {
            background-color: #FF6F91;
            border-radius: 25px;
            font-weight: bold;
            padding: 12px 30px;
            margin-top: 30px;
            color: white;
            transition: 0.3s;
        }
        .btn-back:hover {
            background-color: #FFD166;
            color: #3E4E5E;
        }

        /* FOOTER */
        footer {
            text-align:center; 
            padding:15px; 
            background:#FF6F91; 
            color:white; 
            margin-top:50px;
        }
    </style>
</head>
<body class="app-page menu-page">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
</nav>

<main class="menu-shell">
    <aside class="menu-sidebar">
        <span class="menu-badge">★ CraveRoute Plus</span>
        <p class="menu-rating">★ 5 <span>(200+ ratings)</span></p>
        <p class="menu-meta">25 min &nbsp;·&nbsp; ₹₹₹ &nbsp;·&nbsp; Indian</p>
        <span class="menu-favorite">Customer favorite</span>
        <div class="menu-location">📍 Koramangala, Bengaluru</div>
        <p class="menu-fees">ⓘ Service fees apply — pricing &amp; fees</p>
        <button type="button" class="menu-see-more">See more</button>
        <div class="menu-hours">
            <strong>FULL MENU</strong>
            <b>11:00 am – 10:00 pm</b>
        </div>
        <nav class="menu-sections" aria-label="Menu sections">
            <a href="#popular">Most Liked Items From The Menu</a>
            <a href="#popular">Reviews</a>
            <a href="#popular">Full Menu</a>
            <a href="#popular">Appetizers</a>
            <a class="active" href="#popular">Mains</a>
            <a href="#popular">Breads &amp; Rice</a>
            <a href="#popular">Desserts &amp; Drinks</a>
        </nav>
    </aside>

    <section class="menu-content" id="popular">
    <h2>Choose something worth craving</h2>
    <div class="menu-list">
        <%
            List<Menu> menus = (List<Menu>) request.getAttribute("menus");
            if (menus != null && !menus.isEmpty()) {
                for (Menu m : menus) {
        %>
        <article class="menu-item">
            <img src="<%= request.getContextPath() + "/" + m.getImagePath() %>" class="menu-item-image" alt="<%= m.getName() %>">
            <div class="menu-item-copy">
                <h5 class="card-title"><%= m.getName() %></h5>
                <p class="card-text"><%= m.getDescription() %></p>
            </div>
            <div class="menu-item-action">
                <p class="price">₹ <%= m.getPrice() %></p>

                    <form action="cart" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="itemId" value="<%= m.getMenuId() %>">
                        <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="btn btn-cart" aria-label="Add <%= m.getName() %> to cart">+</button>
                    </form>
            </div>
        </article>
        <%
                }
            } else {
        %>
        <p class="text-center text-danger mt-4">😋 We’re cooking something amazing… stay tuned!</p>
        <%
            }
        %>
    </div>

    <div class="text-center">
        <a href="home" class="btn btn-back">🏠 Back to Home</a>
    </div>
    </section>
</main>

<footer>© 2026 CraveRoute | Good food is always in season.</footer>
</body>
</html>
