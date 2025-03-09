<%-- 
    Document   : EditCustomer
    Created on : Mar 8, 2025, 12:28:42 PM
    Author     : User
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 
        <title>Edit Customer</title>
</head>

   <body>
    <%
        Customer customer = (Customer) request.getAttribute("customer");
    %>

    <form action="UpdateCustomerServlet" method="post">
        <input type="text" name="registrationID" value="<%= customer.getRegistrationID() %>">
        
        <label>Name:</label>
        <input type="text" name="name" value="<%= customer.getName() %>" required><br>
        
        <label>Address:</label>
        <input type="text" name="address" value="<%= customer.getAddress() %>"><br>
        
        <label>NIC:</label>
        <input type="text" name="nic" value="<%= customer.getNic() %>" required><br>
        
        <label>Phone No:</label>
        <input type="text" name="phoneNo" value="<%= customer.getPhoneNo() %>" required><br>
        
        <button type="submit">Update Customer</button>
    </form>
    </body>
</html>
