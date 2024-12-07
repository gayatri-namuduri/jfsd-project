<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType=" charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Student</title>
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
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="file"] {
            padding: 10px;
            margin: 8px 0 15px 0;
            font-size: 16px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 48%;
            padding: 10px;
            margin: 10px 1%;
            border: none;
            border-radius: 5px;
            background-color: #034694;
            color: white;
            font-size: 16px;
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
        }
    </style>
</head>
<body>

  <div id="main">
    <%@include file="adminnavbar.jsp" %>    
    <h4>Add Student</h4>
    <div class="form-container">
        <form method="post" action="insertstudent" enctype="multipart/form-data">
            <table>
            <tr>
                    <td><label for="id"> ID *</label></td>
                    <td><input type="number" id="id" name="id" required/></td>
                </tr>
                <tr>
                    <td><label for="name"> Name *</label></td>
                    <td><input type="text" id="name" name="name" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender *</label></td>
                    <td>
                        <div class="gender-radio">
                            <input type="radio" id="male" name="gender" value="MALE" required/>
                            <label for="male">Male</label>
                        </div>
                        <div class="gender-radio">
                            <input type="radio" id="female" name="gender" value="FEMALE" required/>
                            <label for="female">Female</label>
                        </div>
                        <div class="gender-radio">
                            <input type="radio" id="others" name="gender" value="OTHERS" required/>
                            <label for="others">Others</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><label for="dob"> Date of Birth *</label></td>
                    <td><input type="date" id="dob" name="dob" required/></td>
                </tr>
                <tr>
                    <td><label for="location"> Location *</label></td>
                    <td><input type="text" id="location" name="location" required/></td>
                </tr>
                <tr>
                    <td><label for="email"> Email ID *</label></td>
                    <td><input type="email" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for="major"> Major *</label></td>
                    <td><input type="text" id="major" name="major" required/></td>
                </tr>
                <tr>
                    <td><label for="contact"> Contact *</label></td>
                    <td><input type="number" id="contact" name="contact" required/></td>
                </tr>
                <tr>
                    <td><label>Upload Profile Image *</label></td>
                    <td><input type="file" name="profile" required="required"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Add"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
  </div>

</body>
</html>
