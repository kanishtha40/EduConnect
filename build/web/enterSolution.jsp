<%-- 
    Document   : enterSolution
    Created on : Dec 12, 2024, 7:23:13 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <title>Enter Solution</title>
</head>
<body>
    <div class="header">
        <div class="logo">logo</div>
        <div class="menu_bar">
            <a href="home.html">Home</a>
            <a href="#">About</a>
            <a href="#">Contact</a>
            <a href="#">Team</a>
        </div>
        <div class="profile">
            <h4 id="text"><img src="profileicon.jpg" alt="no img">My profile</h4>
        </div>
    </div>

    <div class="solution-section">
        <h2>Enter the Solution</h2>
        <form action="saveSolution" method="POST">
            <textarea name="solution" placeholder="Enter your solution here..." rows="5" cols="40" required></textarea><br>
            <input type="hidden" name="doubtText" value="<%= request.getAttribute("doubtText") %>">
            <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
            <button type="submit">Submit Solution</button>
        </form>
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

