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
input[type="date"],
select {
    width: 100%;
    padding: 10px;
    margin: 8px 0 15px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    box-sizing: border-box; /* Ensures padding doesn't affect width */
}

select {
    background-color: #fff; /* White background for the dropdown */
    -webkit-appearance: none; /* Removes the default dropdown arrow in webkit browsers */
    -moz-appearance: none;    /* Removes the default dropdown arrow in Firefox */
    appearance: none;         /* Removes the default dropdown arrow in other browsers */
    background-image: url('data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%2210%22 height=%2210%22 viewBox=%220 0 10 10%22%3E%3Cpolygon points=%220,0 10,0 5,7%22 fill=%22%23333%22/%3E%3C/svg%3E'); /* Custom arrow */
    background-repeat: no-repeat;
    background-position: right 10px center;
}

select:focus {
    outline: none;
    border-color: #034694;
    box-shadow: 0 0 5px rgba(0, 53, 106, 0.4);
}

input[type="file"] {
    padding: 10px;
    margin: 8px 0 15px 0;
    font-size: 16px;
}

input[type="submit"],
input[type="reset"] {
   padding: 10px 20px;
            font-size: 16px;
            background-color: #034694;
            color: white;
            border: none;
            border-radius: 5px;
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

    select {
        height: 40px; /* Set a height for better consistency on small screens */
    }
}

    </style>
</head>
<body>

  <div id="main">
      <%@include file="adminnavbar.jsp" %>
    <h4>Assign Courses to Faculty</h4>
    <div class="form-container">
        <form method="post" action="assigncourses" >
            <table>
            	<tr>
    <td>Select Faculty</td>
    <td>
    <select name="faculty" required>
    <option value="">---Select---</option>
    <c:forEach items="${faclist}" var="fac">
<option value="${fac.id}">${fac.id} - ${fac.name}</option>
</c:forEach>
</select>
    </td>
    </tr>
    <tr>
    <td>Select Course</td>
    <td>
    <select name="course" required>
    <option value="">---Select---</option>
    <c:forEach items="${clist}" var="course">
    <c:if test="${course.academics.id==param.ay}">
<option value="${course.id}">${course.coursecode} - ${course.coursename}</option>
</c:if>
</c:forEach>
</select>
    </td>
    </tr>
    
    <tr>
    <td colspan="2">
    <center>
    <input type="submit" value="Submit" class="button">
    </center>
    </td>
    </tr>
                
            </table>
        </form>
    </div>
  </div>

</body>
</html>
