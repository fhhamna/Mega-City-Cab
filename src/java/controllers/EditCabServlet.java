package controllers;

import dao.CabDAO;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cab;

@WebServlet("/admin/EditCabServlet")
public class EditCabServlet extends HttpServlet {
    private CabDAO cabDAO;

    @Override
    public void init() {
        cabDAO = new CabDAO();  // Initialize the CabDAO
    }

    // Handle GET request to fetch the cab details
   /* protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cabID = Integer.parseInt(request.getParameter("id"));  // Get the cab ID from request
        Cab cab = cabDAO.getCabByID(cabID);  // Fetch the cab details from the database

        if (cab != null) {
            request.setAttribute("cab", cab);  // Set the cab object in the request
            request.getRequestDispatcher("EditCab.jsp").forward(request, response);  // Forward to edit form
        } else {
            response.sendRedirect("manageCabs.jsp?error=Cab not found");
        }
    }*/
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cabIDParam = request.getParameter("cab_ID");
        if (cabIDParam == null || cabIDParam.isEmpty()) {
            response.sendRedirect("manageCabs.jsp?error=Invalid Cab ID.");
            return;
        }

        int cabID = Integer.parseInt(cabIDParam);
        System.out.println("Received cab_ID: " + cabID); // Debugging

        CabDAO cabDAO = new CabDAO();
        Cab cab = cabDAO.getCabById(cabID);

        if (cab != null) {
            System.out.println("Cab found: " + cab.getModel()); // Debugging
            request.setAttribute("cab", cab);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/EditCab.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("Cab not found for ID: " + cabID); // Debugging
            response.sendRedirect("manageCabs.jsp?error=Cab not found.");
        }
    }

    // Handle POST request to update the cab details
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cabID = Integer.parseInt(request.getParameter("cab_ID"));  // Get the cab ID from the form
        String model = request.getParameter("model");  // Get the model from the form
        String numberPlateNo = request.getParameter("number_plate_no");  // Get number plate number
        String status = request.getParameter("status");  // Get the status (Available, Booked, etc.)
        BigDecimal pricePerKm = new BigDecimal(request.getParameter("price_per_km"));  // Get price per km

        // Create an updated Cab object with the new values
        Cab updatedCab = new Cab(cabID, model, numberPlateNo, status, pricePerKm);
        
        // Update the cab details using CabDAO
        if (cabDAO.updateCab(updatedCab)) {
            response.sendRedirect("manageCabs.jsp?message=Cab updated successfully!");  // Redirect on success
        } else {
            response.sendRedirect("manageCabs.jsp?error=Failed to update cab.");  // Redirect on failure
        }
    }
}
