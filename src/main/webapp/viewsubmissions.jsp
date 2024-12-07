<%@page import="com.klef.jfsd.sdp.model.Faculty"%>
<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Faculty fac = (Faculty) session.getAttribute("faculty");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Submissions</title>
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

    /* Modal styles */
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
    
    .modal input[type="number"] {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    
    .modal h2 {
        font-size: 20px;
        margin-bottom: 15px;
        color: #007bff;
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
    
    .modal button:hover {
        background-color: #0056b3;
    }

    

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
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
<%@include file="facultynavbar.jsp" %>
<h3 style="text-align: center;">View Submissions</h3><br>
    <table>
        <tr>
            <th>Student Id</th>
            <th>Student NAME</th>
            <th>Assignment Title</th>
            <th>Questions</th>
            <th>Answers</th>
            <th>Grade Assignment</th> <!-- New column for grading -->
        </tr>
        <c:forEach items="${aslist}" var="as">
            <tr id="row-${as.id}">
                <td><c:out value="${as.student.id}"/></td>
                <td><c:out value="${as.student.name}"/></td>
                <td><c:out value="${as.title}"/></td>
                <td> 
                    <a href='<c:url value="displayquestions?id=${as.id}"></c:url>' target="_blank">View questions</a>
                </td>
                <td> 
                <c:choose>
                	<c:when test="${empty as.answers}">
                		<c:out value="Not Submitted"/>
                	</c:when>
                	<c:otherwise>
					<a href='<c:url value='displayanswers?fid=${as.faculty.id}&sid=${as.student.id}'></c:url>' target="_blank">View submissions</a>
					</c:otherwise>
					</c:choose>
					</td>
                <!-- Grade Assignment Button -->
                <td> 
                <c:choose>
                	<c:when test="${as.grade>0.0}">
                		<c:out value="Graded"/>
                	</c:when>
                	<c:otherwise>
                    <button onclick="openGradePopup(${as.id})">Grade Assignment</button>
                    </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

<!-- The Modal for entering grade -->
<div id="gradeModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Enter Grade</h2>
        <form id="gradeForm" action="submitgrade" method="post">
            <input type="hidden" name="assignmentId" id="assignmentId"/>
            <label for="grade">Grade: </label>
            <input type="number" name="grade" id="grade" min="0" max="10" step="0.1" required/><br><br>
            <button type="submit">Submit Grade</button>
        </form>
    </div>
</div>

<script>
    // Open the grade entry modal
    function openGradePopup(assignmentId) {
        // Set the assignment ID in the hidden field
        document.getElementById('assignmentId').value = assignmentId;
        
        // Display the modal
        var modal = document.getElementById("gradeModal");
        modal.style.display = "block";
    }

    // Close the modal when the "X" is clicked
    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        var modal = document.getElementById("gradeModal");
        modal.style.display = "none";
    }

    // Close the modal if the user clicks anywhere outside of the modal
    window.onclick = function(event) {
        var modal = document.getElementById("gradeModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>
