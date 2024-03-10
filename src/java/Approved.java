/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.vehiclevalley.Mail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author neera
 */
public class Approved extends HttpServlet {

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

        String msg = "Hello " + name + ",\n\nWe are Happy to inform you that after careful consideration, you have been selected for the position of "+job+" at Vehicle Valley. Your skills and experience stood out among the applicants, and we believe you will be a valuable addition to our team.\n\nYour interview has been scheduled for next Monday. We kindly request you to arrive at least 15 minutes prior to your scheduled time. The interview will take place at our headquarters located at Vijay Nagar Indore bring any relevant documents or certifications with you.\n\nShould you have any questions regarding the interview process or need further assistance, please do not hesitate to reach out to us.\n\nWe look forward to meeting you and discussing how your talents can contribute to our organization.\n\nBest regards,\nVehicle Valley Team";

        // Call your Mail.send() method here
        Mail.send(to, sub, msg);

        RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
        rd.include(request, response);
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
