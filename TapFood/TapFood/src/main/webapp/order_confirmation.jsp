<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Orders" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Order Confirmation</title>

    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="swadexpress.css">

</head>

<body class="app-page confirmation-page">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
</nav>

<main class="confirmation-shell">
    <header class="confirmation-heading">
        <div class="success-mark" aria-hidden="true">✓</div>
        <p class="eyebrow">ORDER CONFIRMED</p>
        <h1>Order confirmed!</h1>
        <p>Thanks for ordering with CraveRoute — your food is being prepared.</p>
    </header>

    <%
        Orders order = (Orders) session.getAttribute("order");
        Map<Integer, CartItem> items = (Map<Integer, CartItem>) session.getAttribute("orderItems");

        if(order != null && items != null){
    %>

    <div class="confirmation-layout">
        <section class="confirmation-main">
            <div class="delivery-banner">
                <span class="section-icon">◷</span>
                <div><strong>Estimated delivery</strong><small>Your order will arrive hot and fresh</small></div>
                <b>35 mins<small>ETA</small></b>
            </div>
            <div class="status-card">
                <p class="eyebrow">ORDER STATUS</p>
                <div class="status-track">
                    <span class="status-node done">✓<small>Placed</small></span>
                    <span class="status-progress"></span>
                    <span class="status-node active">⌂<small>Preparing</small></span>
                    <span class="status-progress muted"></span>
                    <span class="status-node">▣<small>On the way</small></span>
                    <span class="status-progress muted"></span>
                    <span class="status-node">⌂<small>Delivered</small></span>
                </div>
            </div>
            <a href="menu?restaurantId=<%= order.getRestaurantId() %>" class="btn-home">Back to Menu</a>
        </section>

        <aside class="confirmation-summary">
            <h3>ORDER SUMMARY</h3>
            <p class="summary-detail">Order #<%= order.getOrderId() %> · <%= order.getPaymentMode() %></p>
            <% for(CartItem item : items.values()){ %>
            <div class="item-row">
                <span><%= item.getName() %> <small>× <%= item.getQuantity() %></small></span>
                <strong>₹ <%= item.getPrice() * item.getQuantity() %></strong>
            </div>
            <% } %>
            <div class="total"><span>Total paid</span><strong>₹ <%= order.getTotalAmount() %></strong></div>
            <div class="summary-address"><span>⌂</span><div><strong>Delivering to</strong><small><%= order.getAddress() %></small></div></div>
        </aside>
    </div>

    <%
        } else {
    %>
        <section class="confirmation-empty">
            <h3>No order found!</h3>
            <a href="menu.jsp" class="btn-home">Back to Menu</a>
        </section>
    <%
        }
    %>

</main>

<footer>© 2026 CraveRoute | Thanks for ordering.</footer>

</body>
</html>
