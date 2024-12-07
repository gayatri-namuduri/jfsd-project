<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
<h4>My Courses</h4><br>
    <table>
        <tr>
            
            <th>COURSE CODE</th>
            <th>COURSE NAME</th>
            <th></th>
            
        </tr>
        <c:forEach items="${fcmlist}" var="fcm">
        <c:if test="${fcm.course.academics.id==param.ay}">
            <tr>
                <td><c:out value="${fcm.course.coursecode}"/></td>
                <td><c:out value="${fcm.course.coursename}"/></td>
                <td><a href="<c:url value='viewmystudents?code=${fcm.course.coursecode}'></c:url>" class="btn ">Student List</a><br><a href="<c:url value='postattendance?code=${fcm.course.coursecode}'></c:url>" class="btn ">Post Attendance</a></td>
            </tr>
            </c:if>
        </c:forEach>
    </table>
    </div>
</body>
</html>