package dao;

import db.DBConnector;
import model.Billing;
import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class BillingDAO {


    private Connection connection;

    public BillingDAO() {
        this.connection = DBConnector.getConnection();
    }

    public boolean addBill(Billing bill) {
    String sql = "INSERT INTO billing (booking_ID, total_amount, tax, discount, final_amount, status) VALUES (?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        // Debugging: Check values before setting
        System.out.println("booking_ID: " + bill.getBookingID());
        System.out.println("total_amount: " + bill.getTotalAmount());
        System.out.println("tax: " + bill.getTax());
        System.out.println("discount: " + bill.getDiscount());
        System.out.println("Final Amount: " + bill.getFinalAmount());
        System.out.println("Status: " + bill.getStatus());

        stmt.setInt(1, bill.getBookingID());
        stmt.setBigDecimal(2, bill.getTotalAmount());
        stmt.setBigDecimal(3, bill.getTax());
        stmt.setBigDecimal(4, bill.getDiscount());
        stmt.setBigDecimal(5, bill.getFinalAmount());
        stmt.setString(6, bill.getStatus());

        // Execute the update and capture generated keys (bill_ID)
        int affectedRows = stmt.executeUpdate();
        if (affectedRows > 0) {
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    bill.setBillID(generatedKeys.getInt(1));  // Setting the generated bill_ID
                    System.out.println("Generated Bill ID: " + bill.getBillID());
                }
            }
            return true;  // Successfully added bill
        }
    } catch (SQLException e) {
        System.err.println("SQL Error in addBill: " + e.getMessage());
        e.printStackTrace();  // Log exception
    }
    return false;  // Return false if insertion fails
}


    public Billing getBillByBookingId(int booking_ID) {
        String sql = "SELECT * FROM billing WHERE booking_ID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, booking_ID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Billing(
                    rs.getInt("bill_ID"),
                    rs.getBigDecimal("total_amount"),
                    rs.getBigDecimal("tax"),
                    rs.getBigDecimal("discount"),
                    rs.getBigDecimal("final_amount"),
                    rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    
    // Method to update the bill status
    public boolean updateBillStatus(int billID, String newStatus) {
        String sql = "UPDATE billing SET status = ? WHERE bill_ID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, newStatus);
            stmt.setInt(2, billID);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
