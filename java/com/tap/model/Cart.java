package com.tap.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    // Map of menuId -> CartItem
    private Map<Integer, CartItem> items = new HashMap<>();

    // Getter for all items
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    // Add item to cart
    public void addItem(CartItem item) {
        if (items.containsKey(item.getMenuId())) {
            CartItem existing = items.get(item.getMenuId());
            existing.setQuantity(existing.getQuantity() + item.getQuantity());
        } else {
            items.put(item.getMenuId(), item);
        }
    }

    // Update quantity of an item
    public void updateItem(int menuId, int quantity) {
        if (items.containsKey(menuId)) {
            if (quantity <= 0) {
                items.remove(menuId); // remove if quantity is zero or less
            } else {
                items.get(menuId).setQuantity(quantity);
            }
        }
    }

    // Remove item from cart
    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    // Calculate total amount
    public double getTotalAmount() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }

}
