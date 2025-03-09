
package controllers;

import dao.CustomerDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;


@WebServlet("/admin/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int registration_ID = Integer.parseInt(request.getParameter("registration_ID"));
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByID(registration_ID);

        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EditCustomer.jsp");
        dispatcher.forward(request, response);
    }
}
