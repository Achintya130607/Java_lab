package com.shopsphere.controller;

import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products")
public class AdminProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
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

        String action = request.getParameter("action");

        // Delete product
        if ("delete".equalsIgnoreCase(action)) {

            String idParameter = request.getParameter("id");

            try {
                int productId = Integer.parseInt(idParameter);

                productDAO.deleteProduct(productId);

            } catch (Exception e) {
                e.printStackTrace();
            }

            response.sendRedirect(
                    request.getContextPath() +
                    "/admin/products?deleted=1"
            );

            return;
        }

        // Edit product
        if ("edit".equalsIgnoreCase(action)) {

            String idParameter = request.getParameter("id");

            try {
                int productId = Integer.parseInt(idParameter);

                Product editProduct =
                        productDAO.getProductById(productId);

                request.setAttribute(
                        "editProduct",
                        editProduct
                );

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        List<Product> products =
                productDAO.getAllProducts();

        request.setAttribute("products", products);

        request.getRequestDispatcher(
                "/admin/products.jsp"
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

        String action = request.getParameter("action");

        try {

            int categoryId = Integer.parseInt(
                    request.getParameter("categoryId")
            );

            String name =
                    request.getParameter("name");

            String brand =
                    request.getParameter("brand");

            String description =
                    request.getParameter("description");

            double price = Double.parseDouble(
                    request.getParameter("price")
            );

            double discount = Double.parseDouble(
                    request.getParameter("discount")
            );

            int stock = Integer.parseInt(
                    request.getParameter("stock")
            );

            String imageUrl =
                    request.getParameter("imageUrl");

            Product product = new Product();

            product.setCategoryId(categoryId);
            product.setName(name);
            product.setBrand(brand);
            product.setDescription(description);
            product.setPrice(price);
            product.setDiscount(discount);
            product.setStock(stock);
            product.setImageUrl(imageUrl);
            product.setStatus(true);

            // Update existing product
            if ("update".equalsIgnoreCase(action)) {

                int productId = Integer.parseInt(
                        request.getParameter("productId")
                );

                product.setProductId(productId);

                boolean updated =
                        productDAO.updateProduct(product);

                if (updated) {
                    response.sendRedirect(
                            request.getContextPath() +
                            "/admin/products?updated=1"
                    );
                } else {
                    response.sendRedirect(
                            request.getContextPath() +
                            "/admin/products?error=1"
                    );
                }

                return;
            }

            // Add new product
            boolean added =
                    productDAO.addProduct(product);

            if (added) {

                response.sendRedirect(
                        request.getContextPath() +
                        "/admin/products?success=1"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath() +
                        "/admin/products?error=1"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() +
                    "/admin/products?error=1"
            );
        }
    }
}