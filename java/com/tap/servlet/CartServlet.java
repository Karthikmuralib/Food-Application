package com.tap.servlet;

import java.io.IOException;

import com.tap.dao.MenuDAO;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.daoimpl.MenuDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        Integer restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId");

        // If cart is empty or restaurant changed → create new cart
        if (cart == null || currentRestaurantId == null || !restaurantId.equals(currentRestaurantId)) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", restaurantId);
        }

        String action = req.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addItemToCart(req, cart);
                    break;

                case "update":
                    updateCartItem(req, cart);
                    break;

                case "remove":
                    removeCartItem(req, cart);
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("Cart.jsp");
    }

    // ADD ITEM
    private void addItemToCart(HttpServletRequest req, Cart cart) throws ClassNotFoundException {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuDAO menuDAO = new MenuDAOImpl();
        // 🔴 UPDATED — use getMenu instead of getMenuById
        Menu menuItem = menuDAO.getMenu(itemId);

        if (menuItem != null) {
            CartItem item = new CartItem(
                    menuItem.getMenuId(),
                    menuItem.getRestaurantId(),
                    menuItem.getName(),
                    quantity,
                    menuItem.getPrice()
            );

            cart.addItem(item);
        }
    }

    // UPDATE ITEM
    private void updateCartItem(HttpServletRequest req, Cart cart) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        cart.updateItem(itemId, quantity);
    }

    // REMOVE ITEM
    private void removeCartItem(HttpServletRequest req, Cart cart) {
        int itemId = Integer.parseInt(req.getParameter("itemId"));
        cart.removeItem(itemId);
    }
}
