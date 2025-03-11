/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;



import db.DBConnector;
import model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;



public class BookingDAO {
    // Method to insert a booking into the database
    public boolean insertBooking(Booking booking) {
    String sql = "INSERT INTO booking (pickup_location, destination, booking_date, booking_status, registration_ID, cab_ID) VALUES (?, ?, ?, ?, ?, ?)";
    
    try (Connection connection = DBConnector.getConnection();
         PreparedStatement stmt = connection.prepareStatement(sql)) {
        
        stmt.setString(1, booking.getPickupLocation());
        stmt.setString(2, booking.getDestination());
        stmt.setTimestamp(3, booking.getBookingDate()); // No need for Timestamp.valueOf()
        stmt.setString(4, booking.getBookingStatus());
        stmt.setInt(5, booking.getRegistrationID());
        stmt.setInt(6, booking.getCabID());
        
        int rowsInserted = stmt.executeUpdate();
        
        return rowsInserted > 0;  // Returns true if the booking was inserted successfully
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}


    // Method to get a booking by its ID
    public Booking getBookingByID(int bookingID) {
        String sql = "SELECT * FROM booking WHERE booking_ID = ?";
        Booking booking = null;
        
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            
            stmt.setInt(1, bookingID);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                booking = new Booking(
                    rs.getInt("booking_ID"),
                    rs.getString("pickup_location"),
                    rs.getString("destination"),
                    rs.getTimestamp("booking_date"),
                    rs.getString("booking_status"),
                    rs.getInt("registration_ID"),
                    rs.getInt("cab_ID")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }

    // Method to update the status of a booking
    public boolean updateBookingStatus(int bookingID, String newStatus) {
        String sql = "UPDATE booking SET booking_status = ? WHERE booking_ID = ?";
        
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            
            stmt.setString(1, newStatus);
            stmt.setInt(2, bookingID);
            
            int rowsUpdated = stmt.executeUpdate();
            
            return rowsUpdated > 0;  // Returns true if the booking status was updated successfully
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

    

