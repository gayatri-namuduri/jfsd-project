<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  isELIgnored="false"%>
<%
    	Student st = (Student) session.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Student</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h3 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #2980b9;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table td,
        table th {
            padding: 12px;
            text-align: left;
            vertical-align: middle;
        }

        table td {
            border-bottom: 1px solid #ddd;
        }

        label {
            font-size: 16px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="file"] {
            padding: 10px;
            margin: 8px 0 15px 0;
            font-size: 16px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 48%;
            padding: 10px;
            margin: 10px 1%;
            border: none;
            border-radius: 5px;
            background-color: #2980b9;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #3498db;
        }

        /* Button container */
        .button-container {
            text-align: center;
        }

        /* Radio Buttons */
        .gender-radio {
            display: inline-block;
            margin-right: 15px;
        }

        .gender-radio label {
            font-size: 16px;
            margin-left: 5px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h3 {
                font-size: 24px;
            }

            table {
                width: 100%;
            }

            input[type="submit"],
            input[type="reset"] {
                width: 100%;
                margin: 10px 0;
            }
        }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
        }
    </style>

    <!-- JavaScript for Password Validation -->
    <script type="text/javascript">
        function validatePasswords() {
            var password = document.getElementById('pwd').value;
            var confirmPassword = document.getElementById('confirmPwd').value;
            var errorMessage = document.getElementById('error-message');

            // Check if passwords match
            if (password !== confirmPassword) {
                errorMessage.innerHTML = "Passwords do not match!";
                return false;  // Prevent form submission
            }

            errorMessage.innerHTML = "";  // Clear any previous error messages
            return true;  // Allow form submission
        }
    </script>

</head>
<body>

  <div id="main">
    <%@include file="studentnavbar.jsp" %>    
    <h3>Update Password</h3>
    <div class="form-container">
        <form method="post" action="updatepwd" enctype="multipart/form-data" onsubmit="return validatePasswords()">
            <table>
                <tr>
                    <td><label for="id">Id</label></td>
                    <td><input type="number" id="id" name="id" value="<%= st.getId() %>" readonly required/></td>
                </tr>
                <tr>
                    <td><label for="pwd">Enter New Password</label></td>
                    <td><input type="password" id="pwd" name="pwd" required/></td>
                </tr>
                <tr>
                    <td><label for="confirmPwd">Confirm Password</label></td>
                    <td><input type="password" id="confirmPwd" name="confirmPwd" required/></td>
                </tr>
                
                <!-- Error message for mismatched passwords -->
                <tr>
                    <td colspan="2" id="error-message" class="error-message"></td>
                </tr>

                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Add"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
  </div>

</body>
</html>
