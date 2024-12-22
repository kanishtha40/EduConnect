<%-- 
    Document   : student
    Created on : Dec 13, 2024, 9:08:42 AM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <title>Student Dashboard</title>
</head>
<body>
    <div class="header">
        <div class="logo">logo</div>
        <div class="menu_bar">
            <a href="index.html">Home</a>
            <a href="#">About</a>
            <a href="contact.html">Contact</a>
            <a href="#">Team</a>
            <a href="logout">logout</a>
        </div>
        
        <div class="profile">
            <a href="Enterdoubt.jsp">Ask Doubt</a>
            <a href="fetchStudentDoubts">view solution</a>
            <h4 id="text"><img src="profileicon.jpg" alt="no img">My profile</h4>
        </div>
    </div>
    
    <div class="subject">
        <div class="sub-text">
            <h1>Subjects</h1>
        </div>
        <div class="sub-image">
            <a href="eees.html"><img src="1.png" alt="no img"></a>
            <a href="Discrete.html"><img src="2.png" alt="no img"></a>
            <a href="dsa.html"><img src="3.png" alt="no img"></a>
            <a href="digital.html"><img src="4.png" alt="no img"></a>
            <a href="oopm.html"><img src="5.png" alt="no img"></a>
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
