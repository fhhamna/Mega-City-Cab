
package dao;

import db.DBConnector;
import model.User;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class UserDAO {
     private Connection connection;
     
     public UserDAO(){
         Connection connection = DBConnector.getConnection();
     }
    

    public boolean registerUser(User user) {
      String query = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";

        try (Connection connection = DBConnector.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

         // Hash the password properly before saving
         String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)); // 12 rounds of hashing

         //Set parameters for the PreparedStatement
         statement.setString(1, user.getUsername());
         statement.setString(2, hashedPassword);
         statement.setString(3, user.getRole());  // "admin" or "customer"
        
         // ✅ Execute the query and check if the insert was successful
            int result = statement.executeUpdate();
            return result > 0;  // Return true if the user was successfully registered
         }  catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }


    public boolean validateUser(String username, String password) {
        String query = "SELECT password FROM user WHERE username = ?";
    
         try (Connection connection = DBConnector.getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {

             statement.setString(1, username);
             ResultSet resultSet = statement.executeQuery();

         if (resultSet.next()) {
            String storedHashedPassword = resultSet.getString("password");

            // ✅ Compare the entered password with the hashed password
            return BCrypt.checkpw(password, storedHashedPassword);
        }
    } catch (SQLException e) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    }
    return false;
}


    // Get the role of the user (admin/customer)
    public String getUserRole(String username) {
        String query = "SELECT role FROM user WHERE username = ?";
        try (Connection connection = DBConnector.getConnection();
         PreparedStatement statement = connection.prepareStatement(query)){
            
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                return resultSet.getString("role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean authenticateUser(String username, String password) {
        try {
            // Fetch user from database by username
            String query = "SELECT password FROM user WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Retrieve stored password
                String storedPassword = resultSet.getString("password");

                // Check if the password matches the hashed password
                if (BCrypt.checkpw(password, storedPassword)) {
                    return true; // Login successful
                } else {
                    return false; // Invalid password
                }
            } else {
                return false; // User not found
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}


  

   

   




    


