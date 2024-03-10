/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.vehiclevalley.Mail;
import com.vehiclevalley.connection.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author neera
 */
public class Rejected extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String job = request.getParameter("job");

        String to = email;
        String sub = "Vehicle Valley";

        String msg = "Hello " + name + ",\n\nUnfortunately, we regret to inform you that after careful consideration, you do not meet our eligibility criteria for the position of " + job + " at Vehicle Valley. We appreciate your interest in joining our team and the time you invested in the application process.\n\nWe wish you all the best for your future endeavors. If you have any questions or need further assistance, please feel free to contact us.\n\nBest regards,\nVehicle Valley Team";

        // Call your Mail.send() method here
        Mail.send(to, sub, msg);

        try {
            Connection cn = CreateConnection.getConnection();
            String deleteQuery = "DELETE FROM job_application WHERE email=?";
            PreparedStatement pstmt = cn.prepareStatement(deleteQuery);
            pstmt.setString(1, email);
            pstmt.executeUpdate();
            CreateConnection.closeConnection();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle any potential errors
        }

        response.sendRedirect("adminhome.jsp");
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
