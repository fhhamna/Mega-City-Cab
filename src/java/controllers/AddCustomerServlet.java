
package controllers;

import dao.CustomerDAO;
import java.io.IOException;
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
@WebServlet("/admin/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int registration_ID = Integer.parseInt(request.getParameter("registration_ID"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String phone_no = request.getParameter("phone_no");
        int user_ID = Integer.parseInt(request.getParameter("user_ID"));

        Customer customer = new Customer(registration_ID, name, address, nic, phone_no, user_ID);

        CustomerDAO customerDAO = new CustomerDAO();
        boolean isAdded = customerDAO.addCustomer(customer);
        if (isAdded) {
            response.sendRedirect("manageCustomers.jsp?message=Customer added successfully!");
        } else {
            response.sendRedirect("manageCustomers.jsp?error=Failed to add customer.");
        }
    }

}