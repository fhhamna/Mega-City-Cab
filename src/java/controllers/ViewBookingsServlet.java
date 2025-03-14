package controllers;

import dao.BookingDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Booking;


@WebServlet("/admin/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getAllBookings();  // Retrieve the list of bookings from the database
        
        // Set the bookings list as a request attribute
        request.setAttribute("bookings", bookings);

        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/viewBookings.jsp");
        dispatcher.forward(request, response);
    }
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int booking_ID = Integer.parseInt(request.getParameter("booking_ID"));
            String newStatus = request.getParameter("booking_status");

            // Update booking status in the database
            boolean updated = bookingDAO.updateBookingStatus(booking_ID, newStatus);

            if (updated) {
                request.setAttribute("message", "Booking status updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update booking status.");
            }

            // Re-fetch all bookings and forward to viewBookings.jsp
            List<Booking> bookings = bookingDAO.getAllBookings();
            request.setAttribute("bookings", bookings);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/generateBill.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
