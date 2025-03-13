package controllers;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
  import org.mindrot.jbcrypt.BCrypt; // ✅ Import BCrypt for password hashing

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

  

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // ✅ Retrieve registration_ID from session
    HttpSession session = request.getSession();
    Object regIdObj = session.getAttribute("registration_ID");

    if (regIdObj == null) {
        response.sendRedirect("registerCustomer.jsp?error=No registration ID found. Register as a customer first.");
        return;
    }

    int registrationID;
    try {
        registrationID = Integer.parseInt(regIdObj.toString()); // ✅ Convert to int
    } catch (NumberFormatException e) {
        response.sendRedirect("registerCustomer.jsp?error=Invalid registration ID format.");
        return;
    }

    // ✅ Hash the password before storing
    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    // ✅ Pass the hashed password to the User object
    User newUser = new User(username, hashedPassword, registrationID);

    boolean isRegistered = userDAO.registerUser(newUser);

    if (isRegistered) {
        response.sendRedirect("login.jsp?message=Registration successful! Please log in.");
    } else {
        response.sendRedirect("register.jsp?error=Registration failed. Try again.");
    }
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    public String getServletInfo() {
        return "User Registration Servlet";
    }
}
