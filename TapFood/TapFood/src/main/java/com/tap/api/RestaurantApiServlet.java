package com.tap.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.model.daoimpl.RestaurantDAOImpl;
import com.tap.utility.JsonUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * REST API for restaurants.
 *
 * GET /api/restaurants        -> JSON array of all restaurants
 * GET /api/restaurants/{id}   -> JSON object for a single restaurant, 404 if not found
 */
@WebServlet("/api/restaurants/*")
public class RestaurantApiServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final transient RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		String pathInfo = req.getPathInfo(); // null, "/", or "/{id}"

		try (PrintWriter out = resp.getWriter()) {
			if (pathInfo == null || pathInfo.equals("/")) {
				List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
				resp.setStatus(HttpServletResponse.SC_OK);
				out.write(JsonUtil.restaurantArray(restaurants));
				return;
			}

			int restaurantId;
			try {
				restaurantId = Integer.parseInt(pathInfo.substring(1));
			} catch (NumberFormatException e) {
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				out.write(JsonUtil.error("Restaurant id must be a number"));
				return;
			}

			Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);
			if (restaurant == null) {
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
				out.write(JsonUtil.error("Restaurant " + restaurantId + " not found"));
				return;
			}

			resp.setStatus(HttpServletResponse.SC_OK);
			out.write(JsonUtil.toJson(restaurant));

		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write(JsonUtil.error("Internal server error"));
		}
	}
}
