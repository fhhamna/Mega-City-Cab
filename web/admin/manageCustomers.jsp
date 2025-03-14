<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Manage Customers</title>
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

        /* Admin Dashboard Container */
        .admin-container {
            width: 80%;
            max-width: 1000px;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            border-top: 5px solid #4682B4; /* Steel Blue */
        }

        h1 {
            color: #4682B4; /* Steel Blue */
            margin-bottom: 20px;
        }

        h2 {
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4682B4;
            color: white;
        }

        /* Button Style */
        a {
            text-decoration: none;
            color: #D4A017; /* Mustard Yellow */
            border: 1px solid #D4A017;
            padding: 6px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #D4A017;
            color: white;
        }

        /* Form Styling */
        .form-container {
            margin-top: 30px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input[type="text"], .form-container input[type="number"], .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .form-container input[type="submit"] {
            background-color: #4682B4;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #B0C4DE; /* Light Steel Blue */
        }

        /* Back Link */
        h4 a {
            color: #4682B4;
            text-decoration: none;
        }

        h4 a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <div class="admin-container">
        <h1>Admin - Manage Customers</h1>

        <h2>Customer List</h2>
        <table>
            <tr>
                <th>Registration ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>NIC</th>
                <th>Phone Number</th>
                <th>Actions</th>
            </tr>
            <%
                CustomerDAO customerDAO = new CustomerDAO();
                List<Customer> customers = customerDAO.getAllCustomers();
                for (Customer customer : customers) {
            %>
            <tr>
                <td><%= customer.getRegistration_ID() %></td>
                <td><%= customer.getName() %></td>
                <td><%= customer.getAddress() %></td>
                <td><%= customer.getNic() %></td>
                <td><%= customer.getPhone_no() %></td>
                <td>
                    <a href="EditCustomer.jsp?registrationID=<%= customer.getRegistration_ID() %>">Edit</a> |
                    <a href="DeleteCustomerServlet?registrationID=<%= customer.getRegistration_ID() %>" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>

        <div class="form-container">
            <h3>Add New Customer</h3>
            <form action="/MegaCityCab/admin/AddCustomerServlet" method="post">
                <label for="registration_ID">Registration ID:</label>
                <input type="number" name="registration_ID" required><br>

                <label for="name">Name:</label>
                <input type="text" name="name" required><br>

                <label for="address">Address:</label>
                <input type="text" name="address" required><br>

                <label for="nic">NIC:</label>
                <input type="text" name="nic" required><br>

                <label for="phone_no">Phone No:</label>
                <input type="text" name="phone_no" required><br>

                <label for="user_ID">User ID:</label>
                <input type="number" name="user_ID" required><br>

                <input type="submit" value="Add Customer">
            </form>
        </div>

        <h4><a href="admindashboard.jsp">Back to Dashboard</a></h4>
    </div>

</body>
</html>
