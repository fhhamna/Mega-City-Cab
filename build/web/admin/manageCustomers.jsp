<%-- 
    Document   : manageUsers
    Created on : Feb 26, 2025, 9:31:25 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Manage Customers</title>
</head>
<body>
    <h2>Manage Customers</h2>

    <table border="1">
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
            <td><%= customer.getRegistrationID() %></td>
            <td><%= customer.getName() %></td>
            <td><%= customer.getAddress() %></td>
            <td><%= customer.getNic() %></td>
            <td><%= customer.getPhoneNo() %></td>
            <td>
                <a href="EditCustomer.jsp?registrationID=<%= customer.getRegistrationID() %>">Edit</a> |
                <a href="DeleteCustomerServlet?registrationID=<%= customer.getRegistrationID() %>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>

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

    </body>
</html>
