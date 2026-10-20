package com.shopsphere.controller;

import com.shopsphere.model.CartItem;
import com.shopsphere.service.CartService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() {
        cartService = new CartService();
    }

    private HttpSession getValidSession(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return null;
        }

        return session;
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                getValidSession(request, response);

        if (session == null) {
            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");

        List<CartItem> cartItems =
                cartService.getCartItems(userId);

        request.setAttribute(
                "cartItems",
                cartItems
        );

        request.getRequestDispatcher(
                "/cart.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                getValidSession(request, response);

        if (session == null) {
            return;
        }

        int userId =
                (Integer) session.getAttribute("userId");

        String action =
                request.getParameter("action");

        try {

            // Add product to cart
            if ("add".equalsIgnoreCase(action)) {

                int productId = Integer.parseInt(
                        request.getParameter("productId")
                );

                int quantity = Integer.parseInt(
                        request.getParameter("quantity")
                );

                if (quantity < 1) {
                    quantity = 1;
                }

                cartService.addToCart(
                        userId,
                        productId,
                        quantity
                );
            }

            // Update cart quantity
            else if ("update".equalsIgnoreCase(action)) {

                int cartId = Integer.parseInt(
                        request.getParameter("cartId")
                );

                int quantity = Integer.parseInt(
                        request.getParameter("quantity")
                );

                if (quantity > 0) {

                    cartService.updateQuantity(
                            cartId,
                            userId,
                            quantity
                    );

                } else {

                    cartService.removeFromCart(
                            cartId,
                            userId
                    );
                }
            }

            // Remove item from cart
            else if ("remove".equalsIgnoreCase(action)) {

                int cartId = Integer.parseInt(
                        request.getParameter("cartId")
                );

                cartService.removeFromCart(
                        cartId,
                        userId
                );
            }

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() +
                    "/cart?error=1"
            );
        }
    }
}