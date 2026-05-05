package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.model.Menu;
import com.tap.model.daoimpl.MenuDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("hello menu servlet");
		int rid=Integer.parseInt(req.getParameter("restaurantId"));
		
		MenuDAOImpl daoImpl=new MenuDAOImpl();
		List<Menu> menulist=daoImpl.getMenusByRestaurant(rid);
		
		req.setAttribute("menus", menulist);
		
		RequestDispatcher rd=req.getRequestDispatcher("Menu.jsp");
		rd.forward(req, resp);
	}

}
