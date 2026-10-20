package com.shopsphere.dao;

import com.shopsphere.model.Coupon;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {

    public Coupon getValidCoupon(String code) {

        String sql = "SELECT coupon_id, code, discount_type, " +
                     "discount_value, minimum_order, maximum_discount, " +
                     "expiry_date, status " +
                     "FROM coupons " +
                     "WHERE code = ? " +
                     "AND status = TRUE " +
                     "AND expiry_date >= CURRENT_DATE";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setString(1, code);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Coupon coupon = new Coupon();

                coupon.setCouponId(rs.getInt("coupon_id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscountType(rs.getString("discount_type"));
                coupon.setDiscountValue(rs.getDouble("discount_value"));
                coupon.setMinimumOrder(rs.getDouble("minimum_order"));
                coupon.setMaximumDiscount(rs.getDouble("maximum_discount"));
                coupon.setExpiryDate(rs.getDate("expiry_date"));
                coupon.setStatus(rs.getBoolean("status"));

                return coupon;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Coupon> getAllCoupons() {

        List<Coupon> coupons = new ArrayList<>();

        String sql = "SELECT coupon_id, code, discount_type, " +
                     "discount_value, minimum_order, maximum_discount, " +
                     "expiry_date, status " +
                     "FROM coupons " +
                     "ORDER BY coupon_id DESC";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Coupon coupon = new Coupon();

                coupon.setCouponId(rs.getInt("coupon_id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscountType(rs.getString("discount_type"));
                coupon.setDiscountValue(rs.getDouble("discount_value"));
                coupon.setMinimumOrder(rs.getDouble("minimum_order"));
                coupon.setMaximumDiscount(rs.getDouble("maximum_discount"));
                coupon.setExpiryDate(rs.getDate("expiry_date"));
                coupon.setStatus(rs.getBoolean("status"));

                coupons.add(coupon);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return coupons;
    }

    public boolean addCoupon(Coupon coupon) {

        String sql = "INSERT INTO coupons " +
                     "(code, discount_type, discount_value, " +
                     "minimum_order, maximum_discount, expiry_date, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setString(1, coupon.getCode());
            ps.setString(2, coupon.getDiscountType());
            ps.setDouble(3, coupon.getDiscountValue());
            ps.setDouble(4, coupon.getMinimumOrder());
            ps.setDouble(5, coupon.getMaximumDiscount());
            ps.setDate(6, coupon.getExpiryDate());
            ps.setBoolean(7, coupon.isStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}