<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@include file="facultynavbar.jsp" %>
<%
    	Faculty fac = (Faculty) session.getAttribute("faculty");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Attendance</title>
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
    <h3 style="text-align: center;">Student Attendance</h3><br>

    <!-- Attendance form -->
    <form action="submitattendance" method="post">
    <table>
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Present</th>
            <th>Absent</th>
        </tr>
        <c:forEach items="${cmlist}" var="cm">
        <c:if test="${cm.faculty.id==faculty.id}">
            <tr>
                <!-- Display Student ID -->
                <td><c:out value="${cm.student.id}"/></td>
                
                <!-- Display Student Name -->
                <td><c:out value="${cm.student.name}"/></td>

                <!-- Radio buttons for Present and Absent -->
                <td>
                    <input type="radio" name="attendance_${cm.student.id}_${cm.course.id}" value="1" /> Present
                    <input type="hidden" name="code" value="${cm.course.coursecode}" />
                    <!-- Hidden Fields for student and course IDs -->
                    <input type="hidden" name="studentId_${cm.student.id}_${cm.course.id}" value="${cm.student.id}" />
                    <input type="hidden" name="courseId_${cm.student.id}_${cm.course.id}" value="${cm.course.id}" />
                </td>
                <td>
                    <input type="radio" name="attendance_${cm.student.id}_${cm.course.id}" value="0" /> Absent
                    <input type="hidden" name="code" value="${cm.course.coursecode}" />
                    <!-- Hidden Fields for student and course IDs -->
                    <input type="hidden" name="studentId_${cm.student.id}_${cm.course.id}" value="${cm.student.id}" />
                    <input type="hidden" name="courseId_${cm.student.id}_${cm.course.id}" value="${cm.course.id}" />
                </td>
            </tr>
            </c:if>
        </c:forEach>
    </table>
	<center>
    <input type="submit" value="Submit Attendance">
    </center>
    </form>

    <!--   <script>
        // Reset the form after submission
        document.querySelector('form').addEventListener('submit', function() {
            this.reset();
        });
    </script> -->

</div>
</body>
</html>
