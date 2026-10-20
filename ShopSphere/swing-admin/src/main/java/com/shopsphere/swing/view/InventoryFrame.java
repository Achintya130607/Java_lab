package com.shopsphere.swing.view;

import javax.swing.JButton;
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

public class InventoryFrame extends JFrame {

    private JTextField productIdField;
    private JTextField stockField;

    private JTable inventoryTable;
    private DefaultTableModel tableModel;

    public InventoryFrame() {

        setTitle("ShopSphere - Inventory Management");
        setSize(750, 500);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel topPanel = new JPanel(new FlowLayout());

        topPanel.add(new JLabel("Product ID:"));

        productIdField = new JTextField(8);
        topPanel.add(productIdField);

        topPanel.add(new JLabel("Stock:"));

        stockField = new JTextField(8);
        topPanel.add(stockField);

        JButton updateButton = new JButton("Update Stock");
        JButton clearButton = new JButton("Clear");

        topPanel.add(updateButton);
        topPanel.add(clearButton);

        tableModel = new DefaultTableModel(
                new Object[]{
                        "Product ID",
                        "Product Name",
                        "Current Stock",
                        "Status"
                },
                0
        );

        inventoryTable = new JTable(tableModel);

        addSampleProducts();

        updateButton.addActionListener(e -> updateStock());

        clearButton.addActionListener(e -> clearFields());

        add(topPanel, BorderLayout.NORTH);

        add(
                new JScrollPane(inventoryTable),
                BorderLayout.CENTER
        );
    }

    private void addSampleProducts() {

        tableModel.addRow(new Object[]{
                1,
                "Smartphone X1",
                25,
                "In Stock"
        });

        tableModel.addRow(new Object[]{
                2,
                "Laptop Pro 15",
                8,
                "Low Stock"
        });

        tableModel.addRow(new Object[]{
                3,
                "Casual T-Shirt",
                0,
                "Out of Stock"
        });
    }

    private void updateStock() {

        String productIdText = productIdField.getText().trim();
        String stockText = stockField.getText().trim();

        if (productIdText.isEmpty() || stockText.isEmpty()) {

            JOptionPane.showMessageDialog(
                    this,
                    "Please enter Product ID and Stock.",
                    "Validation Error",
                    JOptionPane.WARNING_MESSAGE
            );

            return;
        }

        try {

            int productId = Integer.parseInt(productIdText);
            int newStock = Integer.parseInt(stockText);

            if (newStock < 0) {

                JOptionPane.showMessageDialog(
                        this,
                        "Stock cannot be negative.",
                        "Invalid Stock",
                        JOptionPane.ERROR_MESSAGE
                );

                return;
            }

            boolean found = false;

            for (int row = 0; row < tableModel.getRowCount(); row++) {

                int currentId = Integer.parseInt(
                        tableModel.getValueAt(row, 0).toString()
                );

                if (currentId == productId) {

                    tableModel.setValueAt(
                            newStock,
                            row,
                            2
                    );

                    String status;

                    if (newStock == 0) {
                        status = "Out of Stock";
                    } else if (newStock < 10) {
                        status = "Low Stock";
                    } else {
                        status = "In Stock";
                    }

                    tableModel.setValueAt(
                            status,
                            row,
                            3
                    );

                    found = true;
                    break;
                }
            }

            if (found) {

                JOptionPane.showMessageDialog(
                        this,
                        "Inventory updated successfully."
                );

            } else {

                JOptionPane.showMessageDialog(
                        this,
                        "Product ID not found.",
                        "Error",
                        JOptionPane.ERROR_MESSAGE
                );
            }

        } catch (NumberFormatException e) {

            JOptionPane.showMessageDialog(
                    this,
                    "Product ID and Stock must be numbers.",
                    "Invalid Input",
                    JOptionPane.ERROR_MESSAGE
            );
        }
    }

    private void clearFields() {

        productIdField.setText("");
        stockField.setText("");
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

            InventoryFrame frame = new InventoryFrame();
            frame.setVisible(true);
        });
    }
}