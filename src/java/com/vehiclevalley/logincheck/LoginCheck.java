/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vehiclevalley.logincheck;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author neera
 */
public class LoginCheck {

    public static void checklogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        // Profile Login Or Not
        try {
            // Session
            HttpSession hs = request.getSession(false);
            String email = (String) hs.getAttribute("email");

            if (email == null) {
                String profileLog = "Please Login First.";
                hs.setAttribute("lerrmess", profileLog);
                // request.setAttribute("lerrmess", profileLog);
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            out.println(e);
            response.sendRedirect("index.jsp");
        }
    }
}
