<%-- 
    Document   : solution
    Created on : Dec 13, 2024, 11:55:00 AM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resolved Doubts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .doubt-section {
            margin: 15px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fafafa;
        }
        .doubt-section h2, .doubt-section p {
            margin: 10px 0;
            color: #555;
        }
        .no-doubts {
            text-align: center;
            color: #666;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Resolved Doubts</h1>
        <%
            // Fetch the resolved doubts from the request attribute
            ArrayList<String> resolvedDoubts = (ArrayList<String>) request.getAttribute("resolvedDoubts");
            if (resolvedDoubts != null && !resolvedDoubts.isEmpty()) {
                for (String doubt : resolvedDoubts) {
        %>
            <div class="doubt-section">
                <%= doubt %>
            </div>
        <%
                }
            } else {
        %>
            <p class="no-doubts">No resolved doubts available at the moment.</p>
        <%
            }
        %>
    </div>
</body>
</html>
