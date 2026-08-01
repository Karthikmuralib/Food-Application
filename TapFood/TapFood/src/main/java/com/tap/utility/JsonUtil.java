package com.tap.utility;

import java.util.List;
import java.util.Map;

import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.Orders;
import com.tap.model.Restaurant;

/**
 * Minimal, dependency-free JSON serialization for the TapFood REST API.
 * No external library is used so no extra jar needs to be added to the
 * project's build path.
 */
public class JsonUtil {

	private JsonUtil() {
	}

	// ---------- low-level helpers ----------

	private static String esc(String value) {
		if (value == null) {
			return "";
		}
		StringBuilder sb = new StringBuilder();
		for (char c : value.toCharArray()) {
			switch (c) {
				case '"': sb.append("\\\""); break;
				case '\\': sb.append("\\\\"); break;
				case '\n': sb.append("\\n"); break;
				case '\r': sb.append("\\r"); break;
				case '\t': sb.append("\\t"); break;
				default:
					if (c < 0x20) {
						sb.append(String.format("\\u%04x", (int) c));
					} else {
						sb.append(c);
					}
			}
		}
		return sb.toString();
	}

	private static String str(String key, String value) {
		return "\"" + esc(key) + "\":" + (value == null ? "null" : "\"" + esc(value) + "\"");
	}

	private static String num(String key, Number value) {
		return "\"" + esc(key) + "\":" + (value == null ? "null" : value.toString());
	}

	private static String bool(String key, Boolean value) {
		return "\"" + esc(key) + "\":" + (value == null ? "null" : value.toString());
	}

	// ---------- model serializers ----------

	public static String toJson(Restaurant r) {
		StringBuilder sb = new StringBuilder("{");
		sb.append(num("restaurantId", r.getRestaurantid())).append(",");
		sb.append(str("name", r.getName())).append(",");
		sb.append(str("address", r.getAddress())).append(",");
		sb.append(str("phone", r.getPhone())).append(",");
		sb.append(num("rating", r.getRating())).append(",");
		sb.append(str("cuisineType", r.getCuisineType())).append(",");
		sb.append(bool("isActive", r.getIsActive())).append(",");
		sb.append(num("etaMinutes", r.getEta())).append(",");
		sb.append(str("imagePath", r.getImagePath()));
		sb.append("}");
		return sb.toString();
	}

	public static String toJson(Menu m) {
		StringBuilder sb = new StringBuilder("{");
		sb.append(num("menuId", m.getMenuId())).append(",");
		sb.append(num("restaurantId", m.getRestaurantId())).append(",");
		sb.append(str("name", m.getName())).append(",");
		sb.append(str("description", m.getDescription())).append(",");
		sb.append(num("price", m.getPrice())).append(",");
		sb.append(bool("isActive", m.getIsActive())).append(",");
		sb.append(str("imagePath", m.getImagePath()));
		sb.append("}");
		return sb.toString();
	}

	public static String toJson(Orders o) {
		StringBuilder sb = new StringBuilder("{");
		sb.append(num("orderId", o.getOrderId())).append(",");
		sb.append(num("userId", o.getUserId())).append(",");
		sb.append(num("restaurantId", o.getRestaurantId())).append(",");
		sb.append(str("orderDate", o.getOrderDate())).append(",");
		sb.append(num("totalAmount", o.getTotalAmount())).append(",");
		sb.append(str("status", o.getStatus())).append(",");
		sb.append(str("paymentMode", o.getPaymentMode())).append(",");
		sb.append(str("address", o.getAddress()));
		sb.append("}");
		return sb.toString();
	}

	public static String toJson(CartItem c) {
		StringBuilder sb = new StringBuilder("{");
		sb.append(num("menuId", c.getMenuId())).append(",");
		sb.append(num("restaurantId", c.getRestaurantId())).append(",");
		sb.append(str("name", c.getName())).append(",");
		sb.append(num("quantity", c.getQuantity())).append(",");
		sb.append(num("price", c.getPrice())).append(",");
		sb.append(num("lineTotal", c.getPrice() * c.getQuantity()));
		sb.append("}");
		return sb.toString();
	}

	// ---------- collection helpers ----------

	public static String restaurantArray(List<Restaurant> list) {
		StringBuilder sb = new StringBuilder("[");
		for (int i = 0; i < list.size(); i++) {
			if (i > 0) sb.append(",");
			sb.append(toJson(list.get(i)));
		}
		return sb.append("]").toString();
	}

	public static String menuArray(List<Menu> list) {
		StringBuilder sb = new StringBuilder("[");
		for (int i = 0; i < list.size(); i++) {
			if (i > 0) sb.append(",");
			sb.append(toJson(list.get(i)));
		}
		return sb.append("]").toString();
	}

	public static String orderArray(List<Orders> list) {
		StringBuilder sb = new StringBuilder("[");
		for (int i = 0; i < list.size(); i++) {
			if (i > 0) sb.append(",");
			sb.append(toJson(list.get(i)));
		}
		return sb.append("]").toString();
	}

	public static String cartJson(Map<Integer, CartItem> items) {
		StringBuilder sb = new StringBuilder("{\"items\":[");
		double total = 0;
		int i = 0;
		for (CartItem item : items.values()) {
			if (i++ > 0) sb.append(",");
			sb.append(toJson(item));
			total += item.getPrice() * item.getQuantity();
		}
		sb.append("],");
		sb.append(num("cartTotal", total));
		sb.append(",");
		sb.append(num("itemCount", items.size()));
		sb.append("}");
		return sb.toString();
	}

	// ---------- envelope helpers ----------

	public static String error(String message) {
		return "{" + str("error", message) + "}";
	}

	public static String message(String message) {
		return "{" + str("message", message) + "}";
	}
}
