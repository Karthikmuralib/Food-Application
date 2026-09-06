package com.tap.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.tap.utility.DBConnection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO user (name, username, password, email, phone, address, role, createdDate, lastLoginDate) " +
                         "VALUES (?, ?, ?, ?, ?, ?, 'customer', NOW(), NULL)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, address);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Registration failed!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database Error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
