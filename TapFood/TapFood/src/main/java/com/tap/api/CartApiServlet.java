package com.tap.api;

import java.io.IOException;
import java.io.PrintWriter;

import com.tap.dao.MenuDAO;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.daoimpl.MenuDAOImpl;
import com.tap.utility.JsonUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * REST API for the session-scoped shopping cart.
 *
 * GET    /api/cart              -> JSON cart contents + total
 * POST   /api/cart              -> add an item (params: menuId, quantity)
 * PUT    /api/cart/{menuId}     -> set an item's quantity (param: quantity)
 * DELETE /api/cart/{menuId}     -> remove an item from the cart
 *
 * This reuses the same Cart/CartItem session model as the existing
 * CartServlet used by the JSP pages, so the JSON API and the browser UI
 * always see the same cart.
 */
@WebServlet("/api/cart/*")
public class CartApiServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final transient MenuDAO menuDAO = new MenuDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		writeCart(req, resp, HttpServletResponse.SC_OK);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		try (PrintWriter out = resp.getWriter()) {
			Integer menuId = parseInt(req.getParameter("menuId"));
			Integer quantity = parseInt(req.getParameter("quantity"));

			if (menuId == null || quantity == null || quantity <= 0) {
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				out.write(JsonUtil.error("menuId and a positive quantity are required"));
				return;
			}

			Menu menu = menuDAO.getMenu(menuId);
			if (menu == null) {
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
				out.write(JsonUtil.error("Menu item " + menuId + " not found"));
				return;
			}

			CartItem item = new CartItem(menu.getMenuId(), menu.getRestaurantId(),
					menu.getName(), quantity, menu.getPrice());

			Cart cart = getCart(req);
			cart.addItem(item);

			resp.setStatus(HttpServletResponse.SC_CREATED);
			out.write(JsonUtil.cartJson(cart.getItems()));

		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write(JsonUtil.error("Internal server error"));
		}
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		try (PrintWriter out = resp.getWriter()) {
			Integer menuId = pathMenuId(req);
			Integer quantity = parseInt(req.getParameter("quantity"));

			if (menuId == null) {
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				out.write(JsonUtil.error("Menu id is required in the URL path, e.g. /api/cart/5"));
				return;
			}
			if (quantity == null) {
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				out.write(JsonUtil.error("quantity parameter is required"));
				return;
			}

			Cart cart = getCart(req);
			cart.updateItem(menuId, quantity);

			resp.setStatus(HttpServletResponse.SC_OK);
			out.write(JsonUtil.cartJson(cart.getItems()));

		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write(JsonUtil.error("Internal server error"));
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		try (PrintWriter out = resp.getWriter()) {
			Integer menuId = pathMenuId(req);
			if (menuId == null) {
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				out.write(JsonUtil.error("Menu id is required in the URL path, e.g. /api/cart/5"));
				return;
			}

			Cart cart = getCart(req);
			cart.removeItem(menuId);

			resp.setStatus(HttpServletResponse.SC_OK);
			out.write(JsonUtil.cartJson(cart.getItems()));

		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write(JsonUtil.error("Internal server error"));
		}
	}

	// ---------- helpers ----------

	private void writeCart(HttpServletRequest req, HttpServletResponse resp, int status) throws IOException {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		Cart cart = getCart(req);
		resp.setStatus(status);
		try (PrintWriter out = resp.getWriter()) {
			out.write(JsonUtil.cartJson(cart.getItems()));
		}
	}

	private Cart getCart(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		return cart;
	}

	private Integer pathMenuId(HttpServletRequest req) {
		String pathInfo = req.getPathInfo(); // "/{menuId}"
		if (pathInfo == null || pathInfo.equals("/")) {
			return null;
		}
		return parseInt(pathInfo.substring(1));
	}

	private Integer parseInt(String value) {
		if (value == null) {
			return null;
		}
		try {
			return Integer.parseInt(value.trim());
		} catch (NumberFormatException e) {
			return null;
		}
	}
}
