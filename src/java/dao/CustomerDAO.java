
package dao;

import db.DBConnector;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Customer;


public class CustomerDAO {
    
    //Method to create a new customer
    public void addCustomer(Customer customer){
        String sql = "INSERT INTO customer (registration_ID, name, address, nic, phone_no, user_id) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, customer.getRegistrationID());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getAddress());
            stmt.setString(4, customer.getNic());
            stmt.setString(5, customer.getPhoneNo());
            stmt.setInt(6, customer.getUserID());
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace(); 
}
    }
    
    //Method to get the customer by registration ID
    
    public Customer getCustomerByID(int registrationID){
        String sql = "SELECT * FROM customer WHERE registration_ID = ?";
        Customer customer = null;
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, registrationID);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                customer = new Customer(
                    rs.getInt("registration_ID"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("nic"),
                    rs.getString("phone_no"),
                    rs.getInt("user_id")
                );
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
    
    //Method to get all customers
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
                    rs.getInt("user_id")
                );
                customerList.add(customer);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
     
     //Method to Update Customer details
      public void updateCustomer(Customer customer) {
        String sql = "UPDATE customer SET name = ?, address = ?, nic = ?, phone_no = ?, user_id = ? WHERE registration_ID = ?";
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getNic());
            stmt.setString(4, customer.getPhoneNo());
            stmt.setInt(5, customer.getUserID());
            stmt.setInt(6, customer.getRegistrationID());
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Method to delete customer by registration ID
    public void deleteCustomer(int registrationID) {
        String sql = "DELETE FROM customer WHERE registration_ID = ?";
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, registrationID);
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }

