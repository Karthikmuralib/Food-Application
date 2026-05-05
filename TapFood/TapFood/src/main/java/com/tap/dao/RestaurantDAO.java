package com.tap.dao;

import java.util.List;
import com.tap.model.Restaurant;

public interface RestaurantDAO {   // MUST be interface

    void addRestaurant(Restaurant restaurant);
    Restaurant getRestaurant(int restaurantid);
    void updateRestaurant(Restaurant restaurant);
    void deleteRestaurant(int restaurantid);
    List<Restaurant> getAllRestaurants();
}
