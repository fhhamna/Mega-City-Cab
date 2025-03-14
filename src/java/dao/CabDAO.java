package dao;

import db.DBConnector;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cab;

public class CabDAO {

    // Method to add a new cab
    public boolean addCab(Cab cab) {
    String sql = "INSERT INTO cab (model, status, price_per_km, passengers, suitcases, transmission) VALUES (?, ?, ?, ?, ?, ?)";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, cab.getModel());
        stmt.setString(2, cab.getStatus());
        stmt.setBigDecimal(3, cab.getPricePerKm());
        stmt.setInt(4, cab.getPassengers());
        stmt.setInt(5, cab.getSuitcases());
        stmt.setString(6, cab.getTransmission());

        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Cab added successfully.");
            return true;  // Return true if the insert is successful
        } else {
            System.out.println("Failed to add cab.");
            return false;  // Return false if no rows were inserted
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return false;  // Return false in case of an exception
    }
}



    // Method to update a cab
    public boolean updateCab(Cab cab) {
    String sql = "UPDATE cab SET model=?, status=?, price_per_km=?, passengers=?, suitcases=?, transmission=? WHERE cab_ID=?";

    // Use a try-with-resources statement to manage the connection and prepared statement
    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        // Bind parameters to the prepared statement
        stmt.setString(1, cab.getModel());
        stmt.setString(2, cab.getStatus());
        stmt.setBigDecimal(3, cab.getPricePerKm());
        stmt.setInt(4, cab.getPassengers());
        stmt.setInt(5, cab.getSuitcases());
        stmt.setString(6, cab.getTransmission());
        stmt.setInt(7, cab.getCabID());

        // Execute the update and return true if the update was successful
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            return true;
        } else {
            System.out.println("No rows were updated. Cab ID may not exist or the data is unchanged.");
            return false;
        }

    } catch (SQLException e) {
        // Log the exception with a more descriptive message
        System.err.println("Error updating cab with ID: " + cab.getCabID());
        e.printStackTrace();
        return false;
    }
}


    // Method to delete a cab
    public boolean deleteCab(int cabID) {
        String sql = "DELETE FROM cab WHERE cab_ID=?";

        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cabID);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all cabs
    public List<Cab> getAllCabs() {
        String sql = "SELECT * FROM cab";
        List<Cab> cabList = new ArrayList<>();

        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Cab cab = new Cab(
                    rs.getInt("cab_ID"),
                    rs.getString("model"),
                    rs.getString("status"),
                    rs.getBigDecimal("price_per_km"),
                    rs.getInt("passengers"),
                    rs.getInt("suitcases"),
                    rs.getString("transmission")
                );
                cabList.add(cab);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error in getAllCabs: " + e.getMessage());
            e.printStackTrace();
        }
        return cabList;
    }

public Cab getCabByID(int cab_ID) {
    System.out.println("Fetching cab details for cab_ID: " + cab_ID); // Debugging
    String sql = "SELECT * FROM cab WHERE cab_ID = ?";
    Cab cab = null;

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
         
        stmt.setInt(1, cab_ID);  
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            cab = new Cab(
                rs.getInt("cab_ID"),
                rs.getString("model"),
                rs.getString("status"),
                rs.getBigDecimal("price_per_km"),
                rs.getInt("passengers"),
                rs.getInt("suitcases"),
                rs.getString("transmission")
            );
        } else {
            System.out.println("Cab with ID " + cab_ID + " not found in database."); // Debugging
        }
    } catch (SQLException e) {
        System.err.println("SQL Error in getCabByID: " + e.getMessage());
        e.printStackTrace();
    }

    return cab;
}




    public List<Cab> getAvailableCabs() {
    String sql = "SELECT * FROM cab WHERE status = 'Available'";
    List<Cab> availableCabs = new ArrayList<>();

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        // Check if ResultSet is empty or null
        if (rs != null) {
            while (rs.next()) {
                Cab cab = new Cab(
                    rs.getInt("cab_ID"),
                    rs.getString("model"),
                    rs.getString("status"),
                    rs.getBigDecimal("price_per_km"),
                    rs.getInt("passengers"),
                    rs.getInt("suitcases"),
                    rs.getString("transmission")
                );
                availableCabs.add(cab);
            }
        }

    } catch (SQLException e) {
        System.err.println("SQL Error in getAvailableCabs: " + e.getMessage());
        e.printStackTrace(); // Log the error
    }

    // Return the list, even if it's empty
    return availableCabs;
}



    
}
