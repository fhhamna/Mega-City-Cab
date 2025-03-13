<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration</title>
</head>
<body>
    <h1>Customer Registration</h1>

    <form action="RegisterCustomer" method="post">
        <label>Name:</label>
        <input type="text" name="name" required><br>

        <label>Address:</label>
        <input type="text" name="address" required><br>

        <label>NIC:</label>
        <input type="text" name="nic" required><br>

        <label>Phone No:</label>
        <input type="text" name="phone_no" required><br>

        <input type="submit" value="Register">
    </form>
</body>
</html>
