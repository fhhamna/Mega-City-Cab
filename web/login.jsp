<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            /* Reset default styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }

            /* Page Background */
            body {
                background-color: #FBFAFC; /* Light background */
                color: #363636; /* Dark Font */
                font-size: 16px;
            }

            .container {
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            /* Login Box */
            .login-box {
                background-color: #FFFFFF;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                text-align: center;
                width: 350px;
                border-top: 5px solid #D4A017; /* Mustard Yellow border */
            }

            h1 {
                margin-bottom: 20px;
                color: #4682B4; /* Steel Blue */
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
                color: #363636; /* Dark Font */
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
                color: #4682B4; /* Steel Blue */
                background-color: transparent;
                border: 2px solid #4682B4; /* Steel Blue border */
                border-radius: 5px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .login-btn:hover {
                background-color: #4682B4; /* Steel Blue */
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-box">
                <h1>Login to Mega City Cabs</h1>

                <% if (request.getParameter("error") != null) { %>
                    <p class="error"><%= request.getParameter("error") %></p>
                <% } %>

                <form action="login" method="post">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" required>

                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" required>

                    <input type="submit" class="login-btn" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>
