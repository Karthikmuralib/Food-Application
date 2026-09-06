<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.dao.OrdersDAO, com.tap.model.Orders, com.tap.model.User, com.tap.model.daoimpl.OrdersDAOImpl" %>
<%
        User historyUser = (User) session.getAttribute("loggedInUser");
        Integer historyUserId = (Integer) session.getAttribute("userId");
        String sessionUsername = (String) session.getAttribute("username");
        if (historyUser == null && historyUserId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    OrdersDAO historyDao = new OrdersDAOImpl();
        int resolvedUserId = historyUser != null ? historyUser.getUserid() : historyUserId;
        List<Orders> orders = historyDao.getAllOrders(resolvedUserId);
        String historyName = historyUser != null && historyUser.getName() != null
            ? historyUser.getName() : sessionUsername;
        String historyEmail = historyUser != null && historyUser.getEmail() != null
            ? historyUser.getEmail() : "CraveRoute customer";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Order History</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="swadexpress.css">
</head>
<body class="app-page history-page">
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
    <div class="account-nav-links">
        <a href="home">Restaurants</a>
        <a href="account.jsp">Account settings</a>
        <a href="LogoutServlet" class="account-logout">Log out</a>
    </div>
</nav>

<main class="history-shell">
    <aside class="account-sidebar">
        <div class="profile-avatar"><%= historyName.substring(0, 1).toUpperCase() %></div>
        <h1><%= historyName %></h1>
        <p><%= historyEmail %></p>
        <nav class="account-menu">
            <a href="account.jsp">◉ <span>Personal info</span></a>
            <a class="active" href="order_history.jsp">◷ <span>Order history</span></a>
            <a href="account.jsp#promos">◇ <span>Promo codes</span></a>
            <a href="account.jsp#connected">⊕ <span>Connected accounts</span></a>
            <a href="account.jsp#payments">▣ <span>Payments &amp; shipping</span></a>
            <a href="account.jsp#security">▢ <span>Login &amp; security</span></a>
        </nav>
        <a class="account-menu logout-link" href="LogoutServlet">⇥ <span>Log out</span></a>
    </aside>

    <section class="history-content">
        <section class="account-panel">
            <p class="eyebrow">YOUR ORDERS</p>
            <h2>Order history</h2>
            <p class="panel-lead">Your past orders with CraveRoute.</p>
            <% if (orders != null && !orders.isEmpty()) { %>
                <% for (Orders order : orders) { %>
                <article class="history-order">
                    <div class="history-order-heading">
                        <div><h3>CraveRoute restaurant</h3><span><%= order.getOrderDate() %></span></div>
                        <em class="status-<%= order.getStatus() != null ? order.getStatus().toLowerCase() : "pending" %>"><%= order.getStatus() != null ? order.getStatus() : "Pending" %></em>
                    </div>
                    <div class="history-order-details">
                        <span>Order #<%= order.getOrderId() %></span>
                        <span><%= order.getPaymentMode() %></span>
                        <strong>₹ <%= order.getTotalAmount() %></strong>
                    </div>
                    <p class="history-address"><%= order.getAddress() %></p>
                </article>
                <% } %>
            <% } else { %>
                <div class="history-empty"><span>◷</span><h3>No orders yet</h3><p>Your next great meal is waiting.</p><a href="home">Browse restaurants</a></div>
            <% } %>
        </section>
    </section>
</main>
</body>
</html>
