
package dao;

import java.util.List;
import model.Customer;


public class TestCustomerDAO {
    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
        
        // Test Add Customer
        Customer customer = new Customer(1, "Hamna", "76 Colombo", "123456789V", "0771234567", 1);
        customerDAO.addCustomer(customer);
        
        // Test Get Customer by ID
        Customer fetchedCustomer = customerDAO.getCustomerByID(1);
        System.out.println("Fetched Customer: " + fetchedCustomer.getName());
        
        // Test Get All Customers
        List<Customer> customers = customerDAO.getAllCustomers();
        customers.forEach(c -> System.out.println("Customer: " + c.getName()));
        
        // Test Update Customer
        fetchedCustomer.setName("HamnaS");
        customerDAO.updateCustomer(fetchedCustomer);
        
        // Test Delete Customer
        customerDAO.deleteCustomer(1);
    }
}

 
