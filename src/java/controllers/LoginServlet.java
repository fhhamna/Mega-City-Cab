package controllers;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hardcode admin credentials
        String hardcodedAdminUsername = "admin";
        String hardcodedAdminPassword = "admin123"; // In production, use hashed passwords, not plain text

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        // Check if the user is admin
        if (hardcodedAdminUsername.equals(username) && hardcodedAdminPassword.equals(password)) {
            // Set session attributes for admin
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", "Admin");

            // Redirect to admin dashboard
            response.sendRedirect("admin/admindashboard.jsp");
        } else {
            // Get stored hashed password from the database for non-admin users
            String storedHashedPassword = userDAO.getPasswordByUsername(username);
            System.out.println("Stored Hashed Password: " + storedHashedPassword);

            if (storedHashedPassword != null && BCrypt.checkpw(password, storedHashedPassword)) {
                // Get user details
                int registrationID = userDAO.getRegistrationIDByUsername(username);
                String role = userDAO.getUserRole(username);
                System.out.println("User Role: " + role);
                System.out.println("Registration ID: " + registrationID);

                if (role == null) {
                    role = "Customer"; // Default role if not found
                }

                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("registration_ID", registrationID);

                // Redirect based on role
                if ("Admin".equals(role)) {
                    response.sendRedirect("admin/admindashboard.jsp");
                } else {
                    response.sendRedirect("customer/customerdashboard.jsp");
                }
            } else {
                response.sendRedirect("loginError.jsp");
            }
        }
    }
}
