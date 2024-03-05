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
public class AdminLoginSign extends HttpServlet {

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
            case "admin":
                admin(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "updatelogout":
                updatelogout(request, response);
                break;
            default:
                response.getWriter().println("Invalid action");
        }
    }

    private void admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle login logic here
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Load the driver class
            Connection cn = CreateConnection.getConnection();
            
            //Make the statement object
            Statement smt = cn.createStatement();

            //execute query
            ResultSet rs = smt.executeQuery("select * from admin where email='" + email + "'and password='" + password + "'");

            if (rs.next()) {
                // Taking name from db;
                String name = rs.getString("name");
                String id = rs.getString("id");
                String mobile = rs.getString("mobile");
                String gender = rs.getString("gender");

                // Session
                HttpSession hs = request.getSession(true);
                hs.setAttribute("email", email);
                hs.setAttribute("password", password);
                hs.setAttribute("id", id);
                hs.setAttribute("name", name);
                hs.setAttribute("gender", gender);
                hs.setAttribute("mobile", mobile);
//                RequestDispatcher rd = request.getRequestDispatcher("Home");
//                rd.forward(request, response);
                response.sendRedirect("adminhome.jsp");
            } else {
                HttpSession hs = request.getSession(false);
                String mess = "Invalid Email or Password";
                hs.setAttribute("lerrmess", mess);
                RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                rd.forward(request, response);
            }

            CreateConnection.closeConnection();

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle sign-up logic here
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession hs = request.getSession();

        // Set logout message before invalidating the session
        String mess = "Logout Successfully...";
        hs.setAttribute("register", mess);

        // Redirect to login page
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
        // response.sendRedirect("login.jsp");
        // Invalidate Session
        hs.invalidate();

        // response.sendRedirect("login.jsp");
    }

    private void updatelogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle sign-up logic here
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession hs = request.getSession();

        // Set logout message before invalidating the session
        String mess = "To see Updated Details. Login Again..";
        hs.setAttribute("register", mess);

        // Redirect to login page
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
        // response.sendRedirect("login.jsp");
        // Invalidate Session
        hs.invalidate();

        // response.sendRedirect("login.jsp");
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
