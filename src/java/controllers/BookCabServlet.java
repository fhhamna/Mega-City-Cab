package controllers;

import dao.CabDAO;
import db.DBConnector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cab;

@WebServlet("/customer/BookCabServlet")
public class BookCabServlet extends HttpServlet {

   
    private CabDAO cabDAO = new CabDAO(); // Ensure this is initialized

    public void init() {
        cabDAO = new CabDAO();
    }

    // Display available cabs
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
    List<Cab> availableCabs = cabDAO.getAvailableCabs(); // Fetch cabs from the database
    request.setAttribute("availableCabs", availableCabs);
    RequestDispatcher dispatcher = request.getRequestDispatcher("bookCab.jsp");
    dispatcher.forward(request, response); // Forward the request to JSP
} catch (Exception e) {
    e.printStackTrace(); // Log the exception
    // Optionally, set an error message and forward to an error page
}

    }

    // Handle cab booking
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection connection = DBConnector.getConnection()) {
            // Retrieve form data
            int cabID = Integer.parseInt(request.getParameter("cab_ID"));
            String pickupLocation = request.getParameter("pickup_location");
            String destination = request.getParameter("destination");

            // Set current timestamp as booking time
            Timestamp bookingDate = new Timestamp(System.currentTimeMillis());

            // Get customer ID from session
            Integer registrationID = (Integer) request.getSession().getAttribute("registration_ID");

            if (registrationID == null) {
                response.sendRedirect("../login.jsp?error=You need to log in first.");
                return;
            }

            // Default status: "Pending"
            String bookingStatus = "Pending";

            // Insert into database
            String sql = "INSERT INTO booking (pickup_location, destination, booking_date, booking_status, registration_ID, cab_ID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, pickupLocation);
            stmt.setString(2, destination);
            stmt.setTimestamp(3, bookingDate);
            stmt.setString(4, bookingStatus);
            stmt.setInt(5, registrationID);
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
