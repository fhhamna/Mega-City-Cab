<%@ page import="model.Cab" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Cab</title>
    </head>
    <body>
    <body>
    <%
        Cab cab = (Cab) request.getAttribute("cab");
        if (cab == null) {
    %>
        <p style="color:red;">Cab not found!</p>
    <%
        } else {
    %>
        <h2>Edit Cab</h2>

        <form action="updateCab" method="post">
            <input type="hidden" name="cabID" value="<%= cab.getCabID() %>">

            <label for="model">Model:</label>
            <input type="text" name="model" value="<%= cab.getModel() %>" required><br>

            <label for="numberPlate">Number Plate:</label>
            <input type="text" name="numberPlate" value="<%= cab.getNumberPlateNo() %>" required><br>

            <label for="status">Status:</label>
            <select name="status">
                <option value="Available" <%= "Available".equals(cab.getStatus()) ? "selected" : "" %>>Available</option>
                <option value="Booked" <%= "Booked".equals(cab.getStatus()) ? "selected" : "" %>>Booked</option>
                <option value="Maintenance" <%= "Maintenance".equals(cab.getStatus()) ? "selected" : "" %>>Maintenance</option>
            </select><br>

            <label for="price">Price per KM:</label>
            <input type="text" name="price" value="<%= cab.getPricePerKm() %>" required><br>

            <input type="submit" value="Update Cab">
        </form>
    <%
        }
    %>
    </body>
    </body>
</html>
