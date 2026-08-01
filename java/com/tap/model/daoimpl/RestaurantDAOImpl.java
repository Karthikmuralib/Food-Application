package com.tap.model.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.RestaurantDAO;      // Correct interface import
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private static final String INSERT_QUERY =
            "INSERT INTO restaurant(name, address, phone, rating, cuisineType, isActive, eta, adminUserId, imagePath) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_QUERY =
            "SELECT * FROM restaurant WHERE restaurantid = ?";

    private static final String UPDATE_QUERY =
            "UPDATE restaurant SET name=?, address=?, phone=?, rating=?, cuisineType=?, isActive=?, eta=?, adminUserId=?, imagePath=? " +
            "WHERE restaurantid=?";

    private static final String DELETE_QUERY =
            "DELETE FROM restaurant WHERE restaurantid = ?";

    private static final String GET_ALL_QUERY =
            "SELECT * FROM restaurant";

    @Override
    public void addRestaurant(Restaurant restaurant) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_QUERY)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setDouble(4, restaurant.getRating());
            ps.setString(5, restaurant.getCuisineType());
            ps.setBoolean(6, restaurant.getIsActive());
            ps.setInt(7, restaurant.getEta());
            ps.setInt(8, restaurant.getAdminUserId());
            ps.setString(9, restaurant.getImagePath());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int restaurantid) {
        Restaurant restaurant = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(GET_QUERY)) {

            ps.setInt(1, restaurantid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                restaurant = extractRestaurant(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    @Override
    public void updateRestaurant(Restaurant restaurant) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_QUERY)) {

            ps.setString(1, restaurant.getName());
            ps.setString(2, restaurant.getAddress());
            ps.setString(3, restaurant.getPhone());
            ps.setDouble(4, restaurant.getRating());
            ps.setString(5, restaurant.getCuisineType());
            ps.setBoolean(6, restaurant.getIsActive());
            ps.setInt(7, restaurant.getEta());
            ps.setInt(8, restaurant.getAdminUserId());
            ps.setString(9, restaurant.getImagePath());
            ps.setInt(10, restaurant.getRestaurantid());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int restaurantid) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_QUERY)) {

            ps.setInt(1, restaurantid);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(GET_ALL_QUERY)) {

            while (rs.next()) {
                list.add(extractRestaurant(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private Restaurant extractRestaurant(ResultSet rs) throws SQLException {
        return new Restaurant(
                rs.getInt("restaurantid"),
                rs.getString("name"),
                rs.getString("address"),
                rs.getString("phone"),
                rs.getDouble("rating"),
                rs.getString("cuisineType"),
                rs.getBoolean("isActive"),
                rs.getInt("eta"),
                rs.getInt("adminUserId"),
                rs.getString("imagePath")
        );
    }
}
