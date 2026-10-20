package com.shopsphere.controller;

import com.shopsphere.model.Address;
import com.shopsphere.model.CartItem;
import com.shopsphere.model.Coupon;
import com.shopsphere.model.Order;
import com.shopsphere.model.OrderItem;
import com.shopsphere.service.AddressService;
import com.shopsphere.service.CartService;
import com.shopsphere.service.CouponService;
import com.shopsphere.service.OrderItemService;
import com.shopsphere.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private AddressService addressService;
    private CartService cartService;
    private CouponService couponService;
    private OrderService orderService;
    private OrderItemService orderItemService;

    @Override
    public void init() {
        addressService = new AddressService();
        cartService = new CartService();
        couponService = new CouponService();
        orderService = new OrderService();
        orderItemService = new OrderItemService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        String couponCode = request.getParameter("coupon");

        List<CartItem> cartItems = cartService.getCartItems(userId);

        double totalAmount = 0;

        for (CartItem item : cartItems) {
            totalAmount += item.getProduct().getPrice()
                    * item.getQuantity();
        }

        double discount = 0;

        if (couponCode != null && !couponCode.trim().isEmpty()) {

            Coupon coupon = couponService.getValidCoupon(
                    couponCode.trim()
            );

            discount = couponService.calculateDiscount(
                    coupon,
                    totalAmount
            );

            if (coupon != null && discount > 0) {
                request.setAttribute("couponCode", coupon.getCode());
            }
        }

        double finalAmount = totalAmount - discount;

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("discount", discount);
        request.setAttribute("finalAmount", finalAmount);

        request.getRequestDispatcher("/checkout.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        String addressLine = request.getParameter("addressLine");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String addressType = request.getParameter("addressType");
        String paymentMethod = request.getParameter("paymentMethod");
        String couponCode = request.getParameter("couponCode");

        Address address = new Address();

        address.setUserId(userId);
        address.setAddressLine(addressLine);
        address.setCity(city);
        address.setState(state);
        address.setPincode(pincode);
        address.setAddressType(addressType);

        int addressId = addressService.addAddress(address);

        if (addressId == 0) {
            response.sendRedirect("checkout?error=address");
            return;
        }

        List<CartItem> cartItems = cartService.getCartItems(userId);

        if (cartItems.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        double totalAmount = 0;

        for (CartItem item : cartItems) {
            totalAmount += item.getProduct().getPrice()
                    * item.getQuantity();
        }

        double discount = 0;

        if (couponCode != null && !couponCode.trim().isEmpty()) {

            Coupon coupon = couponService.getValidCoupon(
                    couponCode.trim()
            );

            discount = couponService.calculateDiscount(
                    coupon,
                    totalAmount
            );
        }

        double finalAmount = totalAmount - discount;

        Order order = new Order();

        order.setUserId(userId);
        order.setAddressId(addressId);
        order.setTotalAmount(finalAmount);
        order.setDiscount(discount);
        order.setPaymentMethod(paymentMethod);
        order.setPaymentStatus("PENDING");
        order.setOrderStatus("PLACED");

        int orderId = orderService.createOrder(order);

        if (orderId == 0) {
            response.sendRedirect("checkout?error=order");
            return;
        }

        for (CartItem item : cartItems) {

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderId(orderId);
            orderItem.setProductId(item.getProductId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setPrice(item.getProduct().getPrice());

            orderItemService.addOrderItem(orderItem);
        }

        // Order create hone ke baad payment page par bhejo
        response.sendRedirect(
                "payment.jsp?orderId=" + orderId +
                "&amount=" + finalAmount
        );
    }
}