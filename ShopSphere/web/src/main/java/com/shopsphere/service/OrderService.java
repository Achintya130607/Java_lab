package com.shopsphere.service;

import com.shopsphere.dao.OrderDAO;
import com.shopsphere.model.Order;

import java.util.List;

public class OrderService {

    private OrderDAO orderDAO;

    public OrderService() {
        orderDAO = new OrderDAO();
    }

    public int createOrder(Order order) {
        return orderDAO.createOrder(order);
    }

    public List<Order> getOrdersByUser(int userId) {
        return orderDAO.getOrdersByUser(userId);
    }

    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }

    public boolean updatePaymentStatus(int orderId,
                                       String paymentStatus,
                                       String orderStatus) {
        return orderDAO.updatePaymentStatus(
                orderId,
                paymentStatus,
                orderStatus
        );
    }
}