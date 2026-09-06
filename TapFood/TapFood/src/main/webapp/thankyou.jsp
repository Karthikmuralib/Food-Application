<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Orders" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CraveRoute - Order Placed</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="stylesheet" href="swadexpress.css">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f8f9fa;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: #ffffff;
            width: 550px;
            padding: 40px;
            text-align: center;
            border-radius: 18px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            animation: fadeIn 0.9s ease-in-out;
        }

        h1 {
            font-size: 40px;
            color: #28a745;
            font-weight: bold;
            margin-bottom: 10px;
            animation: popIn 0.6s ease-out;
        }

        p {
            font-size: 18px;
            color: #444;
            margin-bottom: 10px;
        }

        .order-info {
            background: #e9f7ef;
            padding: 18px;
            border-radius: 10px;
            font-size: 17px;
            margin-top: 18px;
            border-left: 6px solid #28a745;
        }

        .btn-home {
            display: inline-block;
            margin-top: 28px;
            padding: 12px 30px;
            background: #28a745;
            color: white;
            font-size: 18px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.25s ease;
        }

        .btn-home:hover {
            background: #1e7e34;
            transform: scale(1.06);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes popIn {
            from { transform: scale(0.6); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Order Successful 🎉</h1>
    <p>Thank you for ordering from <strong>CraveRoute!</strong></p>
    <p>Your delicious food is on the way 😋</p>

    <%
        Orders order = (Orders) session.getAttribute("order");
        if (order != null) {
    %>

    <div class="order-info">
        <p><strong>Order ID:</strong> <%= order.getOrderId() %></p>
        <p><strong>Total Paid:</strong> ₹ <%= order.getTotalAmount() %></p>
    </div>

    <% } %>

    <a href="home" class="btn-home">🏠 Back to Home</a>
</div>

</body>
</html>
