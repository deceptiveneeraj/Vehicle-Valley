/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.vehiclevalley.connection.CreateConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author neera
 */
public class Job extends HttpServlet {

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
            case "addjob":
                addjob(request, response);
                break;
            case "applyjob":
                applyjob(request, response);
                break;
            case "resume":
                resume(request, response);
                break;

            default:
                response.getWriter().println("Invalid action");
        }
    }

    private void addjob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String job_name = request.getParameter("job_name");
            String experience = request.getParameter("experience");
            String location = request.getParameter("location");
            String job_desc = request.getParameter("job_desc");
            
            HttpSession hs = request.getSession();

            // Load the driver class
            Connection cn = CreateConnection.getConnection();

            // Prepare the statement
            String sql = "INSERT INTO jobs (job_name, location, experience, job_description) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, job_name);
            ps.setString(2, location);
            ps.setString(3, experience);
            ps.setString(4, job_desc);

            // Execute the update
            int i = ps.executeUpdate();

            if (i > 0) {
                // out.println("Data inserted successfully.");
                // Redirect to autosellimg.jsp
                RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
                rd.include(request, response);
            }

            // Rearrange serial number
            Statement smt = cn.createStatement();
            smt.executeUpdate("SET @newSerial:=0");
            smt.executeUpdate("UPDATE jobs SET id = @newSerial:=@newSerial+1 ORDER BY id");

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
    
    private void applyjob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String job_title = request.getParameter("jobtitle");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String experience = request.getParameter("experience");
            
            HttpSession hs = request.getSession();

            // Load the driver class
            Connection cn = CreateConnection.getConnection();

            // Prepare the statement
            String sql = "INSERT INTO job_application (job_title, name, email, mobile, experience) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, job_title);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, experience);

            // Execute the update
            int i = ps.executeUpdate();

            if (i > 0) {
                // out.println("Data inserted successfully.");
                // Redirect to autosellimg.jsp
                RequestDispatcher rd = request.getRequestDispatcher("resume.jsp");
                rd.include(request, response);
            }

            // Rearrange serial number
            // Statement smt = cn.createStatement();
            // smt.executeUpdate("SET @newSerial:=0");
            // smt.executeUpdate("UPDATE job_application SET id = @newSerial:=@newSerial+1 ORDER BY id");

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    private void resume(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession hs = request.getSession();

        File file;
        int maxFileSize = 5000 * 1024;

        String filePath = "C:\\Users\\neera\\OneDrive\\Documents\\NetBeansProjects\\Vehicle Valley\\web\\assests\\resume\\";

        String contentType = request.getContentType();

        if (contentType != null && contentType.indexOf("multipart/form-data") >= 0) {
            try {
                // Create the connection
//                try (Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclevalley", "root", ""); Statement smt = cn.createStatement()) {
                try (Connection cn = CreateConnection.getConnection(); Statement smt = cn.createStatement()) {

                    int rid = 1;
                    ResultSet rs = smt.executeQuery("SELECT MAX(id) FROM job_application");
                    if (rs.next()) {
                        rid = rs.getInt(1);
                    }

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(maxFileSize);
                    factory.setRepository(new File("C://Temp"));
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    upload.setSizeMax(maxFileSize);

                    List<FileItem> fileItems = upload.parseRequest(request);
                    Iterator<FileItem> i = fileItems.iterator();

                    while (i.hasNext()) {
                        FileItem fi = i.next();
                        if (!fi.isFormField()) {
                            String fileName = fi.getName();
                            String[] ss = fileName.split("\\.");
                            int index = ss.length;
                            String ext = ss[index - 1];

                            String fn = "resume" + rid + "." + ext;
                            file = new File(filePath + fn);
                            fi.write(file);

                            int ii = smt.executeUpdate("UPDATE job_application SET resume='" + fn + "' WHERE id=" + rid);
                            if (ii >= 0) {
                                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                                rd.include(request, response);
                            } else {
                                out.println("<h1>Image Not Insert</h1>");
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        } else {
            out.println("<h1>No file uploaded</h1>");
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
