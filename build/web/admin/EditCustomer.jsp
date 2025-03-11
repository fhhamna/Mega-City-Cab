<%-- 
    Document   : EditCustomer
    Created on : Mar 8, 2025, 12:28:42 PM
    Author     : User
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer</title>
    </head>
    <body>
        <%
            // Retrieve the registration_ID from the request parameter
            String registrationIDParam = request.getParameter("registrationID");
            Customer customer = null;

            // Check if registrationIDParam is not null or empty
            if (registrationIDParam != null && !registrationIDParam.isEmpty()) {
                try {
                    int registrationID = Integer.parseInt(registrationIDParam); // Convert to int
                    CustomerDAO customerDAO = new CustomerDAO();
                    customer = customerDAO.getCustomerByID(registrationID); // Fetch customer by ID
                } catch (NumberFormatException e) {
                    out.println("Invalid customer ID format.");
                }
            }

            if (customer != null) {
        %>

        <form action="UpdateCustomerServlet" method="post">
            <input type="hidden" name="registration_ID" value="<%= customer.getRegistration_ID() %>">
            
            <label>Name:</label>
            <input type="text" name="name" value="<%= customer.getName() %>" required><br>
            
            <label>Address:</label>
            <input type="text" name="address" value="<%= customer.getAddress() %>"><br>
            
            <label>NIC:</label>
            <input type="text" name="nic" value="<%= customer.getNic() %>" required><br>
            
            <label>Phone No:</label>
            <input type="text" name="phone_no" value="<%= customer.getPhone_no() %>" required><br>
            
            <button type="submit">Update Customer</button>
        </form>

        <%
            } else {
                out.println("<p style='color:red;'>No customer found with the provided ID.</p>");
            }
        %>
    </body>
</html>
