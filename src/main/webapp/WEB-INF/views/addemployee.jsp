<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
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
         <a href="<%= request.getContextPath() %>/AdminDashServlet"  class="logo">Employee Time Tracker</a>
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
        <h2>Add Customer</h2>
        <form method="post" action="<%= request.getContextPath() %>/AddEmployee">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>

            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
