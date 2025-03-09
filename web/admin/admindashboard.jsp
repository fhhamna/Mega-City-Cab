<%-- 
    Document   : admindashboard
    Created on : Feb 26, 2025, 9:06:24 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <h1>Welcome, Admin!</h1>
        <p>Username</p>
        
        <h2>Admin Controls</h2>
        <ul>
        <li><a href="manageCustomers.jsp">Manage Customers</a></li>
        <li><a href="manageCabs.jsp">Manage Cabs</a></li>
        <li><a href="manageDrivers.jsp">Manage Drivers</a></li>
        <li><a href="viewBookings.jsp">View Bookings</a></li>
    </ul>
        
        <h3><a href="logout.jsp">Logout</a></h3>
    </body>
</html>
