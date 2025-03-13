/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import db.DBConnector;
import model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class BookingDAO {


    private Connection connection;

    public BookingDAO() {
        this.connection = DBConnector.getConnection();
    }

    // ✅ Insert a new booking
    public boolean bookCab(Booking booking) {
        String sql = "INSERT INTO booking (pickup_location, destination, booking_date, booking_status, registration_ID, cab_ID) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, booking.getPickupLocation());
            stmt.setString(2, booking.getDestination());
            stmt.setTimestamp(3, booking.getBookingDate()); // ✅ Timestamp
            stmt.setString(4, booking.getBookingStatus());  // ✅ ENUM
            stmt.setInt(5, booking.getRegistrationID());
            stmt.setInt(6, booking.getCabID());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Fetch bookings for a specific customer
    public List<Booking> getBookingsByCustomer(int registrationID) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking WHERE registration_ID = ? ORDER BY booking_date DESC";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, registrationID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getString("pickup_location"),
                    rs.getString("destination"),
                    rs.getTimestamp("booking_date"),
                    rs.getString("booking_status"),
                    rs.getInt("registration_ID"),
                    rs.getInt("cab_ID")
                );
                booking.setBookingID(rs.getInt("booking_ID"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
   

    // Method to get all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking";  // Modify if you need specific filters

        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("booking_ID"),
                        rs.getString("pickup_location"),
                        rs.getString("destination"),
                        rs.getTimestamp("booking_date"),
                        rs.getString("booking_status"),
                        rs.getInt("registration_ID"),
                        rs.getInt("cab_ID")
                );
                bookings.add(booking);
            }

        } catch (SQLException e) {
            System.err.println("SQL Error in getAllBookings: " + e.getMessage());
            e.printStackTrace();
        }
        return bookings;
    }
    
     // Method to update the booking status
    public boolean updateBookingStatus(int booking_ID, String newStatus) {
        String sql = "UPDATE booking SET booking_status = ? WHERE booking_ID = ?";
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, newStatus);
            stmt.setInt(2, booking_ID);
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // Return true if the update was successful

        } catch (SQLException e) {
            System.err.println("SQL Error in updateBookingStatus: " + e.getMessage());
            e.printStackTrace();
            return false;  // Return false if the update failed
        }
    }
}



