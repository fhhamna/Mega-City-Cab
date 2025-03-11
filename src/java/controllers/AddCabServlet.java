package controllers;

import dao.CabDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cab;
import java.math.BigDecimal;

@WebServlet("/admin/AddCabServlet")
public class AddCabServlet extends HttpServlet {
    
    // Handle the POST request to add a new cab
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data from the request
        String model = request.getParameter("model");
        String status = request.getParameter("status");
        BigDecimal pricePerKm = new BigDecimal(request.getParameter("price_per_km"));
        int suitcases = Integer.parseInt(request.getParameter("suitcases"));
        int passengers = Integer.parseInt(request.getParameter("passengers"));
        String transmission = request.getParameter("transmission");

        // Create a new Cab object with the input data
        Cab newCab = new Cab(0, model, status, pricePerKm, passengers, suitcases, transmission);

        // Initialize CabDAO and try to add the new cab
        CabDAO cabDAO = new CabDAO();
        boolean isAdded = cabDAO.addCab(newCab);
        
        // Check if the cab was added successfully and redirect accordingly
        if (isAdded) {
            response.sendRedirect("manageCabs.jsp?message=Cab added successfully!");
        } else {
            response.sendRedirect("manageCabs.jsp?error=Failed to add cab.");
        }
    }
}

