package com.shopsphere.controller;

import com.shopsphere.dao.CategoryDAO;
import com.shopsphere.model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/categories")
public class AdminCategoryServlet extends HttpServlet {

    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        categoryDAO = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                !"ADMIN".equalsIgnoreCase(
                        (String) session.getAttribute("role"))) {

            response.sendRedirect(
                    request.getContextPath() + "/admin/login"
            );
            return;
        }

        List<Category> categories =
                categoryDAO.getAllCategories();

        request.setAttribute("categories", categories);

        request.getRequestDispatcher(
                "/admin/categories.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                !"ADMIN".equalsIgnoreCase(
                        (String) session.getAttribute("role"))) {

            response.sendRedirect(
                    request.getContextPath() + "/admin/login"
            );
            return;
        }

        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Category category = new Category();

        category.setName(name);
        category.setDescription(description);
        category.setStatus(true);

        boolean added = categoryDAO.addCategory(category);

        if (added) {
            response.sendRedirect(
                    request.getContextPath() +
                    "/admin/categories?success=1"
            );
        } else {
            response.sendRedirect(
                    request.getContextPath() +
                    "/admin/categories?error=1"
            );
        }
    }
}