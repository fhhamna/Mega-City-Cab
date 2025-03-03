
package controllers;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet{
    
    private UserDAO userDAO;
    
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    
        // Check if the user is valid
        boolean isValidUser = userDAO.validateUser(username, password);
        
        if (isValidUser) {
            String role = userDAO.getUserRole(username);
            // Set session attributes based on role
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);  // "admin" or "customer"
            
            if ("admin".equals(role)) {
                response.sendRedirect("admin/adminDashboard.jsp");
            } else {
                response.sendRedirect("customer/customerDashboard.jsp");
            }
        } else {
            // Invalid login credentials
            response.sendRedirect("loginError.jsp");
        }
    }
}
