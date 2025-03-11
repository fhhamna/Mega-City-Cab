package controllers;

import dao.UserDAO;
import db.DBConnector;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

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
            
            // Get registrationID from the database
            int registrationID = getRegistrationID(username);

            // Set session attributes based on role
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);  // "admin" or "customer"
            session.setAttribute("registrationID", registrationID);  // Set registrationID in session

            if ("Admin".equals(role)) {
                response.sendRedirect("admin/admindashboard.jsp");
            } else {
                response.sendRedirect("customer/customerdashboard.jsp");
            }
        } else {
            // Invalid login credentials
            response.sendRedirect("loginError.jsp");
        }
    }

    // Method to get registrationID from the database based on username
    private int getRegistrationID(String username) {
        int registrationID = -1;  // Default value if not found
        String sql = "SELECT registration_ID FROM customer WHERE username = ?";
        
        try (Connection connection = DBConnector.getConnection()) {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                registrationID = rs.getInt("registration_ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return registrationID;
    }
}
