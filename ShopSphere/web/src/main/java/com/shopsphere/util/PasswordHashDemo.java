package com.shopsphere.util;

public class PasswordHashDemo {

    public static void main(String[] args) {

        String demoPassword = "DemoPassword123";

        String hashedPassword =
                PasswordUtil.hashPassword(demoPassword);

        boolean verified =
                PasswordUtil.verifyPassword(
                        demoPassword,
                        hashedPassword
                );

        boolean wrongPassword =
                PasswordUtil.verifyPassword(
                        "WrongPassword",
                        hashedPassword
                );

        System.out.println("=================================");
        System.out.println("ShopSphere Password Hash Demo");
        System.out.println("=================================");

        System.out.println("Original password: " + demoPassword);
        System.out.println("SHA-256 Hash: " + hashedPassword);
        System.out.println("Correct password verified: " + verified);
        System.out.println("Wrong password verified: " + wrongPassword);

        System.out.println("=================================");
    }
}