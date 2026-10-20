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

public class CategoryFrame extends JFrame {

    private JTextField nameField;
    private JTextField descriptionField;

    private JTable categoryTable;
    private DefaultTableModel tableModel;

    public CategoryFrame() {

        setTitle("ShopSphere - Category Management");
        setSize(750, 500);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel topPanel = new JPanel(new FlowLayout());

        topPanel.add(new JLabel("Category Name:"));

        nameField = new JTextField(12);
        topPanel.add(nameField);

        topPanel.add(new JLabel("Description:"));

        descriptionField = new JTextField(18);
        topPanel.add(descriptionField);

        JButton addButton = new JButton("Add");
        JButton clearButton = new JButton("Clear");

        topPanel.add(addButton);
        topPanel.add(clearButton);

        tableModel = new DefaultTableModel(
                new Object[]{"ID", "Category Name", "Description"},
                0
        );

        categoryTable = new JTable(tableModel);

        addButton.addActionListener(e -> addCategory());

        clearButton.addActionListener(e -> clearFields());

        add(topPanel, BorderLayout.NORTH);

        add(
                new JScrollPane(categoryTable),
                BorderLayout.CENTER
        );
    }

    private void addCategory() {

        String name = nameField.getText().trim();
        String description = descriptionField.getText().trim();

        if (name.isEmpty() || description.isEmpty()) {
            JOptionPane.showMessageDialog(
                    this,
                    "Please fill all fields.",
                    "Validation Error",
                    JOptionPane.WARNING_MESSAGE
            );
            return;
        }

        int id = tableModel.getRowCount() + 1;

        tableModel.addRow(new Object[]{
                id,
                name,
                description
        });

        clearFields();

        JOptionPane.showMessageDialog(
                this,
                "Category added to the Swing table successfully."
        );
    }

    private void clearFields() {
        nameField.setText("");
        descriptionField.setText("");
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
            CategoryFrame frame = new CategoryFrame();
            frame.setVisible(true);
        });
    }
}