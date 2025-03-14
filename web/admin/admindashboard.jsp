<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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

        /* Dashboard Container */
        .dashboard-container {
            width: 400px;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            border-top: 5px solid #4682B4; /* Steel Blue */
        }

        h1 {
            color: #4682B4; /* Steel Blue */
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin: 5px 0;
        }

        /* Navigation List */
        ul {
            list-style: none;
            margin-top: 15px;
        }

        ul li {
            margin: 10px 0;
        }

        ul li a {
            text-decoration: none;
            font-size: 16px;
            padding: 10px 15px;
            border: 2px solid #D4A017; /* Mustard Yellow Border */
            color: #D4A017;
            border-radius: 5px;
            display: block;
            width: 100%;
            text-align: center;
            transition: background 0.3s ease, color 0.3s ease;
        }

        ul li a:hover {
            background-color: #D4A017; /* Mustard Yellow Background */
            color: white;
        }

        /* Logout Button */
        .logout-btn {
            margin-top: 15px;
            padding: 10px 15px;
            border: 2px solid #DC143C; /* Crimson Border */
            color: #DC143C;
            text-decoration: none;
            border-radius: 5px;
            display: block;
            width: 100%;
            text-align: center;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #DC143C; /* Crimson Background */
            color: white;
        }

    </style>
</head>
<body>

    <div class="dashboard-container">
        <h1>Welcome, Admin!</h1>
        <p><strong>Username:</strong> <%= session.getAttribute("username") %></p>
        
        <h2>Admin Controls</h2>
        <ul>
            <li><a href="manageCustomers.jsp">Manage Customers</a></li>
            <li><a href="manageCabs.jsp">Manage Cabs</a></li>
            <li><a href="viewBookings.jsp">View Bookings</a></li>
            <li><a href="updateBillStatus.jsp">Update Bill Status</a></li>
        </ul>

        
        <a href="../index.html" class="logout-btn">Logout</a>
    </div>

</body>
</html>
