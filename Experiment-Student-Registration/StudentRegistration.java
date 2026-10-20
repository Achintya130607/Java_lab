import javax.swing.*;
import java.awt.event.*;
import java.sql.*;

public class StudentRegistration extends JFrame implements ActionListener {

    JLabel lblName, lblRoll, lblGender, lblBranch;
    JTextField txtName, txtRoll, txtBranch;
    JRadioButton male, female;
    ButtonGroup genderGroup;
    JCheckBox terms;
    JButton submit, reset;

    StudentRegistration() {

        setTitle("Student Registration Form");
        setSize(450, 420);
        setLayout(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Name
        lblName = new JLabel("Student Name");
        lblName.setBounds(30, 30, 120, 30);
        add(lblName);

        txtName = new JTextField();
        txtName.setBounds(170, 30, 180, 30);
        add(txtName);

        // Roll Number
        lblRoll = new JLabel("Roll Number");
        lblRoll.setBounds(30, 80, 120, 30);
        add(lblRoll);

        txtRoll = new JTextField();
        txtRoll.setBounds(170, 80, 180, 30);
        add(txtRoll);

        // Gender
        lblGender = new JLabel("Gender");
        lblGender.setBounds(30, 130, 120, 30);
        add(lblGender);

        male = new JRadioButton("Male");
        male.setBounds(170, 130, 70, 30);
        add(male);

        female = new JRadioButton("Female");
        female.setBounds(250, 130, 90, 30);
        add(female);

        genderGroup = new ButtonGroup();
        genderGroup.add(male);
        genderGroup.add(female);

        // Branch
        lblBranch = new JLabel("Branch");
        lblBranch.setBounds(30, 180, 120, 30);
        add(lblBranch);

        txtBranch = new JTextField();
        txtBranch.setBounds(170, 180, 180, 30);
        add(txtBranch);

        // Terms
        terms = new JCheckBox("I accept Terms & Conditions");
        terms.setBounds(30, 230, 250, 30);
        add(terms);

        // Submit
        submit = new JButton("Submit");
        submit.setBounds(80, 290, 100, 35);
        submit.addActionListener(this);
        add(submit);

        // Reset
        reset = new JButton("Reset");
        reset.setBounds(220, 290, 100, 35);
        reset.addActionListener(this);
        add(reset);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        // Reset
        if (e.getSource() == reset) {

            txtName.setText("");
            txtRoll.setText("");
            txtBranch.setText("");

            genderGroup.clearSelection();
            terms.setSelected(false);

            return;
        }

        // Validation
        if (txtName.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please Enter Student Name");
            return;
        }

        if (txtRoll.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please Enter Roll Number");
            return;
        }

        if (!male.isSelected() && !female.isSelected()) {
            JOptionPane.showMessageDialog(this, "Please Select Gender");
            return;
        }

        if (txtBranch.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please Enter Branch");
            return;
        }

        if (!terms.isSelected()) {
            JOptionPane.showMessageDialog(this, "Please Accept Terms & Conditions");
            return;
        }

        String gender;

        if (male.isSelected())
            gender = "Male";
        else
            gender = "Female";

        // JDBC INSERT
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/college",
                    "root",
                    "1234"
            );

            String roll = txtRoll.getText().trim();

            String sql = "INSERT INTO student (id, name, branch, gender) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, roll);
            ps.setString(2, txtName.getText().trim());
            ps.setString(3, txtBranch.getText().trim());


            if (male.isSelected())
                gender = "Male";
            else
                gender = "Female";

            ps.setString(4, gender);

                ps.executeUpdate();

                    JOptionPane.showMessageDialog(this,
                        "Registration Successful\n\n"
                            + "Student Name : " + txtName.getText()
                            + "\nRoll Number : " + txtRoll.getText()
                            + "\nGender : " + gender
                            + "\nBranch : " + txtBranch.getText()
                            + "\n\nData Inserted Successfully!");

            ps.close();
            con.close();

        } catch (SQLException ex) {

            JOptionPane.showMessageDialog(this,
                    "Database Error: " + ex.getMessage());

        } catch (ClassNotFoundException ex) {

            JOptionPane.showMessageDialog(this,
                    "MySQL JDBC Driver Not Found!");

        }
    }

    public static void main(String[] args) {
        new StudentRegistration();
    }
}