package com.TimeTracker.dao;



import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class TasksDAO {

    // Method to add a new task
    public boolean addTask(String employeeName, String role, String project, Date taskDate, Time startTime, Time endTime, String taskCategory, String description, int employeeId, int performanceScore) throws SQLException {
        String query = "INSERT INTO tasks (employee_name, role, project, task_date, start_time, end_time, task_category, description, employee_id, performance_score) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, employeeName);
            statement.setString(2, role);
            statement.setString(3, project);
            statement.setDate(4, taskDate);
            statement.setTime(5, startTime);
            statement.setTime(6, endTime);
            statement.setString(7, taskCategory);
            statement.setString(8, description);
            statement.setInt(9, employeeId);
            statement.setInt(10, performanceScore);
            return statement.executeUpdate() > 0;
        }
    }

    // Method to get tasks by employee ID
    public List<Task> getTasksByEmployeeId(int employeeId) throws SQLException {
        String query = "SELECT * FROM tasks WHERE employee_id = ?";
        List<Task> tasks = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, employeeId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String employeeName = resultSet.getString("employee_name");
                    String role = resultSet.getString("role");
                    String project = resultSet.getString("project");
                    Date taskDate = resultSet.getDate("task_date");
                    Time startTime = resultSet.getTime("start_time");
                    Time endTime = resultSet.getTime("end_time");
                    String taskCategory = resultSet.getString("task_category");
                    String description = resultSet.getString("description");
                    int performanceScore = resultSet.getInt("performance_score");

                    Task task = new Task(id, employeeName, role, project, taskDate, startTime, endTime, taskCategory, description, employeeId, performanceScore);
                    tasks.add(task);
                }
            }
        }
        return tasks;
    }

    // Method to update a task's performance score
    public boolean updateTaskPerformanceScore(int taskId, int performanceScore) throws SQLException {
        String query = "UPDATE tasks SET performance_score = ? WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, performanceScore);
            statement.setInt(2, taskId);
            return statement.executeUpdate() > 0;
        }
    }

    // Method to delete a task
    public boolean deleteTask(int taskId) throws SQLException {
        String query = "DELETE FROM tasks WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, taskId);
            return statement.executeUpdate() > 0;
        }
    }

    // Task class to hold task data
    public class Task {
        private int id;
        private String employeeName;
        private String role;
        private String project;
        private Date taskDate;
        private Time startTime;
        private Time endTime;
        private String taskCategory;
        private String description;
        private int employeeId;
        private int performanceScore;

        public Task(int id, String employeeName, String role, String project, Date taskDate, Time startTime, Time endTime, String taskCategory, String description, int employeeId, int performanceScore) {
            this.id = id;
            this.employeeName = employeeName;
            this.role = role;
            this.project = project;
            this.taskDate = taskDate;
            this.startTime = startTime;
            this.endTime = endTime;
            this.taskCategory = taskCategory;
            this.description = description;
            this.employeeId = employeeId;
            this.performanceScore = performanceScore;
        }

        public int getId() {
            return id;
        }

        public String getEmployeeName() {
            return employeeName;
        }

        public String getRole() {
            return role;
        }

        public String getProject() {
            return project;
        }

        public Date getTaskDate() {
            return taskDate;
        }

        public Time getStartTime() {
            return startTime;
        }

        public Time getEndTime() {
            return endTime;
        }

        public String getTaskCategory() {
            return taskCategory;
        }

        public String getDescription() {
            return description;
        }

        public int getEmployeeId() {
            return employeeId;
        }

        public int getPerformanceScore() {
            return performanceScore;
        }
    }
}
