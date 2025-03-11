package controllers;

import dao.CabDAO;
import model.Cab;
import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/EditCabServlet")
public class EditCabServlet extends HttpServlet {
    private CabDAO cabDAO;

    @Override
    public void init() throws ServletException {
        cabDAO = new CabDAO(); // Initialize the CabDAO
    }

    // Handle GET request to retrieve cab details for editing
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int cabID = Integer.parseInt(request.getParameter("cab_ID"));
            Cab cab = cabDAO.getCabByID(cabID);  // Correct method name: getCabById

            // Check if the cab was found
            if (cab != null) {
                request.setAttribute("cab", cab);
                RequestDispatcher dispatcher = request.getRequestDispatcher("EditCab.jsp");  // Corrected JSP name
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("manageCabs.jsp?error=Cab not found.");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("manageCabs.jsp?error=Invalid cab ID format.");
        } catch (Exception e) {
            e.printStackTrace();  // Log the exception for debugging
            response.sendRedirect("manageCabs.jsp?error=An error occurred while retrieving the cab.");
        }
    }

    // Handle POST request to update the cab details in the database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            int cabID = Integer.parseInt(request.getParameter("cab_ID"));
            String model = request.getParameter("model");
            String status = request.getParameter("status");
            BigDecimal pricePerKm = new BigDecimal(request.getParameter("price_per_km"));
            int suitcases = Integer.parseInt(request.getParameter("suitcases"));
            int passengers = Integer.parseInt(request.getParameter("passengers"));
            String transmission = request.getParameter("transmission");

            // Input validation
            if (cabID <= 0 || model == null || model.isEmpty() || status == null || status.isEmpty()) {
                response.sendRedirect("manageCabs.jsp?error=Invalid input data.");
                return;
            }

            // Create updated Cab object
            Cab updatedCab = new Cab(cabID, model, status, pricePerKm, passengers, suitcases, transmission);

            // Update the cab in the database
            boolean isUpdated = cabDAO.updateCab(updatedCab);
            if (isUpdated) {
                response.sendRedirect("manageCabs.jsp?message=Cab updated successfully!");
            } else {
                response.sendRedirect("manageCabs.jsp?error=Failed to update cab.");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("manageCabs.jsp?error=Invalid format for input data.");
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            response.sendRedirect("manageCabs.jsp?error=An error occurred while updating the cab.");
        }
    }
}
