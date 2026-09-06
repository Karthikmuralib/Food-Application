<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Cart</title>

    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="swadexpress.css">

<style>
    body {
        background-color: #F1F1F1;
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
    }

    /* NAVBAR */
    .navbar { background: #FF6F91; }
    .navbar-brand { font-weight: bold; font-size: 28px; }
    .navbar .btn-light {
        color: #FF6F91;
        font-weight: bold;
    }

    /* CART CONTAINER */
    .cart-container {
        max-width: 900px;
        margin: 40px auto;
        display: flex;
        flex-direction: column;
        gap: 20px;
        padding: 0 20px;
    }

    .item-card {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        padding: 17px 20px;
        transition: transform 0.2s;
    }

    .item-card:hover {
        transform: scale(1.02);
        border-top: 4px solid #FFD166;
    }

    .item-details strong {
        font-size: 18px;
    }

    .item-details .price {
        font-size: 16px;
        color: #FF6F91;
        margin-top: 5px;
        font-weight: bold;
    }

    .qty-box {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .qty-box button {
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: bold;
        background: #FFD166;
        color: #3E4E5E;
        transition: 0.2s;
    }

    .qty-box button:hover:not(:disabled) {
        background: #FF6F91;
        color: white;
    }

    .qty-box button:disabled {
        background: #ccc;
        cursor: not-allowed;
    }

    .remove-btn {
        background: #FF4B5C !important;
        color: white !important;
    }

    .remove-btn:hover {
        background: #c82333 !important;
    }

    .total {
        text-align: right;
        font-size: 22px;
        font-weight: bold;
        color: #3E4E5E;
        margin-top: 10px;
        margin-right: 10px;
    }

    /* BUTTONS ONE BY ONE */
    .btn-bottom {
        display: flex;
        flex-direction: column;  /* makes buttons come one by one */
        gap: 15px;               /* spacing between buttons */
        margin-top: 25px;
    }

    .btn-add, .btn-checkout {
        width: 100%;             /* full width buttons */
        text-align: center;
        padding: 12px 25px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
    }

    .btn-add {
        background: #FFD166;
        color: #3E4E5E;
    }

    .btn-add:hover {
        background: #FF6F91;
        color: white;
    }

    .btn-checkout {
        background: #28A745;
        color: white;
    }

    .btn-checkout:hover {
        background: #218838;
    }

    h2 {
        text-align: center;
        color: #3E4E5E;
        font-weight: 700;
        margin-bottom: 20px;
    }

    h3 {
        text-align: center;
        color: #6c757d;
    }

    /* FOOTER */
    footer {
        text-align: center;
        padding: 15px;
        background: #FF6F91;
        color: white;
        margin-top: 50px;
    }
</style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
</nav>

<div class="cart-container">

    <h2>Your Cart</h2>

    <%
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
    %>

        <h3>Your cart is empty 🛒</h3>

    <%  } else {
            Map<Integer, CartItem> items = cart.getItems();
            int restaurantId = (Integer) session.getAttribute("restaurantId");
    %>

    <% for (CartItem item : items.values()) { %>
    <div class="item-card">

        <div class="item-details">
            <strong><%= item.getName() %></strong>
            <div class="price">₹ <%= item.getPrice() %></div>
        </div>

        <div class="qty-box">

            <!-- MINUS -->
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                <input type="hidden" name="action" value="update">
                <button type="submit" <% if(item.getQuantity() == 1) { %> disabled <% } %>>-</button>
            </form>

            <strong><%= item.getQuantity() %></strong>

            <!-- PLUS -->
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                <input type="hidden" name="action" value="update">
                <button type="submit">+</button>
            </form>

            <!-- REMOVE -->
            <form action="cart" method="post" style="display:inline;">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="itemId" value="<%= item.getMenuId() %>">
                <input type="hidden" name="action" value="remove">
                <button type="submit" class="remove-btn">Remove</button>
            </form>

        </div>
    </div>
    <% } %>

        <div class="total">Total: ₹ <%= cart.getTotalAmount() %></div>

        <!-- BUTTONS ONE BELOW ANOTHER -->
        <div class="btn-bottom">
            <a href="menu?restaurantId=<%= restaurantId %>" class="btn-add">➕ Add More Items</a>
            <a href="checkout.jsp" class="btn-checkout">✔ Proceed to Checkout</a>
        </div>

    <% } %>

</div>

<footer>
    © 2026 CraveRoute | Your order, your way.
</footer>

</body>
</html>
