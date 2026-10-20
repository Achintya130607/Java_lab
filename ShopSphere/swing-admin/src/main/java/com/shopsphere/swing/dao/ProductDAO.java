package com.shopsphere.swing.dao;

import com.shopsphere.swing.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getAllProducts(Connection connection) throws Exception {

        List<Product> products = new ArrayList<>();

        String sql = """
                SELECT product_id, name, price, stock
                FROM products
                WHERE status = TRUE
                ORDER BY product_id
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Product product = new Product(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("stock")
                );

                products.add(product);
            }
        }

        return products;
    }

    public Product findById(
            Connection connection,
            int productId) throws Exception {

        String sql = """
                SELECT product_id, name, price, stock
                FROM products
                WHERE product_id = ?
                AND status = TRUE
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return new Product(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getInt("stock")
                    );
                }
            }
        }

        return null;
    }

    public boolean updateStock(
            Connection connection,
            int productId,
            int newStock) throws Exception {

        String sql = """
                UPDATE products
                SET stock = ?
                WHERE product_id = ?
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, newStock);
            ps.setInt(2, productId);

            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteProduct(
            Connection connection,
            int productId) throws Exception {

        String sql = """
                UPDATE products
                SET status = FALSE
                WHERE product_id = ?
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, productId);

            return ps.executeUpdate() > 0;
        }
    }
}