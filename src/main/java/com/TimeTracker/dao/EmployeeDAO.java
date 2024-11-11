package com.TimeTracker.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class EmployeeDAO {

    // Method to add an employee to the database
    public boolean addEmployee(int employeeId, String name, String password) throws SQLException {
        String query = "INSERT INTO employee (employee_id, name, password) VALUES (?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, employeeId);
            statement.setString(2, name);
            statement.setString(3, password);
            return statement.executeUpdate() > 0;
        }
    }

    // Method to check if an account number already exists
    public boolean isAccountNumberExists(int employeeId) throws SQLException {
        String query = "SELECT COUNT(*) FROM employee WHERE employee_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, employeeId);
            try (ResultSet resultSet = statement.executeQuery()) {
                resultSet.next();
                return resultSet.getInt(1) > 0;
            }
        }
    }

    // Method to generate a unique account number
    public int generateUniqueAccountNumber() throws SQLException {
        int newAccountNumber;
        Random random = new Random();
        do {
            newAccountNumber = 100000000 + random.nextInt(900000000);
        } while (isAccountNumberExists(newAccountNumber));
        return newAccountNumber;
    }
}
