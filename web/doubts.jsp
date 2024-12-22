<%-- 
    Document   : doubts
    Created on : Dec 13, 2024, 6:19:03 PM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : doubts
    Created on : Dec 13, 2024
    Author     : Your Name
--%>

<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Unresolved Doubts</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .doubt-section {
                max-width: 800px;
                margin: auto;
            }
            .doubt {
                border: 1px solid #ddd;
                padding: 15px;
                margin-bottom: 10px;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            .doubt h3 {
                margin: 0 0 10px;
            }
            textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="doubt-section">
            <h2>Unresolved Doubts</h2>
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
                            <h3><strong>Email:</strong> <%= studentEmail %></h3>
                            <p><strong>Doubt:</strong> <%= doubtText %></p>
                 <form action="saveSolution" method="POST">
                                <textarea name="solution" placeholder="Enter your solution here..." rows="4" required></textarea>
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
    </body>
</html>
