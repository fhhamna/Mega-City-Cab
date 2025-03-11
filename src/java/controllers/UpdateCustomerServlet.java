/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author User
 */
@WebServlet("/admin/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            int registrationID = Integer.parseInt(request.getParameter("registration_ID"));
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String nic = request.getParameter("nic");
            String phoneNo = request.getParameter("phone_no");

            // Create a customer object with updated data
            Customer customer = new Customer();
            customer.setRegistrationID(registrationID); 
            customer.setName(name);
            customer.setAddress(address);
            customer.setNic(nic);
            customer.setPhoneNo(phoneNo);

            // Update the customer in the database
            CustomerDAO customerDAO = new CustomerDAO();
            boolean isUpdated = customerDAO.updateCustomer(customer);

            if (isUpdated) {
                response.sendRedirect("manageCustomers.jsp?success=Customer updated successfully");
            } else {
                response.sendRedirect("EditCustomer.jsp?registrationID=" + registrationID + "&error=Update failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("EditCustomer.jsp?error=Invalid input");
        }
    }
}
