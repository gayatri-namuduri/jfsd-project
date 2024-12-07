<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if(admin == null)
    {
        response.sendRedirect("adsessionexpiry");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERP</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
   

    <div id="header">
        <!-- Open Sidebar Button -->
        <button class="openbtn" id="openSidebarBtn" onclick="openNav()">&#9776;</button>
        
        <!-- Admin Dashboard Title -->
        <h1>ERP</h1>
    </div>

    <!-- Navbar -->
    <div class="sidebar" id="mySidebar">
        <a href="javascript:void(0)" class="closebtn" id="closeSidebarBtn" onclick="closeNav()">&times;</a>

        <a href="adminhome" class="nav-link">Home</a>
        <a href="addstudent" class="nav-link">Add Student</a>
        <a href="addfaculty" class="nav-link">Add Faculty</a>
        <a href="courseay" class="nav-link">Add Course</a>
        <a href="fcmay" class="nav-link">Assign Courses to Faculty</a>
        <a href="viewfcmay" class="nav-link">View Faculty-Courses</a>
        <a href="viewallstudents" class="nav-link">View All Students</a>
        <a href="viewallfaculty" class="nav-link">View All Faculty</a>
        <a href="viewcourseay" class="nav-link">View All Courses</a>
        <a href="adminlogout" class="nav-link logout">Logout</a>
    </div>

    <script>
 // Function to open the sidebar and hide the Open Sidebar button
    function openNav() {
        // Hide the open sidebar button (make it invisible, but occupy space)
        document.getElementById("openSidebarBtn").classList.add("hidden");

        // Show the sidebar by adjusting its width
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";

        // Show the close sidebar button
        document.getElementById("closeSidebarBtn").style.display = "block";

        // Add class to adjust the header size
        document.body.classList.add("sidebar-open");

        // Store the sidebar state as open in localStorage
        localStorage.setItem('sidebarState', 'open');
    }

    // Function to close the sidebar, show the Open Sidebar button after a delay
    function closeNav() {
        // Close the sidebar by adjusting its width
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";

        // Wait for the sidebar to completely close (transition duration), then show the open button
        setTimeout(function() {
            // Remove the hidden class to show the open sidebar button
            document.getElementById("openSidebarBtn").classList.remove("hidden");
        }, 400); // This should match the duration of the transition (0.5s)

        // Hide the close sidebar button
        document.getElementById("closeSidebarBtn").style.display = "none";

        // Remove class to restore the header size
        document.body.classList.remove("sidebar-open");

        // Store the sidebar state as closed in localStorage
        localStorage.setItem('sidebarState', 'open');
    }

    // Check the sidebar state on page load and open it if necessary
    document.addEventListener('DOMContentLoaded', function() {
        // Check if the sidebar state is stored in localStorage
        const sidebarState = localStorage.getItem('sidebarState');

        if (sidebarState === 'open') {
            // If the sidebar was open, restore the open state
            document.getElementById("mySidebar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            document.getElementById("closeSidebarBtn").style.display = "block";
            document.getElementById("openSidebarBtn").classList.add("hidden");
            document.body.classList.add("sidebar-open");
        } else {
            // If the sidebar was closed, restore the closed state
            document.getElementById("mySidebar").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
            document.getElementById("closeSidebarBtn").style.display = "none";
            document.getElementById("openSidebarBtn").classList.remove("hidden");
            document.body.classList.remove("sidebar-open");
        }
    });


    </script>
</body>
</html>
