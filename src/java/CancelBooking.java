/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.vehiclevalley.Mail;
import com.vehiclevalley.connection.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author neera
 */
public class CancelBooking extends HttpServlet {

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

        try {
            String email = request.getParameter("email");
            String name = request.getParameter("name");

            Connection cn = CreateConnection.getConnection();
            Statement smt = cn.createStatement();
            int i = smt.executeUpdate("delete from booknow where email='" + email + "'");
            if (i > 0) {
                String to = email;
                String sub = "Vehicle Valley";

                String msg = "Hello " + name + ",\n\nWe are sorry to inform you that your booking request to rent a vehicle has been cancelled.\n\nPlease book the vehicle again if you wish to proceed.\n\nIf you have any questions or need assistance, feel free to contact us.\n\nBest regards,\nVehicle Valley Team";

                // Call your Mail.send() method here
                Mail.send(to, sub, msg);

                RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
                rd.include(request, response);
            }
//            smt.executeUpdate("SET @newSerial:=0");
//            smt.executeUpdate("UPDATE booknow SET id = @newSerial:=@newSerial+1 ORDER BY id");

            CreateConnection.closeConnection();

        } catch (Exception e) {
            out.println(e.getMessage());
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