<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Student st = (Student) session.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My Profile</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Centering the profile layout */
        body {
            background-color: #f4f7fb;
            font-family: Arial, sans-serif;
        }
        /* Card-style container for the profile */
        .profile-container {
            display: flex;
            width: 80%;
            max-width: 900px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        /* Profile picture styling on the left */
        .profile-pic {
            flex: 0 0 30%; /* Ensure the profile picture takes up 30% of the width */
            padding-right: 20px;
            text-align: center;
        }

        .profile-pic img {
            width: 100%;
            max-width: 200px;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Profile details styling on the right */
        .profile-details {
            flex: 1;
            padding-left: 20px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        /* Each detail row with consistent spacing */
        .profile-details .detail-row {
            display: flex;
            margin-bottom: 12px;
            align-items: center;
        }

        .profile-details .detail-row b {
            font-size: 1.1em;
            color: #555;
            width: 150px; /* Align the labels and colons */
        }

        .profile-details .detail-row span {
            font-size: 1.1em;
            color: #333;
            padding-left: 10px; /* Space between colon and value */
        }

        /* Heading styling */
        h3 {
            text-align: center;
            font-size: 2em;
            margin-bottom: 30px;
            text-decoration: underline;
            color: #333;
            width: 100%;
        }

        /* Button Styling */
        .update-button-container {
            margin-top: 20px;
            text-align: center;
        }

        .update-button {
            background-color: #034694;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .update-button:hover {
            background-color: #2980b9;
        }

        /* Media queries for responsiveness */
        @media (max-width: 768px) {
            .profile-container {
                flex-direction: column;
                text-align: center;
            }

            .profile-pic {
                margin-bottom: 20px;
            }

            .profile-pic img {
                max-width: 150px;
            }

            .profile-details {
                padding-left: 0;
            }

            .profile-details .detail-row {
                justify-content: center;
                margin-bottom: 10px;
            }

            .profile-details .detail-row b {
                width: auto; /* Reset width on smaller screens */
            }
        }
    </style>
</head>
<body>
    <div id="main">
        <%@ include file="studentnavbar.jsp" %>
        
        <!-- Heading at the top -->
        <h3>My Profile</h3>
        <h4 align="center" style="color: red">
            <c:out value="${message}"></c:out>
        </h4>
        
        <!-- Profile container with picture on the left and details on the right -->
        <div class="profile-container">
            <!-- Profile Picture -->
            <div class="profile-pic">
                <img src="displaystuprofile?id=<%= st.getId() %>" alt="<%= st.getName() %> Image"/>
            </div>

            <!-- Profile Details -->
            <div class="profile-details">
                <div class="detail-row">
                    <b>ID:</b> <span><%= st.getId() %></span>
                </div>
                <div class="detail-row">
                    <b>NAME:</b> <span><%= st.getName() %></span>
                </div>
                <div class="detail-row">
                    <b>GENDER:</b> <span><%= st.getGender() %></span>
                </div>
                <div class="detail-row">
                    <b>DATE OF BIRTH:</b> <span><%= st.getDob() %></span>
                </div>
                <div class="detail-row">
                    <b>MAJOR:</b> <span><%= st.getMajor() %></span>
                </div>
                <div class="detail-row">
                    <b>LOCATION:</b> <span><%= st.getLocation() %></span>
                </div>
                <div class="detail-row">
                    <b>EMAIL:</b> <span><%= st.getEmail() %></span>
                </div>
                <div class="detail-row">
                    <b>CONTACT:</b> <span><%= st.getContact() %></span>
                </div>
            </div>
        </div>

        <!-- Update Password Button -->
        <div class="update-button-container">
            <a href="updatestupwd">
                <button class="update-button">Update Password</button>
            </a>
        </div>
    </div>
</body>
</html>
