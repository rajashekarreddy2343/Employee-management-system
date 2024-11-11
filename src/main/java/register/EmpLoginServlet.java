package register;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class EmpLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EmpLoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeelogin.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String password = request.getParameter("password");

        if (isValidLogin(accountNumber, password)) {
            if (isTemporaryPassword(accountNumber, password)) {
                // Redirect to ChangePasswordServlet if password is temporary
                response.sendRedirect("ChangePasswordServlet");
            } else {
                request.getSession().setAttribute("loggedIn", true);
                request.getSession().setAttribute("accountNumber", accountNumber);
                System.out.println("LoginServlet - Setting loggedIn to true");
                System.out.println("LoginServlet - Setting accountNumber: " + accountNumber);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeedashboard.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            // Pass error message to JSP
            request.setAttribute("loginError", "Error: Employee Id or Password Incorrect");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/employeelogin.jsp");
            dispatcher.forward(request, response);
        }
    }

    private boolean isValidLogin(String accountNumber, String password) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/time?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        String dbUser = "root";
        String dbPassword = "root";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String checkQuery = "SELECT COUNT(*) FROM employee WHERE employee_id = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(checkQuery)) {
                preparedStatement.setString(1, accountNumber);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    return resultSet.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean isTemporaryPassword(String accountNumber, String password) {
        // Assuming a password with "TEMP" is considered temporary
        return password != null && password.contains("TEMP");
    }
}
