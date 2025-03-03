package controllers;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    // Remove the duplicate doPost() method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

       // Create User object with the collected data
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);
        
        // Pass the User object to the DAO for registration
        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
            response.sendRedirect("login.jsp?message=Registration successful! Please log in.");
        } else {
            response.sendRedirect("register.jsp?error=Registration failed. Try again.");
        }
    }

    // Optionally, handle the GET request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If needed, you can redirect or serve a specific page
        response.sendRedirect("register.jsp");
    }

    @Override
    public String getServletInfo() {
        return "User Registration Servlet";
    }
}
