<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FoddyBites - Checkout</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        /* NAVBAR */
        .navbar { background: #FF6F91; }
        .navbar-brand { font-weight: bold; font-size: 28px; }
        .navbar .btn-light {
            color: #FF6F91;
            font-weight: bold;
        }

        /* BODY & FONT */
        body {
            background-color: #F1F1F1;
            font-family: 'Poppins', sans-serif;
            padding-bottom: 40px;
        }

        /* MAIN CONTAINER */
        .checkout-box {
            max-width: 600px;
            margin: 40px auto;
            background: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            color: #3E4E5E;
        }

        .form-label {
            font-weight: bold;
            color: #444;
        }

        textarea, select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        textarea:focus, select:focus {
            outline: none;
            border-color: #FF6F91;
            box-shadow: 0 0 5px rgba(255, 111, 145, 0.4);
        }

        .btn-order {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            margin-top: 15px;
            transition: 0.3s;
        }

        .btn-order:hover {
            background-color: #218838;
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
    <a class="navbar-brand" href="home">JavaBites</a>
</nav>

<div class="checkout-box">
    <h2>Checkout</h2>

    <form action="checkout" method="post">

        <!-- Address -->
        <div class="mb-3">
            <label class="form-label">Delivery Address</label>
            <textarea name="address" rows="3" required></textarea>
        </div>

        <!-- Payment Method -->
        <div class="mb-3">
            <label class="form-label">Payment Method</label>
            <select name="paymentMethod" required>
                <option value="" disabled selected>Select Payment Method</option>
                <option value="Cash on Delivery">Cash on Delivery</option>
                <option value="UPI">UPI</option>
                <option value="Card Payment">Card Payment</option>
            </select>
        </div>

        <button type="submit" class="btn-order">✔ Place Order</button>

    </form>
</div>

<footer>© 2025 JavaBites | Designed by Annapurna ❤</footer>

</body>
</html>
