<%@page import="com.klef.jfsd.sdp.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Student st = (Student) session.getAttribute("student");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main">
<%@include file="studentnavbar.jsp" %>
Welcome, <%=st.getName() %>
</div>
</body>
</html>