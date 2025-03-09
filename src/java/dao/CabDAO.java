/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnector;
import model.Cab;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CabDAO {
    
    public boolean addCab(Cab cab) {
        String query = "INSERT INTO cab (model, number_plate_no, status, price_per_km) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, cab.getModel());
            stmt.setString(2, cab.getNumberPlateNo());
            stmt.setString(3, cab.getStatus());
            stmt.setBigDecimal(4, cab.getPricePerKm());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCab(Cab cab) {
        String query = "UPDATE cab SET model=?, number_plate_no=?, status=?, price_per_km=? WHERE cab_ID=?";
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setString(1, cab.getModel());
            stmt.setString(2, cab.getNumberPlateNo());
            stmt.setString(3, cab.getStatus());
            stmt.setBigDecimal(4, cab.getPricePerKm());
            stmt.setInt(5, cab.getCabID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCab(int cabID) {
        String query = "DELETE FROM cab WHERE cab_ID=?";
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            
            stmt.setInt(1, cabID);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Cab> getAllCabs() {
        List<Cab> cabList = new ArrayList<>();
        String query = "SELECT * FROM cab";
        
        try (Connection connection = DBConnector.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Cab cab = new Cab(
                    rs.getInt("cab_ID"),
                    rs.getString("model"),
                    rs.getString("number_plate_no"),
                    rs.getString("status"),
                    rs.getBigDecimal("price_per_km")
                );
                cabList.add(cab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabList;
    }
    



    public Cab getCabById(int cabID) {
               Cab cab = null;
    String sql = "SELECT * FROM cab WHERE cab_ID = ?";
    
    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, cabID);
        System.out.println("Executing query: " + stmt); // Debugging

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            cab = new Cab(
                rs.getInt("cab_ID"),
                rs.getString("model"),
                rs.getString("number_plate_no"),
                rs.getString("status"),
                rs.getBigDecimal("price_per_km")
            );
            System.out.println("Cab found: " + cab.getModel()); // Debugging
        } else {
            System.out.println("No cab found with ID: " + cabID); // Debugging
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return cab;
}

}

    

