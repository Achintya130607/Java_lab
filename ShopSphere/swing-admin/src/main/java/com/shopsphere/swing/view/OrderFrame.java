package com.shopsphere.swing.view;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import java.awt.BorderLayout;
import java.awt.FlowLayout;

public class OrderFrame extends JFrame {

    private JTextField orderIdField;
    private JComboBox<String> statusBox;

    private JTable orderTable;
    private DefaultTableModel tableModel;

    public OrderFrame() {

        setTitle("ShopSphere - Order Management");
        setSize(800, 500);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel topPanel = new JPanel(new FlowLayout());

        topPanel.add(new JLabel("Order ID:"));

        orderIdField = new JTextField(10);
        topPanel.add(orderIdField);

        topPanel.add(new JLabel("Order Status:"));

        statusBox = new JComboBox<>(
                new String[]{
                        "PLACED",
                        "PROCESSING",
                        "SHIPPED",
                        "DELIVERED",
                        "CANCELLED"
                }
        );

        topPanel.add(statusBox);

        JButton updateButton = new JButton("Update Status");
        JButton clearButton = new JButton("Clear");

        topPanel.add(updateButton);
        topPanel.add(clearButton);

        tableModel = new DefaultTableModel(
                new Object[]{
                        "Order ID",
                        "Customer",
                        "Amount",
                        "Payment Status",
                        "Order Status"
                },
                0
        );

        orderTable = new JTable(tableModel);

        addSampleOrders();

        updateButton.addActionListener(e -> updateOrderStatus());

        clearButton.addActionListener(e -> clearFields());

        add(topPanel, BorderLayout.NORTH);

        add(
                new JScrollPane(orderTable),
                BorderLayout.CENTER
        );
    }

    private void addSampleOrders() {

        tableModel.addRow(new Object[]{
                1001,
                "Demo Customer",
                29999.0,
                "SUCCESS",
                "PLACED"
        });

        tableModel.addRow(new Object[]{
                1002,
                "Test Customer",
                1499.0,
                "SUCCESS",
                "SHIPPED"
        });
    }

    private void updateOrderStatus() {

        String orderIdText = orderIdField.getText().trim();

        if (orderIdText.isEmpty()) {

            JOptionPane.showMessageDialog(
                    this,
                    "Please enter Order ID.",
                    "Validation Error",
                    JOptionPane.WARNING_MESSAGE
            );

            return;
        }

        try {

            int orderId = Integer.parseInt(orderIdText);
            String newStatus = statusBox.getSelectedItem().toString();

            boolean found = false;

            for (int row = 0; row < tableModel.getRowCount(); row++) {

                int currentId = Integer.parseInt(
                        tableModel.getValueAt(row, 0).toString()
                );

                if (currentId == orderId) {

                    tableModel.setValueAt(
                            newStatus,
                            row,
                            4
                    );

                    found = true;
                    break;
                }
            }

            if (found) {

                JOptionPane.showMessageDialog(
                        this,
                        "Order status updated successfully."
                );

            } else {

                JOptionPane.showMessageDialog(
                        this,
                        "Order ID not found.",
                        "Error",
                        JOptionPane.ERROR_MESSAGE
                );
            }

        } catch (NumberFormatException e) {

            JOptionPane.showMessageDialog(
                    this,
                    "Order ID must be a number.",
                    "Invalid Input",
                    JOptionPane.ERROR_MESSAGE
            );
        }
    }

    private void clearFields() {

        orderIdField.setText("");
        statusBox.setSelectedIndex(0);
    }

    public static void main(String[] args) {

        try {
            javax.swing.UIManager.setLookAndFeel(
                    javax.swing.UIManager.getSystemLookAndFeelClassName()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        javax.swing.SwingUtilities.invokeLater(() -> {

            OrderFrame frame = new OrderFrame();
            frame.setVisible(true);
        });
    }
}