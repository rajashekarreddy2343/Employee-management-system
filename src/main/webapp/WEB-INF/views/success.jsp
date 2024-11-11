<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
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
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
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

        /* Body Styling */
        body {
            background-color: #f2f1eb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            text-align: center;
            padding-top: 100px; /* To prevent overlap with the fixed navbar */
            margin: 0;
        }

        /* Container for Centered Content */
        .container {
            max-width: 500px;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            margin_bottom:50px;
        }

        h1 {
            padding-top: 20px;
            margin-top: 25px;
            color: #092635;
            animation: blink 1s infinite alternate;
        }

        p {
            margin-top: 25px;
            color: #555;
            font-size: 1.2em;
        }

        b {
            color: #e57373; /* Highlight color for important text */
        }

        @keyframes blink {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            .nav-links {
                flex-direction: column;
                align-items: center;
            }

            .nav-links li {
                margin: 5px 0;
            }

            p {
                font-size: 1em;
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

    <div class="container">
        <h1>Registration Successful!</h1>
        <p>Your account number: <b>${accountNumber}</b></p>
        <p>Your password: <b>${password}</b></p>
    </div>
</body>
</html>
