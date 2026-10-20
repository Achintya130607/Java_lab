package com.shopsphere.service;

import com.shopsphere.dao.CartDAO;
import com.shopsphere.model.CartItem;

import java.util.List;

public class CartService {

    private CartDAO cartDAO;

    public CartService() {
        cartDAO = new CartDAO();
    }

    public boolean addToCart(int userId, int productId, int quantity) {
        return cartDAO.addToCart(userId, productId, quantity);
    }

    public List<CartItem> getCartItems(int userId) {
        return cartDAO.getCartItems(userId);
    }

    public boolean updateQuantity(int cartId,
                                  int userId,
                                  int quantity) {
        return cartDAO.updateQuantity(
                cartId,
                userId,
                quantity
        );
    }

    public boolean removeFromCart(int cartId, int userId) {
        return cartDAO.removeFromCart(
                cartId,
                userId
        );
    }

    public boolean clearCart(int userId) {
        return cartDAO.clearCart(userId);
    }
}