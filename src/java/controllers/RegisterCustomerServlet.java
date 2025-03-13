package controllers;

import db.DBConnector;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterCustomer")
public class RegisterCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone_no");

        int registrationID = 0;

        try (Connection con = DBConnector.getConnection()) {
            // ✅ Get the next available registration_ID
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT MAX(registration_ID) FROM customer");
            if (rs.next()) {
                registrationID = rs.getInt(1) + 1;  // Increment last ID
            } else {
                registrationID = 1;  // Start from 1 if table is empty
            }

            // ✅ Insert new customer
            PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO customer (registration_ID, name, address, nic, phone_no) VALUES (?, ?, ?, ?, ?)");
            pstmt.setInt(1, registrationID);
            pstmt.setString(2, name);
            pstmt.setString(3, address);
            pstmt.setString(4, nic);
            pstmt.setString(5, phone);
            pstmt.executeUpdate();

            // ✅ Store registration_ID in session for later use
            HttpSession session = request.getSession();
            session.setAttribute("registration_ID", registrationID);

            // ✅ Redirect to the registration page with a success message
            response.sendRedirect("register.jsp?message=Customer registered successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("registerCustomer.jsp?error=Database Error. Try again.");
        }
    }
}
