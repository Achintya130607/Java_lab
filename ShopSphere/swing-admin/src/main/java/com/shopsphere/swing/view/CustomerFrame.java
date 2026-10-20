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

public class CustomerFrame extends JFrame {

    private JTextField nameField;
    private JTextField emailField;
    private JTextField mobileField;

    private JTable customerTable;
    private DefaultTableModel tableModel;

    public CustomerFrame() {

        setTitle("ShopSphere - Customer Management");
        setSize(800, 500);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel topPanel = new JPanel(new FlowLayout());

        topPanel.add(new JLabel("Name:"));

        nameField = new JTextField(12);
        topPanel.add(nameField);

        topPanel.add(new JLabel("Email:"));

        emailField = new JTextField(15);
        topPanel.add(emailField);

        topPanel.add(new JLabel("Mobile:"));

        mobileField = new JTextField(10);
        topPanel.add(mobileField);

        JButton addButton = new JButton("Add");
        JButton clearButton = new JButton("Clear");

        topPanel.add(addButton);
        topPanel.add(clearButton);

        tableModel = new DefaultTableModel(
                new Object[]{"ID", "Name", "Email", "Mobile"},
                0
        );

        customerTable = new JTable(tableModel);

        addButton.addActionListener(e -> addCustomer());

        clearButton.addActionListener(e -> clearFields());

        add(topPanel, BorderLayout.NORTH);

        add(
                new JScrollPane(customerTable),
                BorderLayout.CENTER
        );
    }

    private void addCustomer() {

        String name = nameField.getText().trim();
        String email = emailField.getText().trim();
        String mobile = mobileField.getText().trim();

        if (name.isEmpty() || email.isEmpty() || mobile.isEmpty()) {

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
                email,
                mobile
        });

        clearFields();

        JOptionPane.showMessageDialog(
                this,
                "Customer added to the Swing table successfully."
        );
    }

    private void clearFields() {

        nameField.setText("");
        emailField.setText("");
        mobileField.setText("");
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

            CustomerFrame frame = new CustomerFrame();
            frame.setVisible(true);
        });
    }
}