<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%
    	Student st = (Student) session.getAttribute("student");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
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
            background-color: #034694;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #6495ED;
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
        textarea {
                height: 120px; /* Define a minimum height for smaller screens */
                width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            }
    </style>
</head>
<body>
<div id="main">
<%@include file="studentnavbar.jsp" %>
    <h4>Grievance Form</h4>
    <h5 align="center" style="color: red">
  	<c:out value="${message}"></c:out>
  </h5>
    <div class="form-container">
        <form method="post" action="sendemail">
            <table>
               <tr>
                    <td><label for="name">Name *</label></td>
                    <td><input type="text" id="name" name="name" required/></td>
                </tr>
                <tr>
                    <td><label for="email">Email ID *</label></td>
                    <td><input type="email" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for="subject">Subject *</label></td>
                    <td><input type="text" id="subject" name="subject" required/></td>
                </tr>
                 <tr>
                    <td><label for="message">Message *</label></td>
                    <td>
                   <textarea name="message" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Send"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </div>
</body>
</html>
