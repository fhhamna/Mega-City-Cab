package dao;

import db.DBConnector;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Customer;

public class CustomerDAO {
    
    // Method to create a new customer
    public boolean addCustomer(Customer customer) {
        String query = "INSERT INTO customer (registration_ID, name, address, nic, phone_no, user_ID) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DBConnector.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, customer.getRegistration_ID());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getAddress());
            stmt.setString(4, customer.getNic());
            stmt.setString(5, customer.getPhone_no());
            stmt.setInt(6, customer.getUser_ID());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error in addCustomer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Method to get the customer by registration ID
    public Customer getCustomerByID(int registration_ID) {
        String sql = "SELECT * FROM customer WHERE registration_ID = ?";
        Customer customer = null;
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, registration_ID);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                customer = new Customer(
                    rs.getInt("registration_ID"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("nic"),
                    rs.getString("phone_no"),
                    rs.getInt("user_ID")
                );
            }
        } catch (SQLException e) {
            System.err.println("SQL Error in getCustomerByID: " + e.getMessage());
            e.printStackTrace();
        }
        return customer;
    }
    
    // Method to get all customers
    public List<Customer> getAllCustomers() {
        String sql = "SELECT * FROM customer";
        List<Customer> customerList = new ArrayList<>();
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Customer customer = new Customer(
                    rs.getInt("registration_ID"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("nic"),
                    rs.getString("phone_no"),
                    rs.getInt("user_ID")
                );
                customerList.add(customer);
            }
        } catch (SQLException e) {
            System.err.println("SQL Error in getAllCustomers: " + e.getMessage());
            e.printStackTrace();
        }
        return customerList;
    }
     
    // Method to update customer details
    public boolean updateCustomer(Customer customer) {
    String query = "UPDATE customer SET name = ?, address = ?, nic = ?, phone_no = ? WHERE registration_ID = ?";
    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, customer.getName());
        ps.setString(2, customer.getAddress());
        ps.setString(3, customer.getNic());
        ps.setString(4, customer.getPhone_no());
        ps.setInt(5, customer.getRegistration_ID());

        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0; // Returns true if update was successful

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

    
    // Method to delete customer by registration ID
    public boolean deleteCustomer(int registrationID) {
        String sql = "DELETE FROM customer WHERE registration_ID = ?";
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, registrationID);
            return stmt.executeUpdate() > 0;  
        } catch (SQLException e) {
            System.err.println("SQL Error in deleteCustomer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
