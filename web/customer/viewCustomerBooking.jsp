<%@page import="java.util.List"%>
<%@page import="java.sql.*, dao.BookingDAO, dao.BillingDAO, model.Booking, model.Billing"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Booking Details</title>
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

        /* Table Styling */
        table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #363636;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4682B4; /* Steel Blue */
            color: white;
        }

        /* Button Styling */
        a {
            text-decoration: none;
            padding: 10px 15px;
            border: 2px solid #4682B4; /* Steel Blue border */
            color: #4682B4;
            border-radius: 5px;
            display: inline-block;
            transition: background 0.3s ease, color 0.3s ease;
        }

        a:hover {
            background-color: #4682B4;
            color: white;
        }

        /* Action Button */
        .no-bill, .bill-paid {
            padding: 10px 15px;
            display: inline-block;
        }

        .no-bill {
            color: #DC143C; /* Crimson */
            border: 2px solid #DC143C;
        }

        .no-bill:hover {
            background-color: #DC143C;
            color: white;
        }

        .bill-paid {
            color: #32CD32; /* Lime Green */
            border: 2px solid #32CD32;
        }

        .bill-paid:hover {
            background-color: #32CD32;
            color: white;
        }

        /* Back Button */
        h4 a {
            text-decoration: none;
            padding: 10px 15px;
            border: 2px solid #4682B4;
            color: #4682B4;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
            margin-top: 5px;
        }

        h4 a:hover {
            background-color: #4682B4;
            color: white;
            
        }
    </style>
</head>
<body>

<% 
    // Get the customer ID from session (assuming the customer is logged in)
    int customerID = (int) session.getAttribute("registration_ID");

    // Initialize DAOs
    BookingDAO bookingDAO = new BookingDAO();
    BillingDAO billingDAO = new BillingDAO();

    // Fetch customer bookings
    List<Booking> customerBookings = bookingDAO.getBookingsByCustomerId(customerID);
%>

<h2>Your Bookings</h2>

<% if (customerBookings.isEmpty()) { %>
    <p>No bookings found for this customer.</p>
<% } else { %>
    <table>
        <tr>
            <th>Booking ID</th>
            <th>Pickup Location</th>
            <th>Destination</th>
            <th>Booking Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <% 
        for (Booking booking : customerBookings) {
            // Fetch the corresponding bill for this booking if available
            Billing bill = billingDAO.getBillByBookingId(booking.getBookingID());
        %>
        <tr>
            <td><%= booking.getBookingID() %></td>
            <td><%= booking.getPickupLocation() %></td>
            <td><%= booking.getDestination() %></td>
            <td><%= booking.getBookingDate() %></td>
            <td><%= booking.getBookingStatus() %></td>
            
            <td>
                <% if (booking.getBookingStatus().equals("Completed") && bill != null && bill.getStatus().equals("Pending")) { %>
                    <a href="viewBill.jsp?booking_ID=<%= booking.getBookingID() %>">View Bill</a>
                <% } else if (booking.getBookingStatus().equals("Completed") && bill != null && bill.getStatus().equals("Paid")) { %>
                    <span class="bill-paid">Bill Paid</span>
                <% } else { %>
                    <span class="no-bill">No bill generated yet.</span>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
<% } %>

<h4><a href="customerdashboard.jsp">Back</a></h4>

</body>
</html>
