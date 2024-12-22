/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class fetchDoubt extends HttpServlet {

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
        
        // List to hold doubts
                
        // List to hold doubts
        ArrayList<String> doubtsList = new ArrayList<>();
        
        try {
            // Ensure the correct import for MySQL connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a database connection using java.sql.Connection (not servlet.Connection)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minor", "root", "kanishtha@123");

            // Query to fetch unresolved doubts
            String sql = "SELECT * FROM doubts WHERE status = 'unresolved'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Fetch the doubts from the result set
            while (rs.next()) {
                String email = rs.getString("email");
                String doubtText = rs.getString("doubt_text");
                doubtsList.add("Student Email: " + email + "<br>Doubt: " + doubtText);
                request.setAttribute("email", email);
            }
            
            // Set the doubts list as an attribute to the request
      
            request.setAttribute("doubtsList", doubtsList);

            // Forward the request to the teacher dashboard page
            request.getRequestDispatcher("doubts.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error fetching doubts: " + e.getMessage() + "</h3>");
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
