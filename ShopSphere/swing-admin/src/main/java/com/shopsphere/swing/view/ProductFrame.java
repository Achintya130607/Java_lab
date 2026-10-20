package com.shopsphere.swing.view;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import java.awt.BorderLayout;
import java.awt.FlowLayout;

public class ProductFrame extends JFrame {

    private JTextField nameField;
    private JTextField priceField;
    private JTextField stockField;

    private JTable productTable;
    private DefaultTableModel tableModel;

    public ProductFrame() {

        setTitle("ShopSphere - Product Management");
        setSize(800, 500);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel topPanel = new JPanel(new FlowLayout());

        topPanel.add(new JLabel("Product Name:"));

        nameField = new JTextField(12);
        topPanel.add(nameField);

        topPanel.add(new JLabel("Price:"));

        priceField = new JTextField(8);
        topPanel.add(priceField);

        topPanel.add(new JLabel("Stock:"));

        stockField = new JTextField(6);
        topPanel.add(stockField);

        JButton addButton = new JButton("Add");
        JButton clearButton = new JButton("Clear");

        topPanel.add(addButton);
        topPanel.add(clearButton);

        tableModel = new DefaultTableModel(
                new Object[]{"ID", "Product Name", "Price", "Stock"},
                0
        );

        productTable = new JTable(tableModel);

        addButton.addActionListener(e -> addProduct());

        clearButton.addActionListener(e -> clearFields());

        add(topPanel, BorderLayout.NORTH);

        add(
                new JScrollPane(productTable),
                BorderLayout.CENTER
        );
    }

    private void addProduct() {

        String name = nameField.getText().trim();
        String price = priceField.getText().trim();
        String stock = stockField.getText().trim();

        if (name.isEmpty() || price.isEmpty() || stock.isEmpty()) {
            javax.swing.JOptionPane.showMessageDialog(
                    this,
                    "Please fill all fields.",
                    "Validation Error",
                    javax.swing.JOptionPane.WARNING_MESSAGE
            );
            return;
        }

        try {

            double productPrice = Double.parseDouble(price);
            int productStock = Integer.parseInt(stock);

            int id = tableModel.getRowCount() + 1;

            tableModel.addRow(new Object[]{
                    id,
                    name,
                    productPrice,
                    productStock
            });

            clearFields();

            javax.swing.JOptionPane.showMessageDialog(
                    this,
                    "Product added to the Swing table successfully."
            );

        } catch (NumberFormatException e) {

            javax.swing.JOptionPane.showMessageDialog(
                    this,
                    "Price must be a number and Stock must be an integer.",
                    "Invalid Input",
                    javax.swing.JOptionPane.ERROR_MESSAGE
            );
        }
    }

    private void clearFields() {
        nameField.setText("");
        priceField.setText("");
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
            ProductFrame frame = new ProductFrame();
            frame.setVisible(true);
        });
    }
}