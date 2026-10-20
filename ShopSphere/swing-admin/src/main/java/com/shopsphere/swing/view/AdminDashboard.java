package com.shopsphere.swing.view;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import java.awt.GridLayout;

public class AdminDashboard extends JFrame {

    public AdminDashboard() {

        setTitle("ShopSphere - Admin Dashboard");
        setSize(600, 450);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);

        JPanel mainPanel = new JPanel(new GridLayout(0, 2, 15, 15));

        JLabel titleLabel = new JLabel(
                "ShopSphere Admin Dashboard",
                SwingConstants.CENTER
        );

        JButton productButton = new JButton("Product Management");
        JButton categoryButton = new JButton("Category Management");
        JButton customerButton = new JButton("Customer Management");
        JButton orderButton = new JButton("Order Management");
        JButton inventoryButton = new JButton("Inventory Management");
        JButton logoutButton = new JButton("Logout");

        mainPanel.add(titleLabel);
        mainPanel.add(new JLabel());

        mainPanel.add(productButton);
        mainPanel.add(categoryButton);
        mainPanel.add(customerButton);
        mainPanel.add(orderButton);
        mainPanel.add(inventoryButton);
        mainPanel.add(logoutButton);

        productButton.addActionListener(e -> {
            ProductFrame frame = new ProductFrame();
            frame.setVisible(true);
        });

        categoryButton.addActionListener(e -> {
            CategoryFrame frame = new CategoryFrame();
            frame.setVisible(true);
        });

        customerButton.addActionListener(e -> {
            CustomerFrame frame = new CustomerFrame();
            frame.setVisible(true);
        });

        orderButton.addActionListener(e -> {
            OrderFrame frame = new OrderFrame();
            frame.setVisible(true);
        });

        inventoryButton.addActionListener(e -> {
            InventoryFrame frame = new InventoryFrame();
            frame.setVisible(true);
        });

        logoutButton.addActionListener(e -> {
            dispose();

            LoginFrame loginFrame = new LoginFrame();
            loginFrame.setVisible(true);
        });

        add(mainPanel);
    }
}