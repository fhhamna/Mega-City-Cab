package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
    private static final String url = "jdbc:mysql://localhost:3305/mega_city_cab";
    private static final String username = "root"; 
    private static final String password = "Hamna@08"; 
    
    // Private constructor to prevent instantiation
    private DBConnector() {}

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); 
        }
        return connection;
    }
}
