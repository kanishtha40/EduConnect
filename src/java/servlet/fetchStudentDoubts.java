/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class fetchStudentDoubts extends HttpServlet {

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
        

                 HttpSession session = request.getSession();
              String studentEmail = (String) session.getAttribute("email");

        java.util.ArrayList<String> resolvedDoubts  = new java.util.ArrayList<>();
        
        try {
            // Ensure the correct import for MySQL connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a database connection using java.sql.Connection (not servlet.Connection)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minor", "root", "kanishtha@123");

            // Query to fetch unresolved doubts
           String sql = "SELECT doubt_text, response FROM doubts WHERE email = ? AND status = 'resolved'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, studentEmail);
            ResultSet rs = ps.executeQuery();

            // Process the results and add them to the list
            while (rs.next()) {
                String doubtText = rs.getString("doubt_text");
                String solution = rs.getString("response");
                out.println("email"+solution);

                resolvedDoubts.add("<strong>Doubt:</strong> " + doubtText + "<br><strong>Solution:</strong> " + solution);
            }

            // Set the resolved doubts list as a request attribute
            request.setAttribute("resolvedDoubts", resolvedDoubts);
            out.println("email"+studentEmail);
                        // Forward the request to the student dashboard
            request.getRequestDispatcher("solution.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error fetching resolved doubts: " + e.getMessage() + "</h3>");
        }
    }  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
