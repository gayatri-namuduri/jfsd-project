<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ERP</title>
    <link rel="icon" type="image/x-icon" href="/images/login.png">
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            position: relative;
            height: 100vh; /* Full viewport height */
            overflow: hidden; /* To avoid any scrollbars from overlay */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center; /* Center text and links */
        }

        /* Background Image */
        .background-image {
            position: absolute; /* Position the image behind content */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('/images/bg.png'); /* Replace with your actual background image path */
            background-size: cover; /* Ensures the image covers the entire screen */
            background-position: center;
            z-index: -1; /* Send background to the back */
            opacity: 0.3; /* Reduce opacity for a lighter effect */
        }

        /* Overlay for the Background Image */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.5); /* Light white overlay */
            z-index: -1; /* Keep the overlay behind the content */
        }

        h1 {
            font-size: 48px;
            color: navy;
            margin-top: 20px; /* Adjusted space from top */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        /* Link Styling */
        a {
            font-size: 20px;
            color: #ffffff;
            text-decoration: none;
            padding: 15px 30px;
            background-color: rgba(41, 128, 185, 0.8);
            border: 2px solid #2980b9;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #2980b9;
            color: #fff;
            transform: translateY(-5px);
        }

        a:active {
            background-color: #3498db;
            transform: translateY(0);
        }

        /* Centering the div containing links */
        div {
            text-align: center;
            margin-top: 30px; /* Space from the title */
        }

        /* Footer Styling */
        footer {
            text-align: center;
            padding: 15px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 32px;
                margin-top: 50px; /* Adjust for smaller screens */
            }

            a {
                font-size: 18px;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>

    <!-- Background image -->
    <div class="background-image"></div>

    <!-- Light overlay -->
    <div class="overlay"></div>

    <h1>Welcome to ERP!</h1>

    <div>
        <a href="adminlogin">Login as Admin</a>
        <a href="facultylogin">Login as Faculty</a>
        <a href="studentlogin">Login as Student</a>
    </div>

    

</body>
</html>
