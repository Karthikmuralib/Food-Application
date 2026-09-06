<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Orders" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Order Placed</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="swadexpress.css">

</head>

<body class="app-page thankyou-page">

<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
</nav>

<main class="thankyou-shell">
<section class="thankyou-card">
    <div class="success-mark" aria-hidden="true">✓</div>
    <p class="eyebrow">ORDER CONFIRMED</p>
    <h1>Order successful</h1>
    <p>Thank you for ordering from <strong>CraveRoute.</strong></p>
    <p>Your delicious food is on the way.</p>

    <%
        Orders order = (Orders) session.getAttribute("order");
        if (order != null) {
    %>

    <div class="order-info">
        <div><span>Order ID</span><strong><%= order.getOrderId() %></strong></div>
        <div><span>Total Paid</span><strong>₹ <%= order.getTotalAmount() %></strong></div>
    </div>

    <% } %>

    <a href="home" class="btn-home">Back to Home</a>
</section>
</main>

</body>
</html>
