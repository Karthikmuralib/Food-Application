<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.tap.model.Cart, com.tap.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>CraveRoute - Checkout</title>
    <link rel="icon" type="image/x-icon" href="Images/favicon.ico" />

    <!-- Bootstrap -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="swadexpress.css" />

    <style>
      /* NAVBAR */
      .navbar {
        background: #ff6f91;
      }
      .navbar-brand {
        font-weight: bold;
        font-size: 28px;
      }
      .navbar .btn-light {
        color: #ff6f91;
        font-weight: bold;
      }

      /* BODY & FONT */
      body {
        background-color: #f1f1f1;
        font-family: "Poppins", sans-serif;
        padding-bottom: 40px;
      }

      /* MAIN CONTAINER */
      .checkout-box {
        max-width: 600px;
        margin: 40px auto;
        background: #fff;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      }

      h2 {
        text-align: center;
        margin-bottom: 25px;
        font-weight: 700;
        color: #3e4e5e;
      }

      .form-label {
        font-weight: bold;
        color: #444;
      }

      textarea,
      select {
        width: 100%;
        padding: 12px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
      }

      textarea:focus,
      select:focus {
        outline: none;
        border-color: #ff6f91;
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
        background: #ff6f91;
        color: white;
        margin-top: 50px;
      }
    </style>
  </head>

  <body class="app-page checkout-page">
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark px-4">
      <a class="navbar-brand" href="home">CraveRoute</a>
    </nav>

    <main class="checkout-shell">
      <div class="checkout-steps" aria-hidden="true">
        <span class="step active">1</span>
        <span class="step-line"></span>
        <span class="step">2</span>
      </div>

      <section class="checkout-main">
      <div class="checkout-box">
        <div class="checkout-section-heading">
          <span class="section-icon">⌖</span>
          <div>
            <h2>Delivery address</h2>
            <p>Where should we bring your order?</p>
          </div>
        </div>

      <form action="checkout" method="post">
        <!-- Address -->
        <div class="mb-3">
          <label class="form-label">Saved addresses</label>
          <div class="saved-addresses">
            <label class="address-option" data-address-id="home-address">
              <input type="radio" name="savedAddress" value="home-address" data-address="Home, 24 Green Park Road, Bengaluru" checked>
              <span class="address-option-icon">⌂</span>
              <span class="address-option-copy"><strong>Home</strong><small>24 Green Park Road, Bengaluru</small></span>
              <span class="address-option-check">✓</span>
              <button type="button" class="delete-address" aria-label="Delete Home address">×</button>
            </label>
            <label class="address-option" data-address-id="work-address">
              <input type="radio" name="savedAddress" value="work-address" data-address="Office, 9th Phase, JP Nagar, Bengaluru">
              <span class="address-option-icon">▣</span>
              <span class="address-option-copy"><strong>Office</strong><small>9th Phase, JP Nagar, Bengaluru</small></span>
              <span class="address-option-check">✓</span>
              <button type="button" class="delete-address" aria-label="Delete Office address">×</button>
            </label>
            <label class="address-option address-option-new">
              <input type="radio" name="savedAddress" value="new-address">
              <span class="address-option-icon">+</span>
              <span class="address-option-copy"><strong>Add new address</strong><small>Use a different delivery location</small></span>
              <span class="address-option-check">✓</span>
            </label>
          </div>
          <div class="address-entry">
            <label class="form-label" for="deliveryAddress">Delivery address</label>
            <textarea id="deliveryAddress" name="address" rows="3" placeholder="Street, city, state, ZIP" required>Home, 24 Green Park Road, Bengaluru</textarea>
          </div>
        </div>

        <div class="checkout-payment-block">
          <div class="checkout-section-heading">
            <span class="section-icon">▣</span>
            <div>
              <h2>Choose payment method</h2>
              <p>Select how you want to pay.</p>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label">Payment Method</label>
            <div class="payment-options">
              <label class="payment-option">
                <input type="radio" name="paymentMethod" value="Cash on Delivery" required>
                <span class="payment-icon">₹</span>
                <span class="payment-copy"><strong>Cash on Delivery</strong><small>Pay when your food arrives</small></span>
                <span class="payment-check">✓</span>
              </label>
              <label class="payment-option">
                <input type="radio" name="paymentMethod" value="UPI">
                <span class="payment-icon">↗</span>
                <span class="payment-copy"><strong>UPI Payment</strong><small>Google Pay, PhonePe or other UPI apps</small></span>
                <span class="payment-check">✓</span>
              </label>
              <label class="payment-option">
                <input type="radio" name="paymentMethod" value="Card Payment">
                <span class="payment-icon">▣</span>
                <span class="payment-copy"><strong>Card Payment</strong><small>Credit card or debit card</small></span>
                <span class="payment-check">✓</span>
              </label>
            </div>
          </div>
          <button type="submit" class="btn-order">Proceed to pay</button>
        </div>
      </form>
      </div>
      </section>

      <aside class="checkout-summary">
        <h3>Your order</h3>
        <%
          Cart checkoutCart = (Cart) session.getAttribute("cart");
          if (checkoutCart != null && !checkoutCart.getItems().isEmpty()) {
            for (CartItem item : checkoutCart.getItems().values()) {
        %>
        <div class="checkout-item">
          <span><%= item.getName() %> <small>× <%= item.getQuantity() %></small></span>
          <strong>₹ <%= item.getPrice() * item.getQuantity() %></strong>
        </div>
        <%  }
          }
        %>
        <div class="checkout-total"><span>Total</span><strong>₹ <%= checkoutCart != null ? checkoutCart.getTotalAmount() : 0 %></strong></div>
      </aside>
    </main>

    <footer>© 2026 CraveRoute | Secure checkout.</footer>
    <script>
      const addressOptions = document.querySelectorAll('input[name="savedAddress"]');
      const addressField = document.getElementById('deliveryAddress');
      const newAddressOption = document.querySelector('.address-option-new input');

      addressOptions.forEach((option) => {
        option.addEventListener('change', () => {
          const isNewAddress = option === newAddressOption;
          addressField.readOnly = !isNewAddress;
          addressField.value = isNewAddress ? '' : option.dataset.address;
          if (isNewAddress) addressField.focus();
        });
      });

      document.querySelectorAll('.delete-address').forEach((deleteButton) => {
        deleteButton.addEventListener('click', (event) => {
          event.preventDefault();
          event.stopPropagation();

          const addressCard = deleteButton.closest('.address-option');
          const addressName = addressCard.querySelector('.address-option-copy strong').textContent;
          if (!window.confirm('Delete the saved ' + addressName + ' address?')) return;

          const wasSelected = addressCard.querySelector('input').checked;
          addressCard.remove();

          if (wasSelected) {
            const nextAddress = document.querySelector('.address-option:not(.address-option-new) input');
            if (nextAddress) {
              nextAddress.checked = true;
              nextAddress.dispatchEvent(new Event('change'));
            } else {
              newAddressOption.checked = true;
              newAddressOption.dispatchEvent(new Event('change'));
            }
          }
        });
      });
    </script>
  </body>
</html>
