<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>404 - Not Found</title>
</head>
<body>
    <h1>Error 404 - Resource Not Found</h1>
    <p><c:out value="${errorMessage}" /></p> <!-- Display error message using c:out -->
</body>
</html>
