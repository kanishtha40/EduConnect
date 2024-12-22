<%-- 
    Document   : Enterdoubt
    Created on : Dec 13, 2024, 12:04:39 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="doubt-chatbot">
    <form action="submitDoubt" method="POST">
        <textarea name="doubt" placeholder="Type your doubt here..." rows="5" cols="40" required></textarea><br>
        <!-- Hidden field for studentId -->
        <input type="hidden" name="studentId" value="123"> <!-- Replace 123 with the actual student ID -->
        <button type="submit">Submit Doubt</button>
    </form>
</div>
    </body>
</html>
