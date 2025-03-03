<%-- 
    Document   : customerdashboard
    Created on : Feb 26, 2025, 9:35:15 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Dashboard</title>
    </head>
    <body>
        <h1>Welcome, Customer!</h1>
        <p>Username: </strong><%= session.getAttribute("username") %></p>
        
        <h2>Admin Controls</h2>
        <ul>
        <li><a href="viewBooking.jsp">View Bookings</a></li>
        <li><a href="bookCab.jsp">Book Cab</a></li>
        <li><a href="printBill.jsp">Print Bill</a></li>
    </ul>
        
        <h3><a href="logout.jsp">Logout</a></h3>
    </body>
</html>
