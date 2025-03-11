package controllers;

import db.DBConnector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customer/BookCabServlet")
public class BookCabServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (Connection connection = DBConnector.getConnection()) {
            // Retrieve form parameters
            int cabID = Integer.parseInt(request.getParameter("cab_ID"));
            String pickupLocation = request.getParameter("pickup_location");
            String destination = request.getParameter("destination");

            // Get registrationID from session (assuming the user is logged in)
            Integer registrationID = (Integer) request.getSession().getAttribute("registrationID");

            // Check if registrationID exists
            if (registrationID == null) {
                response.sendRedirect("../login.jsp?error=You need to log in first.");

                return;
            }

            // Set the booking date as the current timestamp
            Timestamp bookingDate = Timestamp.valueOf(LocalDateTime.now());
            
            // Default booking status
            String bookingStatus = "Pending";
            
            // Insert the booking into the database
            String sql = "INSERT INTO booking (pickup_location, destination, booking_date, booking_status, registration_ID, cab_ID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, pickupLocation);
            stmt.setString(2, destination);
            stmt.setTimestamp(3, bookingDate);
            stmt.setString(4, bookingStatus);
            stmt.setInt(5, registrationID);  // Using the registrationID from session
            stmt.setInt(6, cabID);
            
            int rowsInserted = stmt.executeUpdate();
            
            if (rowsInserted > 0) {
                response.sendRedirect("bookCab.jsp?message=Cab booked successfully!");
            } else {
                response.sendRedirect("bookCab.jsp?error=Failed to book the cab.");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("bookCab.jsp?error=Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            response.sendRedirect("bookCab.jsp?error=Invalid input!");
        }
    }
}