<%@page import="java.util.List"%>
<%@page import="model.Cab"%>
<%@page import="dao.CabDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Cabs</title>
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
            background-color: #FBFAFC;
            color: #363636;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            flex-direction: column;
            padding: 5px;
        }

        .container {
            width: 85%;
            max-width: 1200px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #4682B4;
            margin-bottom: 20px;
            margin-top: 380px;
        }
        h3 {
            color: #4682B4;
            margin-bottom: 20px;
        }

        /* Success and Error messages */
        .message {
            font-size: 16px;
            padding: 10px;
            margin-bottom: 20px;
            text-align: center;
            border-radius: 5px;
        }

        .message.success {
            background-color: #d4edda;
            color: #155724;
        }

        .message.error {
            background-color: #f8d7da;
            color: #721c24;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #4682B4;
            color: white;
        }

        /* Style for Edit and Delete Buttons */
table td a,
button[name="delete"] {
    font-size: 14px; /* Adjust font size */
    padding: 2px 3px; /* Reduce padding to make them smaller */
    border: 1px solid #4682B4;
    border-radius: 3px;
    margin: 0 3px;
    text-decoration: none;
    color: #4682B4;
    background-color: transparent;
    cursor: pointer;
    transition: background 0.3s ease;
}

/* Hover effect */
table td a:hover,
button[name="delete"]:hover {
    background-color: #4682B4;
    color: white;
}

        


        /* Form Styling */
        form {
            margin-top: 30px; /* Increase the space from the table */
        }

        form input, form select, form button {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        form button {
            background-color: #4682B4;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form button:hover {
            background-color: #3b7a9b;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #4682B4;
            text-decoration: none;
            font-size: 16px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Admin - Manage Cabs</h1>

        <!-- Display success or error messages -->
        <% if (request.getParameter("message") != null) { %>
            <div class="message success"><%= request.getParameter("message") %></div>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <div class="message error"><%= request.getParameter("error") %></div>
        <% } %>

        <h2>Cab List</h2>
        <table>
            <tr>
                <th>Cab ID</th>
                <th>Model</th>
                <th>Status</th>
                <th>Price Per Km</th>
                <th>Passengers</th>
                <th>Suitcases</th>
                <th>Transmission</th>
                <th>Actions</th>
            </tr>
            <%
                CabDAO cabDAO = new CabDAO();
                List<Cab> cabList = cabDAO.getAllCabs();
                for (Cab cab : cabList) {
            %>
            <tr>
                <td><%= cab.getCabID() %></td>
                <td><%= cab.getModel() %></td>
                <td><%= cab.getStatus() %></td>
                <td><%= cab.getPricePerKm() %></td>
                <td><%= cab.getPassengers() %></td>
                <td><%= cab.getSuitcases() %></td>
                <td><%= cab.getTransmission() %></td>
                <td>
                    <a href="/MegaCityCab/admin/EditCabServlet?id=<%= cab.getCabID() %>">Edit</a>
                    <!-- Use a POST form for the delete action -->
                    <form action="/MegaCityCab/admin/DeleteCabServlet" method="post" style="display:inline;">
                        <input type="hidden" name="cab_ID" value="<%= cab.getCabID() %>">
                        <button type="submit" name ="delete" onclick="return confirm('Are you sure you want to delete this cab?');">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>

        <h3>Add New Cab</h3>
        <form action="/MegaCityCab/admin/AddCabServlet" method="post">
            <input type="text" name="model" placeholder="Model" required>
            <select name="status">
                <option value="Available">Available</option>
                <option value="Booked">Booked</option>
                <option value="Maintenance">Maintenance</option>
            </select>
            <input type="text" name="price_per_km" placeholder="Price per km" required>
            <input type="number" name="passengers" placeholder="Passengers" required min="1">
            <input type="number" name="suitcases" placeholder="Suitcases" required min="0">
            <select name="transmission">
                <option value="Automatic">Automatic</option>
                <option value="Manual">Manual</option>
            </select>
            <button type="submit">Add Cab</button>
        </form>

        <a href="admindashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>

</body>
</html>
