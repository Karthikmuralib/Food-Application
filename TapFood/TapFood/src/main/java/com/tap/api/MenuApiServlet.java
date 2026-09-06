package com.tap.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.model.daoimpl.MenuDAOImpl;
import com.tap.utility.JsonUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * REST API for menu items.
 *
 * GET /api/menu?restaurantId={id}  -> JSON array of menu items for a restaurant
 * GET /api/menu                    -> JSON array of all menu items
 * GET /api/menu/{id}                -> JSON object for a single menu item, 404 if not found
 */
@WebServlet("/api/menu/*")
public class MenuApiServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final transient MenuDAO menuDAO = new MenuDAOImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		String pathInfo = req.getPathInfo();

		try (PrintWriter out = resp.getWriter()) {

			if (pathInfo == null || pathInfo.equals("/")) {
				String restaurantIdParam = req.getParameter("restaurantId");

				List<Menu> menus;
				if (restaurantIdParam != null) {
					int restaurantId;
					try {
						restaurantId = Integer.parseInt(restaurantIdParam);
					} catch (NumberFormatException e) {
						resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
						out.write(JsonUtil.error("restaurantId must be a number"));
						return;
					}
					menus = menuDAO.getMenusByRestaurant(restaurantId);
				} else {
					menus = menuDAO.getAllMenus();
				}

				resp.setStatus(HttpServletResponse.SC_OK);
				out.write(JsonUtil.menuArray(menus));
				return;
			}

			int menuId;
			try {
				menuId = Integer.parseInt(pathInfo.substring(1));
			} catch (NumberFormatException e) {
				resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				out.write(JsonUtil.error("Menu id must be a number"));
				return;
			}

			Menu menu = menuDAO.getMenu(menuId);
			if (menu == null) {
				resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
				out.write(JsonUtil.error("Menu item " + menuId + " not found"));
				return;
			}

			resp.setStatus(HttpServletResponse.SC_OK);
			out.write(JsonUtil.toJson(menu));

		} catch (Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().write(JsonUtil.error("Internal server error"));
		}
	}
}
