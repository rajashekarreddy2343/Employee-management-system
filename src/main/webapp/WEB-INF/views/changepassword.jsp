<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
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

        /* Form Container Styling */
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

        input[type="submit"] {
            background-color: rgba(245, 88, 39, 0.8);
            color: #f2f1eb;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s;
        }

        input[type="submit"]:active {
            transform: translateY(2px); /* Push the button down slightly when clicked */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Add a shadow when clicked */
        }

        input[type="submit"]:hover {
            background-color: rgba(254, 60, 0, 0.8);
        }

        .note {
            font-size: 0.9em;
            color: #555;
            text-align: center;
            margin-top: 10px;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <!-- Light White Overlay -->
    <div class="overlay"></div>

    <!-- Form Container -->
    <div class="form-container">
        <h2>Change Password</h2>
        <form action="<%= request.getContextPath() %>/ChangePasswordServlet" method="post" onsubmit="return validatePassword()">
            <label for="accountNumber">Employee Id:</label>
            <input type="text" id="accountNumber" name="accountNumber" required><br>
            <label for="oldPassword">Old Password:</label>
            <input type="password" id="oldPassword" name="oldPassword" required><br>
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required><br>
            <input type="submit" value="Change Password">
            <p class="note"><strong>NOTE:</strong> Password should contain more than 7 characters and one special character is mandatory.</p>
        </form>
    </div>
    <script>
        function validatePassword() {
            var newPassword = document.getElementById("newPassword").value;
            if (newPassword.length < 8 || newPassword.length > 21) {
                alert("Password should be between 8 and 21 characters.");
                return false;
            }
            var specialCharacterRegex = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/;
            if (!specialCharacterRegex.test(newPassword)) {
                alert("Password should contain at least one special character.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
