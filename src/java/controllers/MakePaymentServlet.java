/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.BillingDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet("/customer/MakePaymentServlet")
public class MakePaymentServlet extends HttpServlet {
    private BillingDAO billingDAO = new BillingDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int billID = Integer.parseInt(request.getParameter("bill_ID"));

            // Update bill status to 'Paid'
            boolean updated = billingDAO.updateBillStatus(billID, "Paid");

            if (updated) {
                request.setAttribute("message", "Payment successful. Bill marked as Paid.");
                // Optionally redirect to a confirmation page or back to user dashboard
            } else {
                request.setAttribute("error", "Failed to mark bill as Paid.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("billDetails.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
