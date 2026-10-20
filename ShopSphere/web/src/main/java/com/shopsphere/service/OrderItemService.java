package com.shopsphere.service;

import com.shopsphere.dao.OrderItemDAO;
import com.shopsphere.model.OrderItem;

public class OrderItemService {

    private OrderItemDAO orderItemDAO;

    public OrderItemService() {
        orderItemDAO = new OrderItemDAO();
    }

    public boolean addOrderItem(OrderItem item) {
        return orderItemDAO.addOrderItem(item);
    }
}