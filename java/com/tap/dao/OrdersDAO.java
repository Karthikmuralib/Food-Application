package com.tap.dao;

import com.tap.model.Orders;
import java.util.List;

public interface OrdersDAO {
    int addOrder(Orders order);
    Orders getOrderById(int orderId);
    void updateOrder(Orders order);
    void deleteOrder(int orderId);
    List<Orders> getAllOrders(int userid);
}
