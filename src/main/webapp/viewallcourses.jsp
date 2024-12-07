<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View All Courses</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    <%@include file="adminnavbar.jsp" %>
    <h3>View All Courses</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>COURSE CODE</th>
                <th>COURSE NAME</th>
                <th>OFFERED DEPARTMENT</th>
                <th>CREDITS</th>
                <th>Handout</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${courselist}" var="course">
            <c:if test="${course.academics.id==param.ay}">
                <tr>
                    <td><c:out value="${course.id}"/></td>
                    <td><c:out value="${course.coursecode}"/></td>
                    <td><c:out value="${course.coursename}"/></td>
                    <td><c:out value="${course.offeredDept}"/></td>
                    <td><c:out value="${course.credits}"/></td>
                    <td> 
					<a href='<c:url value='displayhandout?id=${course.id}'></c:url>' target="_blank">View</a>
					</td>
                </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
