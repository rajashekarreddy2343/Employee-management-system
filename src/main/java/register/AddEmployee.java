package register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import com.TimeTracker.dao.EmployeeDAO;

@WebServlet("/addEmployee")
public class AddEmployee extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO employeeDAO;

    public AddEmployee() {
        super();
        // Initialize DAO
        employeeDAO = new EmployeeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/addemployee.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        if (name == null || name.isEmpty()) {
            response.getWriter().println("Name cannot be empty.");
            return;
        }

        try {
            // Generate a unique account number
            int accountNumber = employeeDAO.generateUniqueAccountNumber();

            // Generate a temporary password in the specified format
            String tempPassword = generateTemporaryPassword();

            // Attempt to add the employee with the generated account number and password
            boolean registrationSuccess = employeeDAO.addEmployee(accountNumber, name, tempPassword);

            if (registrationSuccess) {
                // Set attributes for the success page
                request.setAttribute("accountNumber", accountNumber);
                request.setAttribute("password", tempPassword);

                // Forward to the success page
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/success.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Registration failed. Please try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private String generateTemporaryPassword() {
        // Generate a temporary password in the format "TEMP_" + random UUID substring
        return "TEMP_" + UUID.randomUUID().toString().substring(0, 8);
    }
}
