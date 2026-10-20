package com.shopsphere.controller;

import com.shopsphere.dao.OrderDAO;
import com.shopsphere.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
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

        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/admin/orders.jsp")
               .forward(request, response);
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

        String action = request.getParameter("action");

        if ("updateStatus".equalsIgnoreCase(action)) {

            String orderIdParam = request.getParameter("orderId");
            String orderStatus = request.getParameter("orderStatus");

            try {

                int orderId = Integer.parseInt(orderIdParam);

                if (isValidOrderStatus(orderStatus)) {

                    boolean updated =
                            orderDAO.updateOrderStatus(
                                    orderId,
                                    orderStatus
                            );

                    if (updated) {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/admin/orders?updated=1"
                        );

                    } else {

                        response.sendRedirect(
                                request.getContextPath()
                                + "/admin/orders?error=1"
                        );
                    }

                } else {

                    response.sendRedirect(
                            request.getContextPath()
                            + "/admin/orders?error=1"
                    );
                }

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/orders?error=1"
                );
            }

            return;
        }

        response.sendRedirect(
                request.getContextPath() + "/admin/orders"
        );
    }


    private boolean isAdmin(HttpServletRequest request) {

        HttpSession session = request.getSession(false);

        return session != null
                && "ADMIN".equalsIgnoreCase(
                        (String) session.getAttribute("role")
                );
    }


    private boolean isValidOrderStatus(String status) {

        if (status == null) {
            return false;
        }

        return "PENDING".equalsIgnoreCase(status)
                || "PROCESSING".equalsIgnoreCase(status)
                || "SHIPPED".equalsIgnoreCase(status)
                || "DELIVERED".equalsIgnoreCase(status)
                || "CANCELLED".equalsIgnoreCase(status)
                || "COMPLETED".equalsIgnoreCase(status);
    }
}