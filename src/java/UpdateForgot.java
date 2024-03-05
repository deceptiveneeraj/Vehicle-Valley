/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.vehiclevalley.Mail;
import com.vehiclevalley.connection.CreateConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
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
public class UpdateForgot extends HttpServlet {

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
            int i = smt.executeUpdate("update user set name='" + name + "',email='" + email + "',mobile='" + mobile + "' where id=" + id);

            if (i > 0) {
                // out.println("Data update");
                
                // Mailing Start -------------------------------
                String to = email;
                String sub = "Vehicle Valley";

                String msg = "Hello " + name + ",\n\nYour profile information has been successfully updated with Vehicle Valley.\n\nIf you have any further queries or concerns, feel free to contact us.\n\nBest regards,\nVehicle Valley Team";

                // Call your Mail.send() method here
                Mail.send(to, sub, msg);
                // Mailing End ---------------------------------
                
                RequestDispatcher rd = request.getRequestDispatcher("LoginSignup?action=updatelogout");
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

            Connection cn = CreateConnection.getConnection();

            //Make the statement object
            Statement smt = cn.createStatement();

            //execute query
            ResultSet rs = smt.executeQuery("select * from user where email='" + email + "'");

            if (rs.next()) {
                // Taking name from db;
                String name = rs.getString("name");

                // Session
                HttpSession hs = request.getSession(false);
                hs.setAttribute("email", email);
                hs.setAttribute("name", name);

                // Random Number Generate
                // Generating a random six-digit integer
                Random random = new Random();
                int randomNumber = 100000 + random.nextInt(900000);

                // Mailing Start -------------------------------
                String to = email;
                String sub = "Vehicle Valley";
                // Generate a random OTP here
                // int randomNumber = 123456; // Replace with your random OTP generation logic

                String msg = "Hello "+name+",\n\nThank you for choosing Vehicle Valley. As part of our security measures, we are sending you an OTP (One-Time Password) to verify your account.\n\nYour OTP is: [" + randomNumber + "]\n\nPlease enter this code in the verification field to complete the registration process.\n\nIf you did not request this verification code, please ignore this email.\n\nBest regards,\nVehicle Valley Team";

                // Call your Mail.send() method here
                Mail.send(to, sub, msg);
                String mess = "OTP Send On Your Email.<br> Check Email";
                hs.setAttribute("smail", mess);
                // Mailing End ---------------------------------

                hs.setAttribute("otp", randomNumber);
                RequestDispatcher rd = request.getRequestDispatcher("forgototp.jsp");
                rd.include(request, response);
                // response.sendRedirect("index.jsp");
            } else {
                HttpSession hs = request.getSession(false);
                String mess = "Invalid Email <br> Please Enter Only Registered Email";
                hs.setAttribute("emailinvalid", mess);
                RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
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

//            out.println(email);
//            out.println(password);
            
            Connection cn = CreateConnection.getConnection();
            
            //Make the statement object
            Statement smt = cn.createStatement();

            // execute query
            int i = smt.executeUpdate("update user set password='" + password + "' where email='" + email + "'");

            if (i > 0) {
                HttpSession hs = request.getSession(false);

                // Set logout message before invalidating the session
                String mess = "Password Updated Successfully.";
                hs.setAttribute("register", mess);

                // Redirect to login page
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
