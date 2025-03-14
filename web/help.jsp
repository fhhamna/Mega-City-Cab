<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Guidelines</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        /* Global background and text */
        body {
            background-color: #FBFAFC; /* Light background */
            color: #363636; /* Dark Font */
            font-size: 16px;
            line-height: 1.6; /* Added line height for line spacing */
            margin-left: 20px;
        }

        h1, h2, h3, h4 {
            color: #363636;
            line-height: 1.4; /* Added line height for headings */
        }

        /* Styling for headings */
        h1 {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
        }

        h2 {
            color: #4682B4; /* Steel Blue */
        }

        /* Styling for ordered and unordered lists */
        ol {
            margin-left: 20px;
            line-height: 1.6; /* Added line height for list items */
        }

        ul {
            margin-left: 30px;
            line-height: 1.6; /* Added line height for list items */
        }

        li {
            margin-bottom: 8px;
            padding: 3px 0; /* Added padding for list items */
        }

        li:before {
            content: "🔹 ";
        }

        /* Content Box Styling */
        .content-box {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #E0CDEF; /* Soft pastel purple */
            background-color: #E8F4E1; /* Soft pastel green */
            border-radius: 8px;
        }

        /* Buttons */
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4682B4; /* Steel Blue */
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        .button:hover {
            background-color: #D4A017; /* Mustard Yellow */
        }

        /* Horizontal lines */
        hr {
            border: 1px solid #D4A017;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #4682B4; /* Steel Blue */
            color: #FBFAFC;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <hr>

    <div class="content-box">
        <h2>Mega City Cab - Customer Guide</h2>
        <p>Welcome to <strong>Mega City Cab</strong>! Our online cab booking system makes it easy for you to book rides, and manage your bookings effortlessly.</p>
    </div>

    <hr>

    <h3>1. How to Register & Log In?</h3>

    <div class="content-box">
        <h4>Register as a New Customer</h4>
        <ol>
            <li>Go to our website: <strong>[http://localhost:8080/MegaCityCab/]</strong></li>
            <li>Click on <strong>"Register Now"</strong></li>
            <li>Enter your <strong>Name, Address, NIC and Phone Number</strong>.</li>
            <li>Click <strong>"Register"</strong>.</li>
            <li>You will then be taken to the User Registration page, where you have to Enter the USERNAME & PASSWORD</li>
        </ol>

        <h4>Log In to Your Account</h4>
        <ol>
            <li>Click on <strong>"Login"</strong> in the navigation menu.</li>
            <li>Enter your <strong>USERNAME</strong> and <strong>PASSWORD</strong>.</li>
            <li>Click <strong>"Login"</strong> to access your dashboard.</li>
        </ol>
    </div>

    <hr>

    <h3>2. How to Book a Cab?</h3>

    <div class="content-box">
        <h4>🔹 Step-by-Step Booking Process</h4>
        <ol>
            <li>After logging in, go to <strong>"Book a Cab"</strong>.</li>
            <li>Enter your <strong>Pickup Location</strong> and <strong>Destination</strong>.</li>
            <li>Select your preferred <strong>Cab</strong> To have the best Ride!</li>
        </ol>
    </div>

    <hr>

    <h3>3. How to View & Manage Your Bookings?</h3>

    <div class="content-box">
        <h4>🔹 Check Booking Status</h4>
        <ol>
            <li>Go to <strong>"View Bookings"</strong> from the menu.</li>
            <li>See the status of your booking,
                <ul>
                    <li><strong>Pending</strong>: Waiting for confirmation.</li>
                    <li><strong>Completed</strong>: Driver is assigned.</li>
                    <li><strong>Cancelled</strong>: Booking was cancelled.</li>
                </ul>
            </li>
        </ol>

        <h4>Print the Bill</h4>
        <ol>
            <li>Click <strong>"Print"</strong> to print your bill.</li>
        </ol>
    </div>

    <hr>

    <h3>4. Payment Options</h3>
    <div class="content-box">
        <p>💳 <strong>Available Payment Methods</strong></p>
        <ul>
            <li><strong>Cash</strong> (Pay the driver after the ride)</li>
            <li><strong>Credit/Debit Card</strong> (Coming Soon!)</li>
        </ul>
    </div>

    <hr>

    <h3>5. Safety & Support</h3>

    <div class="content-box">
        <h4>✅ Our Safety Features</h4>
        <ul>
            <li>Verified drivers with ID checks</li>
            <li>24/7 customer support</li>
            <li>Emergency hotline/ email available in the website</li>
        </ul>

        <p>📞 <strong>Need Help? Contact Us:</strong></p>
        <ul>
            <li><strong>Phone:</strong> +94 XXX-XXX-XXXX</li>
            <li><strong>Email:</strong> support@megacitycab.com</li>
        </ul>
    </div>

    <hr>

    <p>Thank you for choosing <strong>Mega City Cab</strong></p>
    <p>Safe travels! </p>

</body>
</html>
