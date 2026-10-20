package com.shopsphere.dao;

import com.shopsphere.model.Product;
import com.shopsphere.model.WishlistItem;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO {

    public boolean addToWishlist(int userId, int productId) {

        String checkSql =
                "SELECT wishlist_id FROM wishlist " +
                "WHERE user_id = ? AND product_id = ?";

        String insertSql =
                "INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement checkPs =
                     connection.prepareStatement(checkSql)) {

            checkPs.setInt(1, userId);
            checkPs.setInt(2, productId);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                return true;
            }

            try (PreparedStatement insertPs =
                         connection.prepareStatement(insertSql)) {

                insertPs.setInt(1, userId);
                insertPs.setInt(2, productId);

                return insertPs.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<WishlistItem> getWishlistItems(int userId) {

        List<WishlistItem> wishlistItems = new ArrayList<>();

        String sql =
                "SELECT w.wishlist_id, w.user_id, w.product_id, " +
                "w.created_at, " +
                "p.name, p.brand, p.description, p.price, " +
                "p.discount, p.stock, p.image_url, p.status " +
                "FROM wishlist w " +
                "JOIN products p ON w.product_id = p.product_id " +
                "WHERE w.user_id = ? " +
                "ORDER BY w.created_at DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                WishlistItem item = new WishlistItem();

                item.setWishlistId(rs.getInt("wishlist_id"));
                item.setUserId(rs.getInt("user_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setCreatedAt(rs.getTimestamp("created_at"));

                Product product = new Product();

                product.setProductId(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setBrand(rs.getString("brand"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                product.setStock(rs.getInt("stock"));
                product.setImageUrl(rs.getString("image_url"));
                product.setStatus(rs.getBoolean("status"));

                item.setProduct(product);

                wishlistItems.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return wishlistItems;
    }
}