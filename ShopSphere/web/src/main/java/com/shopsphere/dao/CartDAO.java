package com.shopsphere.dao;

import com.shopsphere.model.CartItem;
import com.shopsphere.model.Product;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public boolean addToCart(int userId, int productId, int quantity) {

        String checkSql =
                "SELECT cart_id, quantity FROM cart " +
                "WHERE user_id = ? AND product_id = ?";

        String insertSql =
                "INSERT INTO cart (user_id, product_id, quantity) " +
                "VALUES (?, ?, ?)";

        String updateSql =
                "UPDATE cart SET quantity = quantity + ? " +
                "WHERE cart_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement checkPs =
                    connection.prepareStatement(checkSql)
        ) {

            checkPs.setInt(1, userId);
            checkPs.setInt(2, productId);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {

                int cartId = rs.getInt("cart_id");

                try (
                    PreparedStatement updatePs =
                            connection.prepareStatement(updateSql)
                ) {

                    updatePs.setInt(1, quantity);
                    updatePs.setInt(2, cartId);

                    return updatePs.executeUpdate() > 0;
                }

            } else {

                try (
                    PreparedStatement insertPs =
                            connection.prepareStatement(insertSql)
                ) {

                    insertPs.setInt(1, userId);
                    insertPs.setInt(2, productId);
                    insertPs.setInt(3, quantity);

                    return insertPs.executeUpdate() > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<CartItem> getCartItems(int userId) {

        List<CartItem> cartItems = new ArrayList<>();

        String sql =
                "SELECT c.cart_id, c.user_id, c.product_id, c.quantity, " +
                "p.name, p.brand, p.description, p.price, p.discount, " +
                "p.stock, p.image_url, p.status " +
                "FROM cart c " +
                "JOIN products p ON c.product_id = p.product_id " +
                "WHERE c.user_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                CartItem cartItem = new CartItem();

                cartItem.setCartId(rs.getInt("cart_id"));
                cartItem.setUserId(rs.getInt("user_id"));
                cartItem.setProductId(rs.getInt("product_id"));
                cartItem.setQuantity(rs.getInt("quantity"));

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

                cartItem.setProduct(product);

                cartItems.add(cartItem);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartItems;
    }

    public boolean updateQuantity(int cartId,
                                  int userId,
                                  int quantity) {

        String sql =
                "UPDATE cart SET quantity = ? " +
                "WHERE cart_id = ? AND user_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, quantity);
            ps.setInt(2, cartId);
            ps.setInt(3, userId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeFromCart(int cartId, int userId) {

        String sql =
                "DELETE FROM cart " +
                "WHERE cart_id = ? AND user_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, cartId);
            ps.setInt(2, userId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean clearCart(int userId) {

        String sql =
                "DELETE FROM cart WHERE user_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, userId);

            return ps.executeUpdate() >= 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}