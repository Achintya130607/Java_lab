package com.shopsphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/jndi-demo")
public class JndiDemoServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            Context context = new InitialContext();

            Object appName =
                    context.lookup("java:comp/env/shopSphereAppName");

            out.println("<html>");
            out.println("<head><title>ShopSphere JNDI Demo</title></head>");
            out.println("<body>");
            out.println("<h1>ShopSphere JNDI Demonstration</h1>");
            out.println("<p><strong>JNDI Resource Name:</strong> java:comp/env/shopSphereAppName</p>");
            out.println("<p><strong>JNDI Value:</strong> " + appName + "</p>");
            out.println("<p>JNDI resource lookup successful!</p>");
            out.println("</body>");
            out.println("</html>");

        } catch (NamingException e) {

            throw new ServletException(
                    "JNDI resource lookup failed.",
                    e
            );
        }
    }
}