<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
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
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            /* Centered Form Container */
            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .registration-form {
                background-color: #FFFFFF;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                text-align: center;
                width: 400px;
                border-top: 5px solid #D4A017; /* Mustard Yellow border */
            }

            h1 {
                margin-bottom: 20px;
                color: #4682B4; /* Steel Blue */
            }

            label {
                display: block;
                font-weight: bold;
                margin-top: 10px;
                text-align: left;
                color: #363636; /* Dark Font */
            }

            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #F9F9F9;
            }

            input[type="text"]:focus {
                border-color: #4682B4; /* Steel Blue focus */
                background-color: #fff;
            }

            input[type="submit"] {
                width: 100%;
                padding: 12px;
                margin-top: 20px;
                font-size: 18px;
                font-weight: bold;
                color: #4682B4; /* Steel Blue text */
                background-color: transparent;
                border: 2px solid #4682B4; /* Steel Blue border */
                border-radius: 5px;
                cursor: pointer;
                transition: background 0.3s ease, color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #4682B4; /* Steel Blue */
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="registration-form">
                <h1>Customer Registration</h1>
                <form action="RegisterCustomer" method="post">
                    <label for="name">Name:</label>
                    <input type="text" name="name" id="name" required>

                    <label for="address">Address:</label>
                    <input type="text" name="address" id="address" required>

                    <label for="nic">NIC:</label>
                    <input type="text" name="nic" id="nic" required>

                    <label for="phone_no">Phone No:</label>
                    <input type="text" name="phone_no" id="phone_no" required>

                    <input type="submit" value="Register">
                </form>
                <p class="login-link">Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </div>
    </body>
</html>
