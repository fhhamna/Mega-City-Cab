<%-- 
    Document   : bookCab
    Created on : Feb 26, 2025, 9:36:55 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="model.Cab"%>
<%@page import="dao.CabDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book a Cab</title>
</head>
<body>

<h2>Book a Cab</h2>

<!-- Display success or error messages -->
<% if (request.getParameter("message") != null) { %>
    <p style="color: green;"><%= request.getParameter("message") %></p>
<% } %>
<% if (request.getParameter("error") != null) { %>
    <p style="color: red;"><%= request.getParameter("error") %></p>
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
    </select><br>

    <label for="pickup_location">Pickup Location:</label>
    <input type="text" name="pickup_location" required><br>

    <label for="destination">Destination:</label>
    <input type="text" name="destination" required><br>

    <button type="submit">Book Cab</button>
</form>

</body>
</html>
