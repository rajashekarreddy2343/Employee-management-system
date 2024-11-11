<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Task Duration</title>
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

        .logout {
            text-decoration: none;
            color: white;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 15px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .logout:hover {
            background-color: rgba(254, 60, 0, 0.6);
            transform: translateY(-2px);
        }

        /* Container Styling */
        .container {
            max-width: 600px;
            margin: 50px auto;
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

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .radio-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
         a {
        text-decoration: none;
        }
        

        .radio-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
        }

        .radio-group input[type="radio"] {
            margin-right: 5px;
            transform: scale(1.2);
        }

        button[type="button"] {
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

        button[type="button"]:hover {
            background-color: rgba(254, 60, 0, 0.8);
            transform: translateY(-2px);
        }

        div#totalDuration {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #092635;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .navbar {
                flex-direction: column;
                align-items: center;
            }

            .navbar a {
                margin-top: 10px;
            }

            .radio-group {
                flex-direction: column;
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
    <script>
        function showTotalDuration() {
            var employeeId = document.getElementById("employeeId").value;
            var selection = document.querySelector('input[name="selection"]:checked').value;

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "<%= request.getContextPath() %>/register/ViewServlet", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("totalDuration").innerHTML = "Total Duration: " + xhr.responseText + " hours";
                }
            };
            xhr.send("employeeId=" + employeeId + "&selection=" + selection);
        }
    </script>
</head>
<body>
    <!-- Navbar -->
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

    <!-- Container -->
    <div class="container">
        <h1>View Task Duration</h1>
        <form>
            <label for="employeeId">Employee Id:</label>
            <input type="number" id="employeeId" required>

            <div class="radio-group">
                <label for="daily">
                    <input type="radio" id="daily" name="selection" value="daily" required>
                    Daily
                </label>
                <label for="weekly">
                    <input type="radio" id="weekly" name="selection" value="weekly" required>
                    Weekly
                </label>
                <label for="monthly">
                    <input type="radio" id="monthly" name="selection" value="monthly" required>
                    Monthly
                </label>
            </div>

            <button type="button" onclick="showTotalDuration()">Calculate Total Duration</button>
        </form>
        <div id="totalDuration"></div>
    </div>
</body>
</html>
