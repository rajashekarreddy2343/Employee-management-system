<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    /* Body Styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        background-size: cover;
        position: relative;
    }

    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.8);
        display: flex;
        flex-direction: column;
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
        padding: 10px 20px;
        transition: background-color 0.3s, transform 0.3s;
        border-radius: 20px;
    }

    .nav-links a:hover {
        background-color: rgba(254, 60, 0, 0.8);
        transform: translateY(-2px);
    }

    /* Container Styling */
       .container {
        max-width: 1000px;
        margin: 40px auto; /* Increased top margin for more space */
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    p {
        text-align: center;
        color: #555;
        margin-bottom: 20px;
    }

    .buttons {
        margin-top: 20px;
        text-align: center;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .buttons .button-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
        border-radius: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 250px;
        margin: 30px;
        background-color: rgba(252, 249, 251, 0.92);
        transition: transform 0.3s;
    }

    .buttons .button-container img {
        height: 150px;
        width: 200px;
        margin-bottom: 15px;
        border-radius: 20px;
    }

    .buttons .button-container a {
        background-color: #f55827; /* Button color matching navbar */
        color: #fff;
        padding: 15px 20px;
        text-decoration: none;
        border-radius: 20px;
        text-align: center;
        width: 100%;
        font-size: 16px;
        margin: 10px;
        transition: background-color 0.3s, transform 0.3s;
    }

    .buttons .button-container a:hover {
        background-color: rgba(254, 60, 0, 0.8); /* Hover color */
        transform: scale(1.05);
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .container {
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
     a {
        text-decoration: none;
        }
  
</style>
</head>
<body>
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/AdminDashServlet"  class="logo">Employee Time Tracker</a>
        <ul class="nav-links">
            <li><a href="<%= request.getContextPath() %>/register/AdminServlet">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <h1>Welcome to the Admin Dashboard</h1>
        
        <div class="buttons">
            <div class="button-container">
                <img src="add.gif" alt="Add Employee">
                <a href="<%= request.getContextPath() %>/AddEmployee">Add Employee</a>
            </div>
            <div class="button-container">
                <img src="task.gif" alt="Add Task">
                <a href="<%= request.getContextPath() %>/AddTaskServlet">Add Task</a>
            </div>
            <div class="button-container">
                <img src="chart.gif" alt="Charts">
                <a href="<%= request.getContextPath() %>/GenerateServlet">Charts</a>
            </div>
            <div class="button-container">
                <img src="view.gif" alt="View Task Details">
                <a href="<%= request.getContextPath() %>/ViewServlet">View Task Details</a>
            </div>
            <div class="button-container">
                <img src="edit.gif" alt="Edit Task Details">
                <a href="<%= request.getContextPath() %>/EditServlet">Edit Task Details</a>
            </div>
            <div class="button-container">
                <img src="comple.gif" alt="Task Completion">
                <a href="<%= request.getContextPath() %>/CompletedServlet">Task Completion</a>
            </div>
            <div class="button-container">
                <img src="dele.gif" alt="Delete Task">
                <a href="<%= request.getContextPath() %>/DeleteServlet">Delete Task</a>
            </div>
        </div>
    </div>
</body>
</html>
