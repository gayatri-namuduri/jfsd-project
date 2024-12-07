<%@page import="com.klef.jfsd.sdp.model.Faculty"%>
<%@page import="com.klef.jfsd.sdp.model.Academics"%>
<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  isELIgnored="false"%>
<%
    	Student st = (Student) session.getAttribute("student");
%>
<%
    	Academics ay = (Academics) session.getAttribute("ay");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register Courses</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        

        h3 {
            font-size: 26px;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-container {
            padding: 30px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
        }

        table th {
            
            color: white;
        }

        table td {
            font-size: 16px;
            color: #555;
        }

        select, input[type="number"] {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #034694;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            table, td, th {
                font-size: 14px;
                padding: 8px;
            }

            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div id="main">
    <%@include file="studentnavbar.jsp" %>

    <h4>Register Courses</h4>

    <div class="form-container">
        <form method="post" action="coursemappinginsert">
            <input type="hidden" name="sid" value="<%= st.getId() %>" />

            <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Choose Faculty</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courselist}" var="course" varStatus="status">
                    <c:if test="${course.academics.id==param.ay}">
                        <tr>
                            <td><c:out value="${course.coursecode}"/></td>
                            <td><c:out value="${course.coursename}"/></td>

                            <td>
                                <select name="fid[${status.index}]" >
                                    <option value="">--Select Faculty--</option>
                                    <c:forEach items="${fcmlist}" var="fcm">
                                     <c:if test="${fcm.course.id==course.id}">
                                        <option value="${fcm.faculty.id}">${fcm.faculty.id} - ${fcm.faculty.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <div style="text-align: center; margin-top: 30px;">
                <input type="submit" value="Submit" class="btn btn-primary">
                <input type="reset" name="Clear" value="Clear" class="btn btn-secondary">
            </div>
        </form>
    </div>
</div>
</body>
</html>
