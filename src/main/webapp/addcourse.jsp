<%@page import="com.klef.jfsd.sdp.model.Academics"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType=" charset=ISO-8859-1" isELIgnored="false"%>
<%
    	Academics ay = (Academics) session.getAttribute("ay");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Course</title>
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
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
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
    </style>
</head>
<body>

  <div id="main">
      <%@include file="adminnavbar.jsp" %>
    <h4>Add Course</h4>
    <div class="form-container">
        <form method="post" action="insertcourse" enctype="multipart/form-data">
            <table>
            	<tr>
                    <td><input type="number" id="ayid" name="ayid" value="<%=ay.getId() %>" hidden=true required/></td>
                </tr>
                <tr>
                    <td><label for="coursecode">Course Code *</label></td>
                    <td><input type="text" id="coursecode" name="coursecode" required/></td>
                </tr>
                <tr>
                    <td><label for="coursename">Course Name *</label></td>
                    <td><input type="text" id="coursename" name="coursename" required/></td>
                </tr>
                <tr>
                    <td><label for="offereddept">Offered Department *</label></td>
                    <td><input type="text" id="offereddept" name="offereddept" required/></td>
                </tr>
                <tr>
                    <td><label for="credits">Credits *</label></td>
                    <td><input type="number" id="credits" name="credits" required/></td>
                </tr>
                <tr>
					<td><label for="handout">Upload Handout *</label></td>
					<td><input type="file" id="handout" name="handout" required/></td>
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
