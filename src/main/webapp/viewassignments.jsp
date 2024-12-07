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
<title>My Assignments</title>
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

    /* Pop-up modal styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        overflow: auto;
        padding-top: 200px; /* Adjusted for better vertical centering */
        padding-left: 500px;
        padding-right: 500px;
    }

    .modal-content {
        background-color: #fff;
        margin: auto;
        padding: 20px;
        border: 1px solid #ccc;
        width: 300px; /* Set width of the modal */
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .modal h2 {
        font-size: 20px;
        margin-bottom: 15px;
        color: #007bff;
    }

    .modal input[type="file"] {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .modal button {
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        padding: 12px 24px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        transition: background-color 0.3s ease;
    }
    
    button {
        background-color: #007bff;
        color: #fff;
        font-size: 16px;
        padding: 12px 24px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        transition: background-color 0.3s ease;
    }

    .modal button:hover {
        background-color: #0056b3;
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>
</head>
<body>

<div id="main">
<%@include file="studentnavbar.jsp" %>
<h3>My Assignments</h3><br>
<c:out value="${message}"></c:out>
<table>
    <tr>
        <th>COURSE CODE</th>
        <th>COURSE NAME</th>
        <th>Assignment Title</th>
        <th>Questions</th>
        <th>Deadline</th>
        <th>Grade</th>
        <th></th> <!-- New column -->
    </tr>

    <c:forEach items="${aslist}" var="as">
        <tr>
            <td><c:out value="${as.course.coursecode}"/></td>
            <td><c:out value="${as.course.coursename}"/></td>
            <td><c:out value="${as.title}"/></td>
            <td>
                <a href='<c:url value="displayquestions?id=${as.id}"></c:url>' target="_blank">View questions</a>
            </td>
            <td><c:out value="${as.deadline}"/></td>
            <td> 
                <c:choose>
                	<c:when test="${as.grade==0.0}">
                		<c:out value="Not Graded"/>
                	</c:when>
                	<c:otherwise>
                    <c:out value="${as.grade}"/>
                    </c:otherwise>
                    </c:choose>
                </td>

            <!-- Upload button and condition for deadline check -->
            <td>
                <c:choose>
                <c:when test="${!empty as.answers}"> <!-- Check if the deadline is in the future -->
                        <c:out value="Assignment Submitted"></c:out>
                    </c:when>
                    <c:when test="${as.deadline lt 'now'}"> <!-- Check if the deadline is in the future -->
                        <button onclick="openUploadPopup(${as.id})">Upload Assignment</button>
                    </c:when>
                    <c:otherwise>
                        <c:out value="Deadline closed"></c:out>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- The Modal -->
<div id="uploadModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Upload Assignment</h2>
        <form action="uploadassignment" method="post" enctype="multipart/form-data">
            <input type="file" name="assignmentFile" required/><br><br>
            <input type="hidden" name="assignmentId" id="assignmentId" />
            <button type="submit">Upload</button>
        </form>
    </div>
</div>

</div>

<script>
    // Open the modal when the Upload button is clicked
    function openUploadPopup(assignmentId) {
        // Set the assignment ID for the form submission
        document.getElementById('assignmentId').value = assignmentId;
        var modal = document.getElementById("uploadModal");
        modal.style.display = "block";
    }

    // Close the modal when the "X" is clicked
    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        var modal = document.getElementById("uploadModal");
        modal.style.display = "none";
    }

    // Close the modal if the user clicks anywhere outside of it
    window.onclick = function(event) {
        var modal = document.getElementById("uploadModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>
