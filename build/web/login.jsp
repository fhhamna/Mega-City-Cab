<%-- 
    Document   : login
    Created on : Mar 2, 2025, 1:40:08 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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

            /* Login Box */
            .login-box {
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

            input {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            /* Login Button */
            .login-btn {
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

            .login-btn:hover {
                background-color: #658199; /* Muted Blue */
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-box">
                <h1>Login to Mega City Cab</h1>

                <% if (request.getParameter("error") != null) { %>
                    <p class="error"><%= request.getParameter("error") %></p>
                <% } %>

                <form action="login" method="post">
                    <label>Username:</label>
                    <input type="text" name="username" required>

                    <label>Password:</label>
                    <input type="password" name="password" required>

                    <input type="submit" class="login-btn" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>

