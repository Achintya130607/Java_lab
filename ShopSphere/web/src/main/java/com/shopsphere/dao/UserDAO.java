package com.shopsphere.dao;

import com.shopsphere.model.User;
import com.shopsphere.util.DBConnection;
import com.shopsphere.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public boolean registerUser(User user) {

        String sql = "INSERT INTO users " +
                     "(name, email, password, mobile, role, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            String hashedPassword = PasswordUtil.hashPassword(user.getPassword());

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, hashedPassword);
            ps.setString(4, user.getMobile());
            ps.setString(5, "CUSTOMER");
            ps.setBoolean(6, true);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {

        String sql = "SELECT * FROM users " +
                     "WHERE email = ? AND status = TRUE";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    String storedPassword = rs.getString("password");

                    boolean validPassword =
                            PasswordUtil.verifyPassword(password, storedPassword);

                    /*
                     * Backward compatibility:
                     * If an old account still contains a plaintext password
                     * and the entered password matches it, automatically
                     * convert it to SHA-256 hash.
                     */
                    if (!validPassword && password.equals(storedPassword)) {

                        String newHash = PasswordUtil.hashPassword(password);

                        String updateSql =
                                "UPDATE users SET password = ? WHERE user_id = ?";

                        try (PreparedStatement updatePs =
                                     connection.prepareStatement(updateSql)) {

                            updatePs.setString(1, newHash);
                            updatePs.setInt(2, rs.getInt("user_id"));
                            updatePs.executeUpdate();
                        }

                        storedPassword = newHash;
                        validPassword = true;
                    }

                    if (validPassword) {

                        User user = new User();

                        user.setUserId(rs.getInt("user_id"));
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(storedPassword);
                        user.setMobile(rs.getString("mobile"));
                        user.setRole(rs.getString("role"));
                        user.setStatus(rs.getBoolean("status"));

                        return user;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        String sql = "SELECT user_id, name, email, password, mobile, " +
                     "role, status " +
                     "FROM users " +
                     "ORDER BY user_id DESC";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getBoolean("status"));

                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }
}