<%@page import="java.util.List"%>
<%@page import="model.Cab"%>
<%@page import="dao.CabDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book a Cab</title>
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

        /* Form Container */
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
            margin-bottom: 15px;
        }

        /* Messages */
        .message {
            margin-bottom: 10px;
            font-size: 14px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        /* Input Fields */
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            text-align: left;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Submit Button */
        .btn-submit {
            width: 100%;
            padding: 10px;
            border: 2px solid #D4A017; /* Mustard Yellow */
            color: #D4A017;
            background: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #D4A017;
            color: white;
        }

        /* Back Button */
        .back-link {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #4682B4; /* Steel Blue */
            font-weight: bold;
            border-bottom: 2px solid transparent;
            transition: border-bottom 0.3s ease;
        }

        .back-link:hover {
            border-bottom: 2px solid #4682B4;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Book a Cab</h2>

        <!-- Display success or error messages -->
        <% if (request.getParameter("message") != null) { %>
            <p class="message success"><%= request.getParameter("message") %></p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p class="message error"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="BookCabServlet" method="post">
            <label for="cab_ID">Select Cab:</label>
            <select name="cab_ID" required>
                <option value="">-- Select a Cab --</option>
                <%
                    CabDAO cabDAO = new CabDAO();
                    List<Cab> availableCabs = cabDAO.getAvailableCabs(); 
                    for (Cab cab : availableCabs) {
                %>
                <option value="<%= cab.getCabID() %>">
                    <%= cab.getModel() %> - <%= cab.getTransmission() %> (Seats: <%= cab.getPassengers() %>)
                </option>
                <% } %>
            </select>

            <label for="pickup_location">Pickup Location:</label>
            <input type="text" name="pickup_location" required>

            <label for="destination">Destination:</label>
            <input type="text" name="destination" required>

            <button type="submit" class="btn-submit">Book Cab</button>
        </form>

        <a href="customerdashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>
</body>
</html>