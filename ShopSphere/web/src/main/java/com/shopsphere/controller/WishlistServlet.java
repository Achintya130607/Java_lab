package com.shopsphere.controller;

import com.shopsphere.model.WishlistItem;
import com.shopsphere.service.WishlistService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private WishlistService wishlistService;

    @Override
    public void init() {
        wishlistService = new WishlistService();
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

        List<WishlistItem> wishlistItems =
                wishlistService.getWishlistItems(userId);

        request.setAttribute("wishlistItems", wishlistItems);

        request.getRequestDispatcher("/wishlist.jsp")
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

        int productId = Integer.parseInt(
                request.getParameter("productId")
        );

        wishlistService.addToWishlist(userId, productId);

        response.sendRedirect("wishlist");
    }
}