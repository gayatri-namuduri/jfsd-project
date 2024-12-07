<%@page import="com.klef.jfsd.sdp.model.Faculty"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Faculty fac = (Faculty) session.getAttribute("faculty");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Course Add Success</title>
</head>
<body>
<center>
<div id="main">
        <%@include file="facultynavbar.jsp" %>
        
<c:out value="${message}"></c:out>
<br><br>
<a href="viewfaccourses?id=<%= fac.getId() %>">Back</a>
</div>
</center>
</body>
</html>