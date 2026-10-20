package com.shopsphere.controller;

import com.shopsphere.model.Payment;
import com.shopsphere.service.CartService;
import com.shopsphere.service.OrderService;
import com.shopsphere.service.PaymentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private PaymentService paymentService;
    private OrderService orderService;
    private CartService cartService;

    @Override
    public void init() {
        paymentService = new PaymentService();
        orderService = new OrderService();
        cartService = new CartService();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect("login");
            return;
        }

        String orderIdParameter = request.getParameter("orderId");
        String amountParameter = request.getParameter("amount");
        String paymentMethod = request.getParameter("paymentMethod");

        if (orderIdParameter == null ||
            amountParameter == null ||
            paymentMethod == null) {

            response.sendRedirect("checkout?error=payment");
            return;
        }

        int orderId = Integer.parseInt(orderIdParameter);
        double amount = Double.parseDouble(amountParameter);

        Payment payment = new Payment();

        payment.setOrderId(orderId);
        payment.setPaymentMethod(paymentMethod);

        payment.setTransactionReference(
                "TXN-" + UUID.randomUUID()
        );

        payment.setAmount(amount);
        payment.setPaymentStatus("SUCCESS");

        boolean paymentSuccess =
                paymentService.createPayment(payment);

        if (paymentSuccess) {

            orderService.updatePaymentStatus(
                    orderId,
                    "PAID",
                    "COMPLETED"
            );

            int userId = (Integer) session.getAttribute("userId");

            cartService.clearCart(userId);

            response.sendRedirect(
                    "payment-success.jsp?orderId=" + orderId
            );

        } else {

            orderService.updatePaymentStatus(
                    orderId,
                    "FAILED",
                    "PAYMENT_FAILED"
            );

            response.sendRedirect(
                    "payment-failed.jsp?orderId=" + orderId
            );
        }
    }
}