package dao;

import db.DBConnector;
import model.User;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    private Connection connection;

    public UserDAO() {
        this.connection = DBConnector.getConnection(); // ✅ Properly initialize the connection
    }

    public boolean registerUser(User user) {
    String sql = "INSERT INTO user (username, password, registration_ID) VALUES (?, ?, ?)";
    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getPassword()); // ✅ Already hashed before inserting
        stmt.setInt(3, user.getRegistrationID());

        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    
    public String getPasswordByUsername(String username) {
    String sql = "SELECT password FROM user WHERE username = ?";
    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            String password = rs.getString("password");
            System.out.println("Fetched password for user: " + username); // Debugging
            return password; // ✅ Return the hashed password
        }
    } catch (SQLException e) {
        System.out.println("Error while fetching password for user: " + username);
        e.printStackTrace();
    }
    return null; // ✅ Return null if user not found
}
    public int getRegistrationIDByUsername(String username) {
    int registrationID = -1;
    String sql = "SELECT registration_ID FROM user WHERE username = ?";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            registrationID = rs.getInt("registration_ID");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return registrationID;
}



   public int getRegistrationID(String username, String password) {
    String sql = "SELECT registration_ID FROM user WHERE username = ? AND password = ?";
    
    try (Connection con = DBConnector.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setString(1, username);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("registration_ID"); // ✅ Return registration_ID
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return -1; // ✅ Return -1 if user not found
}


    public boolean validateUser(String username, String password) {
    String sql = "SELECT password FROM user WHERE username = ?";
    
    try (Connection con = DBConnector.getConnection();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String hashedPassword = rs.getString("password"); // ✅ Get hashed password from DB
            
            // ✅ Compare hashed password with entered password
            if (BCrypt.checkpw(password, hashedPassword)) {
                return true; // ✅ Password matches
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; // ❌ Invalid login
}


    public boolean isValidRegistrationID(int registrationID) { // ✅ Changed parameter to int
        String query = "SELECT COUNT(*) FROM customer WHERE registration_ID = ?";

        try (Connection con = DBConnector.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, registrationID); // ✅ Now handles int correctly
            ResultSet rs = stmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                return true; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getUserRole(String username) {
    String query = "SELECT role FROM user WHERE username = ?";
    try (Connection con = DBConnector.getConnection();
         PreparedStatement stmt = con.prepareStatement(query)) {
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            String role = rs.getString("role");
            System.out.println("Fetched role from DB: " + role);  // Debugging log
            return role;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;  // Role not found
}



    
    

}
