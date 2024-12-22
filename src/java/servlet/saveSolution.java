/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class saveSolution extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
           
        
        
         // Get the solution, doubt text, and email
        String solution = request.getParameter("solution");
        String doubtText = request.getParameter("doubtText");
        String email = request.getParameter("email");

        //out.println("Solution: " + solution);
        //out.println("Doubt Text: " + doubtText);
        out.println("Email: " + email);

        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minor", "root", "kanishtha@123");

            // Check if the doubt exists
            String checkSql = "SELECT count(*) FROM doubts WHERE doubt_text = ? AND email = ?";
            PreparedStatement checkPs = con.prepareStatement(checkSql);
            checkPs.setString(1, doubtText);
            checkPs.setString(2, email);
            ResultSet checkRs = checkPs.executeQuery();

            if (checkRs.next() && checkRs.getInt(1) > 0) {
                // Update the solution if the doubt exists
                String sql = "UPDATE doubts SET response = ?, status = 'resolved', resolved_at = ? WHERE doubt_text = ? AND email = ?";
                PreparedStatement ps = con.prepareStatement(sql);

                // Set the values for the prepared statement
                ps.setString(1, solution);
                ps.setTimestamp(2, new Timestamp(System.currentTimeMillis()));  // Set current timestamp
                ps.setString(3, doubtText);
                ps.setString(4, email);

                int rowsUpdated = ps.executeUpdate();
                System.out.println("Rows updated: " + rowsUpdated);

                if (rowsUpdated > 0) {
                    response.sendRedirect("faculty.jsp");  // Redirect to the faculty dashboard after saving the solution
                } else {
                    response.getWriter().println("<h3>Error: Could not save the solution.</h3>");
                    
                }
            } else {
               // out.println("Doubt Text: " + doubtText);
                response.getWriter().println("<h3>No doubt found for the given text and email.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
