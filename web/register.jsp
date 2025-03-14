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
        <style>
            /* Reset default styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            /* Page Background */
            .container {
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #ffffff; /* White background */
            }

            /* Registration Box */
            .register-box {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                text-align: center;
                width: 350px;
                border-top: 5px solid #4B9CD3; /* Carolina Blue top border */
            }

            h1 {
                margin-bottom: 20px;
                color: #4B9CD3; /* Carolina Blue */
            }

            /* Error message */
            .error {
                color: red;
                margin-bottom: 15px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-top: 10px;
                text-align: left;
                color: #333;
            }

            input, select {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            /* Register Button */
            .register-btn {
                width: 100%;
                padding: 12px;
                margin-top: 20px;
                font-size: 18px;
                font-weight: bold;
                color: white;
                background-color: #4682B4; /* Steel Blue */
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .register-btn:hover {
                background-color: #658199; /* Muted Blue */
            }

            /* Link to Login */
            .login-link {
                margin-top: 15px;
                font-size: 16px;
            }

            .login-link a {
                text-decoration: none;
                color: #4B9CD3;
                font-weight: bold;
            }

            .login-link a:hover {
                color: #658199;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="register-box">
                <h1>User Registration</h1>

                <% if (request.getParameter("error") != null) { %>
                    <p class="error"><%= request.getParameter("error") %></p>
                <% } %>

                <form action="register" method="post">
                    <label>Username:</label>
                    <input type="text" name="username" required>

                    <label>Password:</label>
                    <input type="password" name="password" required>

                   <!-- 
<label>Role:</label>
<select name="role">
    <option value="customer">Customer</option>
    <option value="admin">Admin</option>
</select>
-->


                    <input type="submit" class="register-btn" value="Register">
                </form>

                
            </div>
        </div>
    </body>
</html>

