<%-- 
    Document   : customerdashboard
    Created on : Feb 26, 2025, 9:35:15 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard | Mega City Cab</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        /* Page Styling */
        body {
            background-color: #FBFAFC; /* Soft White Background */
            color: #363636;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        /* Dashboard Container */
        .dashboard-container {
            width: 420px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-top: 4px solid #4682B4; /* Steel Blue */
        }

        h1 {
            color: #4682B4; /* Steel Blue */
            font-size: 22px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin-bottom: 15px;
        }

        /* Navigation Menu */
        .nav-menu {
            display: flex;
            flex-direction: column;
            margin-top: 15px;
        }

        .nav-menu a {
            text-decoration: none;
            font-size: 16px;
            padding: 10px;
            border: 2px solid #D4A017; /* Mustard Yellow */
            color: #D4A017;
            border-radius: 6px;
            display: block;
            margin: 8px 0;
            transition: all 0.3s ease;
        }

        .nav-menu a:hover {
            background-color: #D4A017;
            color: white;
        }

        /* Logout Button */
        .logout-btn {
            margin-top: 20px;
            padding: 10px;
            font-size: 16px;
            border: 2px solid #DC143C; /* Crimson */
            color: #DC143C;
            text-decoration: none;
            border-radius: 6px;
            display: inline-block;
            width: 100%;
            transition: all 0.3s ease;
            text-align: center;
        }

        .logout-btn:hover {
            background-color: #DC143C;
            color: white;
        }

        /* Footer */
        .footer {
            margin-top: 15px;
            font-size: 14px;
            color: #777;
        }

    </style>
</head>
<body>

    <div class="dashboard-container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <p>Manage your cab bookings with ease.</p>

        <div class="nav-menu">
            <a href="viewCustomerBooking.jsp">View Bookings</a>
            <a href="bookCab.jsp">Book a Cab</a>
        </div>

        <a href="../index.html" class="logout-btn">Logout</a>
        <p class="footer">Mega City Cab &copy; 2025</p>
    </div>

</body>
</html>
