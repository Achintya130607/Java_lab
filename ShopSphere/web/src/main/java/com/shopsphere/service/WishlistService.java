package com.shopsphere.service;

import com.shopsphere.dao.WishlistDAO;
import com.shopsphere.model.WishlistItem;

import java.util.List;

public class WishlistService {

    private WishlistDAO wishlistDAO;

    public WishlistService() {
        wishlistDAO = new WishlistDAO();
    }

    public boolean addToWishlist(int userId, int productId) {
        return wishlistDAO.addToWishlist(userId, productId);
    }

    public List<WishlistItem> getWishlistItems(int userId) {
        return wishlistDAO.getWishlistItems(userId);
    }
}