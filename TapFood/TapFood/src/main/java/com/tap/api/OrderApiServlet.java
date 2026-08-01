package com.tap.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.tap.dao.OrdersDAO;
import com.tap.model.Orders;
import com.tap.model.User;
import com.tap.model.daoimpl.OrdersDAOImpl;
import com.tap.utility.JsonUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * REST API for order history.
 *
 * GET /api/orders -> JSON array of the logged-in user's past orders.
 * Requires an active session (same login used by the rest of the site).
 */
@WebServlet("/api/orders")
public class OrderApiServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final transient OrdersDAO ordersDAO = new OrdersDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		try (PrintWriter out = resp.getWriter()) {
			HttpSession session = req.getSession(false);
			User loggedInUser = session == null ? null : (User) session.getAttribute("loggedInUser");

			if (loggedInUser == null) {
				resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				out.write(JsonUtil.error("Login required to view order history"));
				return;
			}

			List<Orders> orders = ordersDAO.getAllOrders(loggedInUser.getUserid());
			resp.setStatus(HttpServletResponse.SC_OK);
			out.write(JsonUtil.orderArray(orders));

		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write(JsonUtil.error("Internal server error"));
		}
	}
}
