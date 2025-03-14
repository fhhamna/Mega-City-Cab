<%@ page import="model.Cab" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Cab</title>
    </head>
    <body>

    <%
        Cab cab = (Cab) request.getAttribute("cab");
        if (cab == null) {
    %>
        <p style="color:red;">Cab not found! Make sure you are selecting a valid cab.</p>
        <a href="manageCabs.jsp">Go back</a>
    <%
        } else {
    %>
        <h2>Edit Cab</h2>

        <form action="EditCabServlet" method="post">
            <input type="hidden" name="cab_ID" value="<%= cab.getCabID() %>">

            <label for="model">Model:</label>
            <input type="text" name="model" value="<%= cab.getModel() %>" required><br>
            
            <label for="price">Price per km:</label>
            <input type="text" name="price_per_km" value="<%= cab.getPricePerKm() %>" required><br>

            <label for="status">Status:</label>
            <select name="status">
                <option value="Available" <%= cab.getStatus().equals("Available") ? "selected" : "" %>>Available</option>
                <option value="Booked" <%= cab.getStatus().equals("Booked") ? "selected" : "" %>>Booked</option>
                <option value="Maintenance" <%= cab.getStatus().equals("Maintenance") ? "selected" : "" %>>Maintenance</option>
            </select><br>

            <label for="passengers">Passengers:</label>
            <input type="number" name="passengers" value="<%= cab.getPassengers() %>" required><br>
            
             <label for="suitcases">Suitcases:</label>
            <input type="number" name="suitcases" value="<%= cab.getSuitcases() %>" required><br>

            <label for="transmission">Transmission:</label>
            <select name="transmission">
                <option value="Manual" <%= cab.getTransmission().equals("Manual") ? "selected" : "" %>>Manual</option>
                <option value="Automatic" <%= cab.getTransmission().equals("Automatic") ? "selected" : "" %>>Automatic</option>
            </select><br>

            <input type="submit" value="Update Cab">
        </form>
    <%
        } // End of else block
    %>

</body>
</html>
