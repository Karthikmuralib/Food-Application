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

    <style>
        /* NAVBAR */
        .navbar { background: #FF6F91; }
        .navbar-brand { font-weight: bold; font-size: 26px; }
        
        /* BODY */
        body {
            background-color: #F1F1F1;
            font-family: 'Poppins', sans-serif;
        }

        /* MAIN CARD */
        .confirmation-box {
            max-width: 650px;
            margin: 40px auto;
            background: #fff;
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        h2 {
            font-weight: 700;
            color: #3E4E5E;
            text-align: center;
            margin-bottom: 20px;
        }

        .info-label { font-weight: 600; color: #333; }

        .item-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
            color: #444;
        }

        .total {
            text-align: right;
            font-weight: 700;
            font-size: 20px;
            color: #FF6F91;
            margin-top: 20px;
        }

        .btn-home {
            background-color: #FF6F91;
            color: white;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 10px;
            margin-top: 25px;
            display: block;
            text-align: center;
            transition: 0.3s;
        }

        .btn-home:hover {
            background-color: #FFD166;
            color: #3E4E5E;
        }

        /* FOOTER */
        footer {
            text-align: center;
            padding: 12px;
            background: #FF6F91;
            color: white;
            margin-top: 40px;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand" href="home">CraveRoute</a>
</nav>

<div class="confirmation-box">

    <h2>Order Confirmation ✅</h2>

    <%
        Orders order = (Orders) session.getAttribute("order");
        Map<Integer, CartItem> items = (Map<Integer, CartItem>) session.getAttribute("orderItems");

        if(order != null && items != null){
    %>

    <p><span class="info-label">Order ID:</span> <%= order.getOrderId() %></p>
    <p><span class="info-label">Order Date:</span> <%= order.getOrderDate() %></p>
    <p><span class="info-label">Delivery Address:</span> <%= order.getAddress() %></p>
    <p><span class="info-label">Payment Method:</span> <%= order.getPaymentMode() %></p>

    <h4 class="mt-4">Items Ordered:</h4>

    <div>
            <% for(CartItem item : items.values()){ %>
            <div class="item-row">
                <span><%= item.getName() %> x <%= item.getQuantity() %></span>
                <span>₹ <%= item.getPrice() * item.getQuantity() %></span>
            </div>
        <% } %>
    </div>

    <div class="total">Total Amount: ₹ <%= order.getTotalAmount() %></div>

    <a href="menu.jsp" class="btn-home">Back to Menu</a>

    <%
        } else {
    %>
        <h3 class="text-center text-danger">No order found!</h3>
        <a href="menu.jsp" class="btn-home">Back to Menu</a>
    <%
        }
    %>

</div>

<footer>© 2026 CraveRoute | Thanks for ordering.</footer>

</body>
</html>
