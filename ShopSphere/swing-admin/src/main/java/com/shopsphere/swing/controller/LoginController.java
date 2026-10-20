package com.shopsphere.swing.controller;

import com.shopsphere.swing.model.User;

public class LoginController {

    private final User adminUser;

    public LoginController() {

        adminUser = new User(
                1,
                "ShopSphere Admin",
                "admin@shopsphere.com",
                "",
                "ADMIN",
                true
        );
    }

    public boolean login(String email, String password) {

        if (email == null || password == null) {
            return false;
        }

        if (email.trim().isEmpty() || password.isEmpty()) {
            return false;
        }

        return adminUser.getEmail().equalsIgnoreCase(email.trim())
                && password.equals("admin123")
                && adminUser.isStatus()
                && "ADMIN".equalsIgnoreCase(adminUser.getRole());
    }

    public User getLoggedInUser() {
        return adminUser;
    }
}