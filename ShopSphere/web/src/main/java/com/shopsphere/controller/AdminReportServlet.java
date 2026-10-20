package com.shopsphere.controller;

import com.shopsphere.model.Order;
import com.shopsphere.model.Product;
import com.shopsphere.service.OrderService;
import com.shopsphere.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/reports")
public class AdminReportServlet extends HttpServlet {

    private final ProductService productService = new ProductService();
    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Product> products = productService.getAllProducts();
            List<Product> lowStockProducts = new ArrayList<>();

            for (Product product : products) {
                if (product.getStock() < 10) {
                    lowStockProducts.add(product);
                }
            }

            List<Order> orders = orderService.getAllOrders();

            double totalSales = 0.0;
            int paidOrders = 0;

            for (Order order : orders) {

                if ("PAID".equalsIgnoreCase(order.getPaymentStatus())
                        || "SUCCESS".equalsIgnoreCase(order.getPaymentStatus())) {

                    totalSales += order.getTotalAmount();
                    paidOrders++;
                }
            }

            request.setAttribute("lowStockProducts", lowStockProducts);
            request.setAttribute("orders", orders);
            request.setAttribute("totalSales", totalSales);
            request.setAttribute("paidOrders", paidOrders);

            request.getRequestDispatcher("/admin/reports.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load admin reports.",
                    e
            );
        }
    }
}