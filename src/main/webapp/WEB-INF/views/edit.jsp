<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Task</title>
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    /* Navbar Styling */
    .navbar {
        background-color: rgba(245, 88, 39, 0.8);
        padding: 20px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: relative;
        border-bottom-left-radius: 50px;
        border-bottom-right-radius: 50px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .logo {
        font-size: 1.4em;
        font-weight: bold;
        color: white;
    }

    .nav-links {
        list-style: none;
        display: flex;
        align-items: center;
    }

    .nav-links li {
        margin: 0 5px;
    }

    .nav-links a {
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 1.0em;
        display: inline-block;
        padding: 6px 12px;
        transition: background-color 0.3s, transform 0.3s;
        border-radius: 15px;
    }

    .nav-links a:hover {
        background-color: rgba(254, 60, 0, 0.8);
        transform: translateY(-2px);
    }

    /* Form Container */
    .form-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    a {
        text-decoration: none;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    input[type="text"],
    input[type="number"],
    input[type="date"],
    input[type="time"],
    textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="date"]:focus,
    input[type="time"]:focus,
    textarea:focus {
        border-color: #4CAF50;
        outline: none;
    }

    textarea {
        height: 100px;
        resize: none;
    }

    input[type="submit"] {
        background-color: rgba(245, 88, 39, 0.8);
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
        width: 100%;
        font-size: 1em;
    }

    input[type="submit"]:hover {
        background-color: rgba(254, 60, 0, 0.8);
        transform: translateY(-2px);
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .form-container {
            width: 90%;
            padding: 15px;
        }

        .nav-links {
            flex-direction: column;
            align-items: center;
        }

        .nav-links li {
            margin: 5px 0;
        }
    }
</style>
</head>
<body>
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/AdminDashServlet" class="logo">Employee Time Tracker</a>
        <ul class="nav-links">
            <% String currentPage = request.getRequestURI(); %>
            <% if (!currentPage.endsWith("/AddEmployee")) { %>
                <li><a href="<%= request.getContextPath() %>/AddEmployee">Add Employee</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/AddTaskServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/AddTaskServlet">Add Task</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/GenerateServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/GenerateServlet">Charts</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/ViewServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/ViewServlet">View Task Details</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/EditServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/EditServlet">Edit Task Details</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/CompletedServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/CompletedServlet">Task Completion</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/DeleteServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/DeleteServlet">Delete Task</a></li>
            <% } %>
            <% if (!currentPage.endsWith("/register/AdminServlet")) { %>
                <li><a href="<%= request.getContextPath() %>/register/AdminServlet">Logout</a></li>
            <% } %>
        </ul>
    </nav>

    <div class="form-container">
        <h2>Edit Task</h2>
        <form action="EditServlet" method="post">
            <label for="employeeId">Employee Id:</label>
            <input type="number" id="employeeId" name="employeeId"><br>
            
            <label for="taskCategory">Task Category to Edit:</label>
            <input type="text" id="taskCategory" name="taskCategory"><br>
            
            <label for="newCategory">New Task Category:</label>
            <input type="text" id="newCategory" name="newCategory"><br>
            
            <label for="newDescription">New Task Description:</label>
            <input type="text" id="newDescription" name="newDescription"><br>
            
            <label for="newStartTime">New Start Time:</label>
            <input type="time" id="newStartTime" name="newStartTime"><br>
            
            <label for="newEndTime">New End Time:</label>
            <input type="time" id="newEndTime" name="newEndTime"><br>
            
            <input type="submit" value="Edit">
        </form>
    </div>
</body>
</html>
