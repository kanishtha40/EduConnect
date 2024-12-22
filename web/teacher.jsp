<%-- 
    Document   : teacher
    Created on : Dec 12, 2024, 6:36:10 PM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <title>Faculty Dashboard</title>
</head>
<body>
    <div class="header">
        <div class="logo">logo</div>
        <div class="menu_bar">
            <a href="index.html">Home</a>
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Team</a>
        </div>
        <div class="profile">
            <h4 id="text"><img src="profileicon.jpg" alt="no img">My profile</h4>
        </div>
    </div>

   <div class="doubt-section">
    <h2>Unresolved Doubts</h2>
    <div>
        <% 
            // Fetch the doubts from request attributes
            ArrayList<String> doubtsList = (ArrayList<String>) request.getAttribute("doubtsList");
            if (doubtsList != null && !doubtsList.isEmpty()) {
                for (String doubt : doubtsList) {
                    // Split the doubt details into email and doubt text (adjust if format changes)
                    String[] parts = doubt.split("<br>Doubt: ");
                    String studentEmail = parts[0].replace("Student Email: ", "").trim();
                    String doubtText = parts[1].trim();
        %>
            <div class="doubt">
                <p><strong>Email:</strong> <%= studentEmail %></p>
                <p><strong>Doubt:</strong> <%= doubtText %></p>
                <!-- Form to resolve the doubt -->
                <form action="saveSolution" method="POST">
                    <textarea name="solution" placeholder="Enter your solution here..." rows="4" cols="40" required></textarea><br>
                    <input type="hidden" name="doubtText" value="<%= doubtText %>">
                    <input type="hidden" name="email" value="<%= studentEmail %>">
                    <button type="submit">Submit Solution</button>
                </form>
            </div>
        <%
                }
            } else {
        %>
            <p>No unresolved doubts.</p>
        <%
            }
        %>
    </div>
</div>


    <footer>
        <div class="footerContainer">
            <div class="socialIcons">
                <a href=""><img src="gmail.jpg"></a>
                <a href=""><img src="g.jpg"></a>
                <a href=""><img src="insta.jpg"></a>
                <a href=""><img src="lin.jpg"></a>
            </div>
            <div class="footerNav">
                <a href="3">Home</a>
                <a href="#">About</a>
                <a href="#">Contact us</a>
                <a href="#">Register</a>
                <a href="#">Log in</a>
            </div>
            <div class="footerbottom">
                <p>Copyright &copy;2024</p>
            </div>
        </div>
    </footer>
</body>
</html>
