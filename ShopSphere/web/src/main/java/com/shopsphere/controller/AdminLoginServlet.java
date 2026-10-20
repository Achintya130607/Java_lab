package com.shopsphere.controller;

import com.shopsphere.dao.UserDAO;
import com.shopsphere.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null && "ADMIN".equalsIgnoreCase(user.getRole())) {

            HttpSession session = request.getSession();

            session.setAttribute("adminUser", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("role", user.getRole());

            response.sendRedirect(
                    request.getContextPath() + "/admin/dashboard.jsp"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath() + "/admin/login.jsp?error=1"
            );
        }
    }
}