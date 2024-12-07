<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View All Students</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
      
body {
  display: flex;
  flex-direction: column; /* Stack content vertically */
  align-items: center;
  justify-content: flex-start; /* Align content to the top of the page */
  margin: 0;
  padding-top: 5px; /* Add padding to push content down below the header */
  background-color: #f0f0f0; /* Light background for contrast */
}

.container {
  
  
 
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.125);
  padding: 3px;
  
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  width: 100%;
  max-width: 12000px; /* Set a max-width for larger screens */
  margin-top: 5px; /* Add space between header and container */
}

.wrapper {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1.5rem; /* Space between cards */
}

.card-image {
  background-position: center;
  background-size: cover;
  width: 300px; /* Fixed card width */
  height: 400px; /* Fixed card height */
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.255);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
  background-color: #fff;
  box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s ease;
}

.card-image:hover {
  transform: translateY(-5px); /* Hover effect to lift the card */
}

.card-image .profile-img {
  width: 125px;
  height: 175px;
  border-radius: 10%;
  object-fit: cover;
  margin-bottom: 20px; /* Space between image and text */
}

h3 h5{
  font-family: 'Righteous', sans-serif;
  color: rgba(0, 0, 0, 0.8);
  text-transform: uppercase;
  font-size: 1.25rem; /* Slightly smaller to fit the card */
  margin: 0.5rem 0;
}

p {
  color: #555;
  font-family: 'Lato', sans-serif;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin: 0.5rem 0;
}

.button-wrapper {
  margin-top: 10px;
}

.btn {
  background-color: #007bff;
  border: none;
  padding: 12px 24px;
  border-radius: 24px;
  color: #fff;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s ease;
}

.btn:hover {
  background-color: #0056b3;
  transform: scale(1.05); /* Slightly scale the button on hover */
  color: white;
}


 </style>
</head>
<body>
    <!-- Page Content -->
    
    <div id="main">
        
        <%@include file="adminnavbar.jsp" %>  
        <div class="container">
        <h3 class="text-center my-4">View All Students</h3>

        <div class="container">
        <div class="wrapper">
            <c:forEach items="${stdlist}" var="std">
                <div class="card-image">
                    <img src="displaystuprofile?id=${std.id}" class="profile-img" alt="Profile Picture">
                    
                        <h3 class="card-title">${std.name}</h3>
                        <h5 class="card-text">${std.id}</h5>
                        <div class="button-wrapper">
                        <a href="<c:url value='displaystudent?id=${std.id}'></c:url>" class="btn ">View</a>&nbsp;
                        <!--   <a href="<c:url value='deletestudent?id=${std.id}'></c:url>" class="btn ">Delete</a> -->
                   </div>
                   
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
    </div>
</body>
</html>
