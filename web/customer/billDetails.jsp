<%-- 
    Document   : billDetails
    Created on : Mar 13, 2025, 12:43:04 PM
    Author     : User
--%>

<%@ page import="model.Billing" %>
<%@ page import="dao.BillingDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bill Details</title>
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
        .bill-container {
            width: 400px;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            border-top: 5px solid #4682B4; /* Steel Blue */
        }

        h2 {
            color: #4682B4;
            margin-bottom: 15px;
        }

        .bill-details p {
            font-size: 16px;
            margin: 5px 0;
        }

        .bill-status {
            font-weight: bold;
            color: #B8860B; /* Darker Yellow */
        }

        /* Pay Now Button */
        .btn-pay {
            width: 100%;
            padding: 10px;
            background-color: #D4A017; /* Mustard Yellow */
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }

        .btn-pay:hover {
            background-color: #B8860B;
        }

        /* Back Link */
        .back-link {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #4682B4;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <%
        BillingDAO billingDAO = new BillingDAO();
        int bookingID = Integer.parseInt(request.getParameter("booking_ID"));
        Billing bill = billingDAO.getBillByBookingID(bookingID);
    %>

    <div class="bill-container">
        <% if (bill != null) { %>
            <h2>Bill for Booking ID: <%= bill.getBookingID() %></h2>
            <div class="bill-details">
                <p><strong>Total Amount:</strong> LKR <%= bill.getTotalAmount() %></p>
                <p><strong>Tax:</strong> LKR <%= bill.getTax() %></p>
                <p><strong>Discount:</strong> LKR <%= bill.getDiscount() %></p>
                <p><strong>Final Amount:</strong> LKR <%= bill.getFinalAmount() %></p>
                <p class="bill-status"><strong>Status:</strong> <%= bill.getStatus() %></p>
            </div>

            <% if (!bill.getStatus().equalsIgnoreCase("Paid")) { %>
                <form action="MakePaymentServlet" method="post">
                    <input type="hidden" name="bill_ID" value="<%= bill.getBillID() %>">
                    <button type="submit" class="btn-pay">Pay Now</button>
                </form>
            <% } else { %>
                <p style="color: green; font-weight: bold;">Already Paid</p>
            <% } %>

        <% } else { %>
            <p>No bill found for this booking.</p>
        <% } %>

        <a href="customerdashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>

</body>
</html>
