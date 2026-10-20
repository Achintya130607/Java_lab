package com.shopsphere.controller;

import com.shopsphere.dao.CouponDAO;
import com.shopsphere.model.Coupon;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/coupons")
public class AdminCouponServlet extends HttpServlet {

    private CouponDAO couponDAO;

    @Override
    public void init() {
        couponDAO = new CouponDAO();
    }

    private boolean isAdmin(HttpServletRequest request) {

        HttpSession session = request.getSession(false);

        return session != null &&
                "ADMIN".equalsIgnoreCase(
                        (String) session.getAttribute("role")
                );
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(
                    request.getContextPath() + "/admin/login"
            );
            return;
        }

        request.setAttribute(
                "coupons",
                couponDAO.getAllCoupons()
        );

        request.getRequestDispatcher(
                "/admin/coupons.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(
                    request.getContextPath() + "/admin/login"
            );
            return;
        }

        try {

            Coupon coupon = new Coupon();

            coupon.setCode(
                    request.getParameter("code")
            );

            coupon.setDiscountType(
                    request.getParameter("discountType")
            );

            coupon.setDiscountValue(
                    Double.parseDouble(
                            request.getParameter("discountValue")
                    )
            );

            coupon.setMinimumOrder(
                    Double.parseDouble(
                            request.getParameter("minimumOrder")
                    )
            );

            coupon.setMaximumDiscount(
                    Double.parseDouble(
                            request.getParameter("maximumDiscount")
                    )
            );

            coupon.setExpiryDate(
                    java.sql.Date.valueOf(
                            request.getParameter("expiryDate")
                    )
            );

            coupon.setStatus(true);

            boolean added =
                    couponDAO.addCoupon(coupon);

            if (added) {
                response.sendRedirect(
                        request.getContextPath() +
                        "/admin/coupons?success=1"
                );
            } else {
                response.sendRedirect(
                        request.getContextPath() +
                        "/admin/coupons?error=1"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() +
                    "/admin/coupons?error=1"
            );
        }
    }
}