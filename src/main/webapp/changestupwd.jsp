<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reset Password</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div id="main1">
    <div id="header">
        <h1>ERP</h1>
    </div>

    <h3>Reset Your Password</h3>

    <!-- Reset Password Form -->
    <form action="resetpwd" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>" />
        <table>
            <tr>
                <td><label for="pwd">New Password</label></td>
                <td><input type="password" id="pwd" name="pwd" required /></td>
            </tr>
            
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Reset Password" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
