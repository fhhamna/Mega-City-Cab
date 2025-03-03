<%-- 
    Document   : register
    Created on : Mar 2, 2025, 1:52:14 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>User Registration </h1>
        <% if (request.getParameter("error") != null) { %>
        <p style="color:red;"><%= request.getParameter("error") %></p>
    <% } %>
    
      <form action="register" method="post">
         <label>Username:</label>
         <input type="text" name="username" required><br>
        
         <label>Password:</label>
         <input type="password" name="password" required><br>
        
         <label>Role:</label>
         <select name="role">
            <option value="customer">Customer</option>
            <option value="admin">Admin</option>
         </select><br>

         <input type="submit" method ="post" value="Register">
     </form>
     
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </body>
</html>
