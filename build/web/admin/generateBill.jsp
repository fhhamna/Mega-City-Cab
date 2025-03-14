<%@ page import="java.sql.*, dao.BookingDAO, model.Booking" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate Bill</title>
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

        /* Container for Form */
        .form-container {
            width: 400px;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            border-top: 5px solid #4682B4; /* Steel Blue */
        }

        h2 {
            color: #4682B4; /* Steel Blue */
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            display: block;
            margin: 10px 0 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: transparent;
            border: 2px solid #4682B4;
            color: #4682B4;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #4682B4;
            color: white;
        }

        li a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            text-decoration: none;
            border: 2px solid #DC143C; /* Crimson */
            color: #DC143C;
            font-size: 16px;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }

        li a:hover {
            background-color: #DC143C;
            color: white;
        }
    </style>
</head>
<body>

<div class="form-container">
    <% 
        int bookingID = Integer.parseInt(request.getParameter("booking_ID"));
        BookingDAO bookingDAO = new BookingDAO();
        Booking booking = bookingDAO.getBookingById(bookingID);
    %>

    <h2>Generate Bill for Booking ID: <%= bookingID %></h2>

    <form action="/MegaCityCab/admin/GenerateBillServlet" method="post">
        <input type="hidden" name="booking_ID" value="<%= bookingID %>">
        
        <label for="total_amount">Total Amount:</label>
        <input type="text" name="total_amount" required><br>
        
        <label for="tax">Tax:</label>
        <input type="text" name="tax" required><br>
        
        <label for="discount">Discount:</label>
        <input type="text" name="discount" required><br>
        
        <button type="submit">Generate Bill</button>
    </form>

    <ul>
        <li><a href="admindashboard.jsp">Back</a></li>
    </ul>
</div>

</body>
</html>
