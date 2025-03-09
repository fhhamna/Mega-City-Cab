<%-- 
    Document   : manageCars
    Created on : Feb 26, 2025, 9:31:42 PM
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
        <title>Admin - Manage Cab</title>
    </head>
    <body>
        
        <% if (request.getParameter("message") != null) { %>
        <p style="color: green;"><%= request.getParameter("message") %></p>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;"><%= request.getParameter("error") %></p>
    <% } %>

    <table border="1">
        <tr>
            <th>Cab ID</th>
            <th>Model</th>
            <th>Number Plate</th>
            <th>Status</th>
            <th>Price Per Km</th>
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
            <td><%= cab.getNumberPlateNo() %></td>
            <td><%= cab.getStatus() %></td>
            <td><%= cab.getPricePerKm() %></td>
            <td>
                <a href="EditCab.jsp?id=<%= cab.getCabID() %>">Edit</a>
                <a href="DeleteCabServlet?id=<%= cab.getCabID() %>">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
        <form action="/MegaCityCab/admin/AddCabServlet" method="post">
    Model: <input type="text" name="model" required><br>
    Number Plate No: <input type="text" name="number_plate_no" required><br>
    Status: 
    <select name="status">
        <option value="Available">Available</option>
        <option value="Booked">Booked</option>
        <option value="Maintenance">Maintenance</option>
    </select><br>
    Price per km: <input type="text" name="price_per_km" required><br>
    <button type="submit">Add Cab</button>
</form>

    </body>
</html>
