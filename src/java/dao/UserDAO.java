
package dao;

import db.DBConnector;
import model.User;
import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;


public class UserDAO {
     private Connection connection;
     
     public UserDAO(){
         connection = DBConnector.getConnection();
     }
    
    //Validating user credentials
   public boolean registerUser(User user) {
        try {
            // Hash password before saving
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
            
            // Insert user into DB
            String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, user.getUsername());
            statement.setString(2, hashedPassword);
            statement.setString(3, user.getRole());  // "admin" or "customer"
            int result = statement.executeUpdate();
            
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Check if the provided password matches the hashed password in the database
    public boolean validateUser(String username, String password) {
        try {
            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                String storedHash = resultSet.getString("password");
                return BCrypt.checkpw(password, storedHash);  // Compare passwords
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get the role of the user (admin/customer)
    public String getUserRole(String username) {
        try {
            String query = "SELECT role FROM users WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(query);
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

  

   

   
}



    


