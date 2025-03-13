<%-- 
    Document   : viewBookings
    Created on : Feb 26, 2025, 9:32:15 PM
    Author     : User
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="dao.BookingDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin - View Bookings</title>
</head>
<body>

    <%-- Display success or error messages --%>
    <% if (request.getAttribute("message") != null) { %>
        <p style="color: green;"><%= request.getAttribute("message") %></p>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>

    <h2>Booking List</h2>
    <table border="1">
        <tr>
            <th>Booking ID</th>
            <th>Pickup Location</th>
            <th>Destination</th>
            <th>Booking Date</th>
            <th>Current Status</th>
            <th>Update Status</th>
        </tr>

        <%
            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> bookings = bookingDAO.getAllBookings(); 
            for (Booking booking : bookings) {
        %>
        <tr>
            <td><%= booking.getBookingID() %></td>
            <td><%= booking.getPickupLocation() %></td>
            <td><%= booking.getDestination() %></td>
            <td><%= booking.getBookingDate() %></td>
            <td><%= booking.getBookingStatus() %></td>
            <td>
                <form action="/MegaCityCab/admin/ViewBookingsServlet" method="post">
                    <input type="hidden" name="booking_ID" value="<%= booking.getBookingID() %>">
                    <select name="booking_status">
                        <option value="Pending" <%= "Pending".equals(booking.getBookingStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="Completed" <%= "Completed".equals(booking.getBookingStatus()) ? "selected" : "" %>>Completed</option>
                        <option value="Cancelled" <%= "Cancelled".equals(booking.getBookingStatus()) ? "selected" : "" %>>Cancelled</option>
                    </select>
                    <button type="submit">Update Status</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>

</body>
</html>
