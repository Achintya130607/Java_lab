package com.shopsphere.dao;

import com.shopsphere.model.Payment;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentDAO {

    public boolean createPayment(Payment payment) {

        String sql = "INSERT INTO payments " +
                     "(order_id, payment_method, transaction_reference, " +
                     "amount, payment_status) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, payment.getOrderId());
            ps.setString(2, payment.getPaymentMethod());
            ps.setString(3, payment.getTransactionReference());
            ps.setDouble(4, payment.getAmount());
            ps.setString(5, payment.getPaymentStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Payment getPaymentByOrderId(int orderId) {

        String sql = "SELECT payment_id, order_id, payment_method, " +
                     "transaction_reference, amount, payment_status, " +
                     "created_at " +
                     "FROM payments " +
                     "WHERE order_id = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Payment payment = new Payment();

                payment.setPaymentId(
                        rs.getInt("payment_id")
                );

                payment.setOrderId(
                        rs.getInt("order_id")
                );

                payment.setPaymentMethod(
                        rs.getString("payment_method")
                );

                payment.setTransactionReference(
                        rs.getString("transaction_reference")
                );

                payment.setAmount(
                        rs.getDouble("amount")
                );

                payment.setPaymentStatus(
                        rs.getString("payment_status")
                );

                payment.setCreatedAt(
                        rs.getTimestamp("created_at")
                );

                return payment;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}