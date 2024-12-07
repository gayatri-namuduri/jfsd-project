<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Faculty Profile</title>
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
            color: #333;
            width: 100%;
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
        <%@ include file="adminnavbar.jsp" %>
        
        <!-- Heading at the top -->
        <h3>Faculty Profile</h3>
        
        <!-- Profile container with picture on the left and details on the right -->
        <div class="profile-container">
        
            <!-- Profile Picture -->
            <div class="profile-pic">
                <img src="displayfacprofile?id=${faculty.id}" alt="${faculty.name} Image"/>
            </div>

            <!-- Profile Details -->
            <div class="profile-details">
                <div class="detail-row">
                    <b>ID:</b> <span>${faculty.id}</span>
                </div>
                <div class="detail-row">
                    <b>NAME:</b> <span>${faculty.name}</span>
                </div>
                <div class="detail-row">
                    <b>GENDER:</b> <span>${faculty.gender}</span>
                </div>
                <div class="detail-row">
                    <b>DATE OF BIRTH:</b> <span>${faculty.dob}</span>
                </div>
                <div class="detail-row">
                    <b>DEPARTMENT:</b> <span>${faculty.department}</span>
                </div>
                <div class="detail-row">
                    <b>DESIGNATION:</b> <span>${faculty.designation}</span>
                </div>
                <div class="detail-row">
                    <b>LOCATION:</b> <span>${faculty.location}</span>
                </div>
                <div class="detail-row">
                    <b>EMAIL:</b> <span>${faculty.email}</span>
                </div>
                <div class="detail-row">
                    <b>CONTACT:</b> <span>${faculty.contact}</span>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
