<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="dao.BookingDAO" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - View Bookings</title>
    <style>
        /* Reset styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        /* Page Styling */
        body {
            background-color: #FBFAFC; /* Light Background */
            color: #363636; /* Dark Font */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* Container */
        .container {
            width: 80%;
            max-width: 1000px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: #4682B4; /* Steel Blue */
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #4682B4; /* Steel Blue */
            color: white;
        }

        /* Form and Button Styling */
        select, button {
            padding: 8px 15px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            background-color: #D4A017; /* Mustard Yellow */
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #B8860B; /* Darker Yellow */
        }

        /* Success and Error Messages */
        .message {
            text-align: center;
            margin: 15px 0;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        /* Back Link */
        h4 a {
            text-decoration: none;
            font-size: 16px;
            color: #4682B4;
            border: 2px solid #4682B4;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        h4 a:hover {
            background-color: #4682B4;
            color: white;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Admin - View Bookings</h1>

        <!-- Display success or error messages -->
        <% if (request.getAttribute("message") != null) { %>
            <p class="message success"><%= request.getAttribute("message") %></p>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <p class="message error"><%= request.getAttribute("error") %></p>
        <% } %>

        <h2>Booking List</h2>
        <table>
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

        <h4><a href="admindashboard.jsp">Back</a></h4>
    </div>

</body>
</html>
