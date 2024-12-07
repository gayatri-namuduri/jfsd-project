<%@page import="com.klef.jfsd.sdp.model.Faculty"%>
<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Faculty fac = (Faculty) session.getAttribute("faculty");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Academic Year and Semester</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 60vh;
        }

        

        h3 {
            
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 50px;
            border-collapse: collapse;
        }

        td {
            padding: 12px;
            font-size: 16px;
            color: #333;
        }

        select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f9fa;
            color: #333;
        }

        select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .button {
            background-color: #034694;
            color: #fff;
            font-size: 16px;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .button:focus {
            outline: none;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            #main {
                width: 90%; /* Smaller width on mobile */
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }

            td {
                font-size: 14px;
            }

            .button {
                width: 100%;
                padding: 14px;
            }
        }

    </style>
</head>
<body>

<div id="main">
    <%@include file="facultynavbar.jsp" %>
    
    <h4>Select Academic Year and Semester</h4>
    <form method="post" action="viewfaccourses?id=<%= fac.getId() %>">
        <table align="center">
            <tr>
                <td>
                    <select name="ay" required>
                        <option value="">---Select---</option>
                        <c:forEach items="${aylist}" var="ay">
                            <option value="${ay.id}">${ay.year} ${ay.semester}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;">
                    <input type="submit" value="Submit" class="button">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
