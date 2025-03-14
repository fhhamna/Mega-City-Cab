<%@page import="model.Billing"%>
<%@page import="dao.BillingDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Bill Status</title>
</head>
<body>

<%
    String bookingIDParam = request.getParameter("booking_ID");
    if (bookingIDParam == null || bookingIDParam.isEmpty()) {
        // Handle the case where booking_ID is missing
        out.println("Booking ID is missing!");
        return; // Exit the JSP processing to prevent further errors
    }
    out.println("booking_ID: " + bookingIDParam); // Debugging line to check the value of booking_ID
    int bookingID = Integer.parseInt(bookingIDParam);
    BillingDAO billingDAO = new BillingDAO();
    Billing bill = billingDAO.getBillByBookingId(bookingID);
%>

<h2>Update Bill Status for Booking ID: <%= bill.getBookingID() %></h2>

<p><strong>Total Amount:</strong> LKR <%= bill.getTotalAmount() %></p>
<p><strong>Tax:</strong> LKR <%= bill.getTax() %></p>
<p><strong>Discount:</strong> LKR <%= bill.getDiscount() %></p>
<p><strong>Final Amount:</strong> LKR <%= bill.getFinalAmount() %></p>
<p><strong>Status:</strong> <%= bill.getStatus() %></p>

<form action="/MegaCityCab/admin/updateBillStatus" method="post">
    <!-- Hidden fields to pass bill_ID and booking_ID -->
    <input type="hidden" name="bill_ID" value="<%= bill.getBillID() %>">
    <input type="hidden" name="booking_ID" value="<%= bill.getBookingID() %>">
    
    <label for="status">Select Status:</label>
    <select name="status" id="status">
        <option value="Pending" <%= bill.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
        <option value="Paid" <%= bill.getStatus().equals("Paid") ? "selected" : "" %>>Paid</option>
    </select><br>

    <button type="submit">Update Status</button>
</form>


<h4><a href="admindashboard.jsp">Back</a></h4>

</body>
</html>
