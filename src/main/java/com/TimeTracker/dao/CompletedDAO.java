package com.TimeTracker.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class CompletedDAO {

    // Method to add a completed task
    public boolean addCompletedTask(String employeeId, String taskCategory, Time startTime, Time endTime, int performanceScore) throws SQLException {
        String query = "INSERT INTO completed (employee_id, task_category, start_time, end_time, performance_score) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, employeeId);
            statement.setString(2, taskCategory);
            statement.setTime(3, startTime);
            statement.setTime(4, endTime);
            statement.setInt(5, performanceScore);
            return statement.executeUpdate() > 0;
        }
    }

    // Method to get completed tasks by employee ID
    public List<CompletedTask> getCompletedTasksByEmployeeId(String employeeId) throws SQLException {
        String query = "SELECT * FROM completed WHERE employee_id = ?";
        List<CompletedTask> completedTasks = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, employeeId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String taskCategory = resultSet.getString("task_category");
                    Time startTime = resultSet.getTime("start_time");
                    Time endTime = resultSet.getTime("end_time");
                    int performanceScore = resultSet.getInt("performance_score");

                    CompletedTask completedTask = new CompletedTask(id, employeeId, taskCategory, startTime, endTime, performanceScore);
                    completedTasks.add(completedTask);
                }
            }
        }
        return completedTasks;
    }

    // CompletedTask class to hold completed task data
    public class CompletedTask {
        private int id;
        private String employeeId;
        private String taskCategory;
        private Time startTime;
        private Time endTime;
        private int performanceScore;

        public CompletedTask(int id, String employeeId, String taskCategory, Time startTime, Time endTime, int performanceScore) {
            this.id = id;
            this.employeeId = employeeId;
            this.taskCategory = taskCategory;
            this.startTime = startTime;
            this.endTime = endTime;
            this.performanceScore = performanceScore;
        }

        public int getId() {
            return id;
        }

        public String getEmployeeId() {
            return employeeId;
        }

        public String getTaskCategory() {
            return taskCategory;
        }

        public Time getStartTime() {
            return startTime;
        }

        public Time getEndTime() {
            return endTime;
        }

        public int getPerformanceScore() {
            return performanceScore;
        }
    }
}
