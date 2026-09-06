<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User" %>
<%
    User accountUser = (User) session.getAttribute("loggedInUser");
    String accountName = accountUser != null && accountUser.getName() != null
            ? accountUser.getName() : (String) session.getAttribute("username");
    if (accountName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Account Settings</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="swadexpress.css">
</head>
<body class="app-page account-page">
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
    <div class="account-nav-links">
        <a href="home">Restaurants</a>
        <a href="order_history.jsp">Order history</a>
        <a href="LogoutServlet" class="account-logout">Log out</a>
    </div>
</nav>

<main class="account-shell">
    <aside class="account-sidebar">
        <div class="profile-avatar"><%= accountName.substring(0, 1).toUpperCase() %></div>
        <h1><%= accountName %></h1>
        <p><%= accountUser != null && accountUser.getEmail() != null ? accountUser.getEmail() : "CraveRoute customer" %></p>
        <nav class="account-menu">
            <a class="active" href="account.jsp">◉ <span>Personal info</span></a>
            <a href="order_history.jsp">◷ <span>Order history</span></a>
            <a href="#promos">◇ <span>Promo codes</span></a>
            <a href="#connected">⊕ <span>Connected accounts</span></a>
            <a href="#payments">▣ <span>Payments &amp; shipping</span></a>
            <a href="#security">▢ <span>Login &amp; security</span></a>
        </nav>
        <a class="account-menu logout-link" href="LogoutServlet">⇥ <span>Log out</span></a>
    </aside>

    <section class="account-content">
        <section class="account-panel personal-panel">
            <p class="eyebrow">ACCOUNT SETTINGS</p>
            <h2>Personal information</h2>
            <p class="panel-lead">Keep your delivery details ready for your next order.</p>
            <div class="account-fields">
                <div><span>Full name</span><strong><%= accountName %></strong></div>
                <div><span>Username</span><strong><%= accountUser != null ? accountUser.getUsername() : session.getAttribute("username") %></strong></div>
                <div><span>Email</span><strong><%= accountUser != null && accountUser.getEmail() != null ? accountUser.getEmail() : "Not added yet" %></strong></div>
                <div><span>Phone</span><strong><%= accountUser != null && accountUser.getPhone() != null ? accountUser.getPhone() : "Not added yet" %></strong></div>
                <div class="wide-field"><span>Default address</span><strong><%= accountUser != null && accountUser.getAddress() != null ? accountUser.getAddress() : "Add an address at checkout" %></strong></div>
            </div>
        </section>

        <section class="account-panel" id="promos">
            <h2>Promo codes</h2>
            <p class="panel-lead">Codes you've saved to your account.</p>
            <div class="promo-row"><div><b>WELCOME50</b><span>50% off, up to ₹100 · Expires Aug 31, 2026</span></div><em>Active</em></div>
            <div class="promo-row"><div><b>FREESHIP</b><span>Free delivery on orders above ₹299 · No expiry</span></div><em>Active</em></div>
        </section>

        <section class="account-panel" id="connected">
            <h2>Connected accounts</h2>
            <p class="panel-lead">Sign in faster using accounts you already have.</p>
            <div class="connected-row"><div><b>G</b><span><strong>Google</strong><small>Not connected</small></span></div><button type="button">Connect</button></div>
            <div class="connected-row"><div><b>f</b><span><strong>Facebook</strong><small>Not connected</small></span></div><button type="button">Connect</button></div>
        </section>
    </section>
</main>
</body>
</html>
