<%@page import="model.Billing"%>
<%@page import="dao.BillingDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Bill</title>
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
            background-color: #FBFAFC; /* Light Gray Background */
            color: #363636; /* Dark Text */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* Bill Container */
        .bill-container {
            width: 400px;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            border-top: 5px solid #D4A017; /* Mustard Yellow */
        }

        h2 {
            color: #4682B4; /* Steel Blue */
            margin-bottom: 15px;
        }

        p {
            font-size: 16px;
            margin: 5px 0;
        }

        strong {
            color: #363636;
        }

        /* Button Styling */
        .btn {
            margin-top: 15px;
            padding: 10px 15px;
            font-size: 16px;
            border: 2px solid;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease, color 0.3s ease;
            background-color: transparent;
        }

        .print-btn {
            border-color: #D4A017; /* Mustard Yellow */
            color: #D4A017;
        }

        .print-btn:hover {
            background-color: #D4A017;
            color: white;
        }

        .back-btn {
            border-color: #4682B4; /* Steel Blue */
            color: #4682B4;
            display: inline-block;
            text-decoration: none;
            padding: 10px 15px;
            margin-top: 10px;
        }

        .back-btn:hover {
            background-color: #4682B4;
            color: white;
        }
    </style>
</head>
<body>
    <div class="bill-container">
        <h2>Bill Details</h2>

        <%
            int bookingID = Integer.parseInt(request.getParameter("booking_ID"));
            BillingDAO billingDAO = new BillingDAO();
            Billing bill = billingDAO.getBillByBookingId(bookingID);
        %>

        <p><strong>Booking ID:</strong> <%= bill.getBookingID() %></p>
        <p><strong>Total Amount:</strong> LKR <%= bill.getTotalAmount() %></p>
        <p><strong>Tax:</strong> LKR <%= bill.getTax() %></p>
        <p><strong>Discount:</strong> LKR <%= bill.getDiscount() %></p>
        <p><strong>Final Amount:</strong> LKR <%= bill.getFinalAmount() %></p>
        <p><strong>Status:</strong> <%= bill.getStatus() %></p>

        <button class="btn print-btn" onclick="window.print();">Print Bill</button>
        <br>
        <a href="customerdashboard.jsp" class="btn back-btn">Back</a>
    </div>
</body>
</html>