/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.BillingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet("/updateBillStatus")
public class UpdateBillStatusServlet extends HttpServlet {
    private BillingDAO billingDAO = new BillingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int billID = Integer.parseInt(request.getParameter("bill_ID"));
            int bookingID = Integer.parseInt(request.getParameter("booking_ID")); // Retrieve booking_ID
            String newStatus = request.getParameter("status");

            // Update the bill status in the database
            boolean updated = billingDAO.updateBillStatus(billID, newStatus);

            if (updated) {
                request.setAttribute("message", "Bill status updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update bill status.");
            }

            // Redirect back to the admin's viewBookings.jsp
            response.sendRedirect("admin/viewBookings.jsp?message=Bill status updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
