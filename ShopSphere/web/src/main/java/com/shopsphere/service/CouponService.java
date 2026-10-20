package com.shopsphere.service;

import com.shopsphere.dao.CouponDAO;
import com.shopsphere.model.Coupon;

public class CouponService {

    private CouponDAO couponDAO;

    public CouponService() {
        couponDAO = new CouponDAO();
    }

    public Coupon getValidCoupon(String code) {
        return couponDAO.getValidCoupon(code);
    }

    public double calculateDiscount(Coupon coupon, double orderAmount) {

        if (coupon == null) {
            return 0;
        }

        if (orderAmount < coupon.getMinimumOrder()) {
            return 0;
        }

        double discount;

        if ("PERCENTAGE".equalsIgnoreCase(coupon.getDiscountType())) {

            discount = orderAmount *
                    coupon.getDiscountValue() / 100.0;

            if (coupon.getMaximumDiscount() > 0 &&
                discount > coupon.getMaximumDiscount()) {

                discount = coupon.getMaximumDiscount();
            }

        } else {

            discount = coupon.getDiscountValue();
        }

        if (discount > orderAmount) {
            discount = orderAmount;
        }

        return discount;
    }
}