/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.vehiclevalley.connection.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class AdminUpdateForgot extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.getWriter().println("No action specified");
            return;
        }

        switch (action) {
            case "updateinfo":
                updateinfo(request, response);
                break;
            case "forgot":
                forgot(request, response);
                break;
            case "updatepass":
                updatepass(request, response);
                break;
            default:
                response.getWriter().println("Invalid action");
        }
    }

    private void updateinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle login logic here
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");

            // Load the driver class
            Connection cn = CreateConnection.getConnection();
            
            //Make the statement object
            Statement smt = cn.createStatement();

            // execute query
            int i = smt.executeUpdate("update admin set name='" + name + "',email='" + email + "',mobile='" + mobile + "' where id=" + id);

            if (i > 0) {
                // out.println("Data update");
                RequestDispatcher rd = request.getRequestDispatcher("AdminLoginSign?action=updatelogout");
                rd.forward(request, response);
            }
            CreateConnection.closeConnection();

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    private void forgot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle login logic here
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("email");

            // Load the driver class
            Connection cn = CreateConnection.getConnection();
            
            //Make the statement object
            Statement smt = cn.createStatement();

            //execute query
            ResultSet rs = smt.executeQuery("select * from admin where email='" + email + "'");

            if (rs.next()) {
                // Taking name from db;
                String name = rs.getString("name");

                // Session
                HttpSession hs = request.getSession(true);
                hs.setAttribute("email", email);
                hs.setAttribute("name", name);
                RequestDispatcher rd = request.getRequestDispatcher("adminupdatepass.jsp");
                rd.include(request, response);
                // response.sendRedirect("index.jsp");
            } else {
                HttpSession hs = request.getSession(true);
                String mess = "Invalid Email";
                hs.setAttribute("emailinvalid", mess);
                RequestDispatcher rd = request.getRequestDispatcher("adminforgot.jsp");
                rd.forward(request, response);
            }

            CreateConnection.closeConnection();

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    private void updatepass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle login logic here
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            out.println(email);
            out.println(password);
            // Load the driver class
            Connection cn = CreateConnection.getConnection();
            
            //Make the statement object
            Statement smt = cn.createStatement();

            // execute query
            int i = smt.executeUpdate("update admin set password='" + password + "' where email='" + email + "'");

            if (i > 0) {
                HttpSession hs = request.getSession();

                // Set logout message before invalidating the session
                String mess = "Password Updated Successfully.";
                hs.setAttribute("register", mess);

                // Redirect to login page
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
                hs.invalidate();
            }
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
