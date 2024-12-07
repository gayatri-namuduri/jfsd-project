<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%
    	Faculty fac = (Faculty) session.getAttribute("faculty");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        

        h3 {
            font-size: 24px;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: #fff;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        table td {
            color: #333;
            font-size: 16px;
        }

        /* Adding responsiveness */
        @media (max-width: 768px) {
            table th, table td {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div id="main">
<%@include file="facultynavbar.jsp" %>
<h3 style="text-align: center;">Student List</h3><br>
    <table>
        <tr>
            
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Attendance</th>
            
        </tr>
        <c:forEach items="${cmlist}" var="cm">
        <c:if test="${cm.faculty.id==faculty.id}">
            <tr>
                <td><c:out value="${cm.student.id}"/></td>
                <td><c:out value="${cm.student.name}"/></td>
                <td><c:out value="${cm.percentage}"/></td>
            </tr>
            </c:if>
        </c:forEach>
    </table>
    </div>
</body>
</html>