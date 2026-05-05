package com.tap.model.daoimpl;

import com.tap.dao.OrdersDAO;
import com.tap.model.Orders;
import com.tap.utility.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAOImpl implements OrdersDAO {

    @Override
    public int addOrder(Orders order) {
        int generatedId = 0;
        String sql = "INSERT INTO orders (userid, restaurantid, orderDate, totalAmount, status, paymentMode, address) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setString(3, order.getOrderDate());
            ps.setDouble(4, order.getTotalAmount());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getPaymentMode());
            ps.setString(7, order.getAddress());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    @Override
    public Orders getOrderById(int orderId) {
        Orders order = null;
        String sql = "SELECT * FROM orders WHERE orderid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                order = new Orders();
                order.setOrderId(rs.getInt("orderid"));
                order.setUserId(rs.getInt("userid"));
                order.setRestaurantId(rs.getInt("restaurantid"));
                order.setOrderDate(rs.getString("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMode(rs.getString("paymentMode"));
                order.setAddress(rs.getString("address"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public void updateOrder(Orders order) {
        String sql = "UPDATE orders SET status=?, paymentMode=?, address=?, totalAmount=? WHERE orderid=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, order.getStatus());
            ps.setString(2, order.getPaymentMode());
            ps.setString(3, order.getAddress());
            ps.setDouble(4, order.getTotalAmount());
            ps.setInt(5, order.getOrderId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int orderId) {
        String sql = "DELETE FROM orders WHERE orderid=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Orders> getAllOrders(int userid) {
        List<Orders> ordersList = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE userid=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderId(rs.getInt("orderid"));
                order.setUserId(rs.getInt("userid"));
                order.setRestaurantId(rs.getInt("restaurantid"));
                order.setOrderDate(rs.getString("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMode(rs.getString("paymentMode"));
                order.setAddress(rs.getString("address"));
                ordersList.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ordersList;
    }
}
