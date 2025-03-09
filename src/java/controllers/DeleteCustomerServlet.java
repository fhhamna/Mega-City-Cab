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

/**
 *
 * @author User
 */
@WebServlet("/admin/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int registration_ID = Integer.parseInt(request.getParameter("registration_ID"));
        CustomerDAO customerDAO = new CustomerDAO();
        boolean success = customerDAO.deleteCustomer(registration_ID);

        if (success) {
            response.sendRedirect("manageCustomers.jsp?message=Customer deleted successfully!");
        } else {
            response.sendRedirect("manageCustomers.jsp?error=Failed to delete customer.");
        }
    }
}
