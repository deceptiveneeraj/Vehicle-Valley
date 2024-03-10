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
public class BookNow extends HttpServlet {

    String email, name;

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
            case "book":
                book(request, response);
                break;
            case "license":
                license(request, response);
                break;

            default:
                response.getWriter().println("Invalid action");
        }
    }

    private void book(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            name = request.getParameter("name");
            email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String start_date = request.getParameter("start_date");
            String start_time = request.getParameter("start_time");
            String end_date = request.getParameter("end_date");
            String end_time = request.getParameter("end_time");
            String city = request.getParameter("city");
            String descrip = request.getParameter("descrip");

            HttpSession hs = request.getSession();
            String id = (String) hs.getAttribute("id");

            // Load the driver class
            Connection cn = CreateConnection.getConnection();

            // Prepare the statement
            String sql = "INSERT INTO booknow (name, email, mobile, start_date, start_time, end_date, end_time, city, vehicle_info) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, start_date);
            ps.setString(5, start_time);
            ps.setString(6, end_date);
            ps.setString(7, end_time);
            ps.setString(8, city);
            ps.setString(9, descrip);

            // Execute the update
            int i = ps.executeUpdate();

            if (i > 0) {
                // out.println("Data inserted successfully.");
                // Redirect to autosellimg.jsp
                RequestDispatcher rd = request.getRequestDispatcher("license.jsp");
                rd.include(request, response);
            }

            // Rearrange serial number
//            Statement smt = cn.createStatement();
//            smt.executeUpdate("SET @newSerial:=0");
//            smt.executeUpdate("UPDATE booknow SET id = @newSerial:=@newSerial+1 ORDER BY id");

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    private void license(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession hs = request.getSession();

        File file;
        int maxFileSize = 5000 * 1024;

        String filePath = "C:\\Users\\neera\\OneDrive\\Documents\\NetBeansProjects\\Vehicle Valley\\web\\assests\\images\\license\\";

        String contentType = request.getContentType();

        if (contentType != null && contentType.indexOf("multipart/form-data") >= 0) {
            try {
                // Create the connection
//                try (Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclevalley", "root", ""); Statement smt = cn.createStatement()) {
                Connection cn = CreateConnection.getConnection();
                Statement smt = cn.createStatement();

                int vid = 1;
                ResultSet rs = smt.executeQuery("SELECT MAX(id) FROM booknow");
                if (rs.next()) {
                    vid = rs.getInt(1);
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

                        String fn = "licenseimg" + vid + "." + ext;
                        file = new File(filePath + fn);
                        fi.write(file);

                        int ii = smt.executeUpdate("UPDATE booknow SET license='" + fn + "' WHERE id=" + vid);
                        if (ii >= 0) {
                            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                            rd.include(request, response);
                        } else {
                            out.println("<h1>Image Not Insert</h1>");
                        }
                    }
                }

                String to = email;
                String sub = "Vehicle Valley";

                String msg = "Hello " + name + ",\n\nYour booking request to rent a vehicle has been successfully sent to Vehicle Valley Team. We will contact you within 1 hour.\n\nIf you have any questions or need assistance, feel free to contact us.\n\nBest regards,\nVehicle Valley Team";

                // Call your Mail.send() method here
                Mail.send(to, sub, msg);

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
