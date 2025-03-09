/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.CabDAO;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cab;

@WebServlet("/admin/AddCabServlet") 
public class AddCabServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String model = request.getParameter("model");
        String numberPlateNo = request.getParameter("number_plate_no");
        String status = request.getParameter("status");
        BigDecimal pricePerKm = new BigDecimal(request.getParameter("price_per_km"));

        Cab newCab = new Cab(model, numberPlateNo, status, pricePerKm);
        CabDAO cabDAO = new CabDAO();
        
        if (cabDAO.addCab(newCab)) {
            response.sendRedirect("manageCabs.jsp?message=Cab added successfully!");
        } else {
            response.sendRedirect("manageCabs.jsp?error=Failed to add cab.");
        }
    }
}

