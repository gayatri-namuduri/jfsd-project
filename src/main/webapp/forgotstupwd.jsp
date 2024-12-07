<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="main1">
    <div id="header">
        <h1>ERP</h1>
    </div>

    <h3 align="center">Forgot Password</h3><br><br>
	<h4 align="center" style="color: red">
  	<c:out value="${message}"></c:out>
  </h4>
    <!-- Forgot Password Form -->
    <center>
    <form action="checkstuid" method="post">
    
        <table>
        
            <tr>
                <td><label for="id">Enter Student ID</label></td>
                <td><input type="number" id="id" name="id" required /></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Submit" />
                </td>
            </tr>
        </table>
        
    </form>
     <a href="studentlogin">Back to login</a>
    </center>
</div>
</body>
</html>
