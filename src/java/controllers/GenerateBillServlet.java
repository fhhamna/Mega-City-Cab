package controllers;

import dao.BillingDAO;
import dao.BookingDAO;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Billing;

@WebServlet("/admin/GenerateBillServlet")
public class GenerateBillServlet extends HttpServlet {
    private BillingDAO billingDAO = new BillingDAO(); 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookingID = Integer.parseInt(request.getParameter("booking_ID"));
            
            // Use BigDecimal instead of double for accurate calculations
            BigDecimal totalAmount = new BigDecimal(request.getParameter("total_amount"));
            BigDecimal tax = new BigDecimal(request.getParameter("tax"));
            BigDecimal discount = new BigDecimal(request.getParameter("discount"));
            
            // Calculate finalAmount
            BigDecimal finalAmount = totalAmount.add(tax).subtract(discount);

            // Insert into billing table
            Billing bill = new Billing(bookingID, totalAmount, tax, discount, finalAmount, "Pending");
            billingDAO.addBill(bill);

            // Redirect admin to viewBookings.jsp
            response.sendRedirect("viewBookings.jsp?message=Bill generated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
