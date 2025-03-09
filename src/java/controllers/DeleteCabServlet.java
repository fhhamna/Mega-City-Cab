/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.CabDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/DeleteCabServlet")
public class DeleteCabServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cabID = Integer.parseInt(request.getParameter("cab_ID"));
        CabDAO cabDAO = new CabDAO();

        if (cabDAO.deleteCab(cabID)) {
            response.sendRedirect("manageCabs.jsp?message=Cab deleted successfully!");
        } else {
            response.sendRedirect("manageCabs.jsp?error=Failed to delete cab.");
        }
    }
}

