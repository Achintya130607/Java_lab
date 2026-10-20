package com.shopsphere.swing.dao;

import com.shopsphere.swing.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User findAdminByEmail(
            Connection connection,
            String email) throws Exception {

        String sql = """
                SELECT user_id, name, email, mobile, role, status
                FROM users
                WHERE email = ?
                AND role = 'ADMIN'
                LIMIT 1
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return new User(
                            rs.getInt("user_id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("mobile"),
                            rs.getString("role"),
                            rs.getBoolean("status")
                    );
                }
            }
        }

        return null;
    }

    public boolean isActiveAdmin(
            Connection connection,
            String email) throws Exception {

        String sql = """
                SELECT user_id
                FROM users
                WHERE email = ?
                AND role = 'ADMIN'
                AND status = TRUE
                LIMIT 1
                """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
}