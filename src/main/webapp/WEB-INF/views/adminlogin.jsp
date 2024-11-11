<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            user-select: none;
            position: relative;
            min-height: 100vh;
            overflow: hidden; /* Prevent horizontal scrolling */
        }

        a {
            text-decoration: none;
        }

        /* Background Image */
        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('log.gif');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.8; /* Opacity for the background image */
            z-index: -2; /* Ensure it's behind other content */
        }

        /* White Overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(251, 231, 227, 0.52); /* Light white overlay */
            z-index: -1; /* Ensure it's between the background and content */
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
            z-index: 1; /* Above overlay */
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

        /* Form Styling */
        .form-container {
            background-color: rgba(238, 255, 255, 0.9);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: 130px auto; /* Centers form on the page */
            color: #092635;
            z-index: 1; /* Ensures the form is above the overlay */
            position: relative;
        }

        h2 {
            text-align: center;
            color: #092635;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            background-color: white;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            color: #3c3633;
        }

        .error-message {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }

        button[type="submit"] {
            background-color: rgba(245, 88, 39, 0.8);
            color: #f2f1eb;
            padding: 10px 15px;
            align-items: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s;
        }

        button[type="submit"]:active {
            transform: translateY(2px); /* Push the button down slightly when clicked */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a shadow when clicked */
        }

        button[type="submit"]:hover {
            background-color: rgba(254, 60, 0, 0.8);
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                width: 90%;
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
    <!-- Light White Overlay -->
    <div class="overlay"></div>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">Employee Time Tracker</div>
        <!-- Add navigation links if needed -->
    </nav>

    <!-- Form Container -->
    <div class="form-container">
        <h2>Admin Login</h2>
        <form action="<%= request.getContextPath() %>/register/AdminServlet" method="post">
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="error-message"><%= errorMessage %></div>
            <% } %>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
