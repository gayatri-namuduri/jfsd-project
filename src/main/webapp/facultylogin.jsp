<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Faculty Login</title>
<link rel="stylesheet" href="style.css">
  <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Back Button Styling */
        .back-btn {
            padding: 12px 18px;
            font-size: 16px;
            background-color: #000080;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #222972;
        }

        /* Form Container Styling */
        form {
            width: 400px;
            margin: 80px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Heading Styling */
        h3 {
            font-size: 28px;
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Table Cell Styling */
        table td {
            padding: 12px;
            font-size: 16px;
            vertical-align: middle;
        }

        /* Label Styling */
        label {
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
            color: #333;
        }

        /* Input Fields Styling */
        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #02075d;
            outline: none;
        }

        /* Button Styles */
        button, input[type="submit"], input[type="reset"] {
            padding: 12px 18px;
            font-size: 16px;
            background-color: #000080;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover, input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #282E78;
        }

        button:active, input[type="submit"]:active, input[type="reset"]:active {
            background-color: #282E78;
        }

        /* Centering Buttons */
        .button-container {
            text-align: center;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            form {
                width: 100%;
                padding: 15px;
            }

            h3 {
                font-size: 24px;
            }

            input[type="text"],
            input[type="password"] {
                font-size: 14px;
                padding: 10px;
            }

            button, input[type="submit"], input[type="reset"] {
                font-size: 14px;
                padding: 10px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div id="main1">
 <div id="header">
        
        <h1>ERP</h1>
    </div>
    <!-- Back Button -->
    <a href="/" class="back-btn">Back</a>

    <h3>Faculty Login</h3><br>
<h4 align="center" style="color: red">
  	<c:out value="${message}"></c:out>
  </h4>
    <!-- Login Form -->
    <form action="checkfacultylogin" method="post">
        <table>
            <tr>
                <td><label for="id">Faculty ID</label></td>
                <td><input type="number" id="id" name="id" required /></td>
            </tr>
            <tr>
                <td><label for="pwd">Password</label></td>
                <td><input type="password" id="pwd" name="pwd" required /></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Login" />
                    <input type="reset" value="Clear" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
