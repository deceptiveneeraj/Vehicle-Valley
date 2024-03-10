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
public class AutoSell extends HttpServlet {

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
            case "sellinfo":
                sellinfo(request, response);
                break;
            case "autosellimg":
                autosellimg(request, response);
                break;

            default:
                response.getWriter().println("Invalid action");
        }
    }

    private void sellinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String vtype = request.getParameter("vtype");
            String sid = request.getParameter("sid");
            String cname = request.getParameter("cname");
            String vname = request.getParameter("vname");
            String ryear = request.getParameter("ryear");
            String mileage = request.getParameter("mileage");
            String trans = request.getParameter("trans");
            String ftype = request.getParameter("ftype");
            String eprice = request.getParameter("eprice");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String desc = request.getParameter("desc");

            HttpSession hs = request.getSession();
            String id = (String) hs.getAttribute("id");

            // Load the driver class
            Connection cn = CreateConnection.getConnection();

            // Prepare the statement
            String sql = "INSERT INTO autosell (vehicle_type, seller_id, company_name, vehicle_name, registration_year, mileage, transmission, fuel_type, expected_price, email, mobile, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, vtype);
            ps.setString(2, sid);
            ps.setString(3, cname);
            ps.setString(4, vname);
            ps.setString(5, ryear);
            ps.setString(6, mileage);
            ps.setString(7, trans);
            ps.setString(8, ftype);
            ps.setString(9, eprice);
            ps.setString(10, email);
            ps.setString(11, mobile);
            ps.setString(12, desc);

            // Execute the update
            int i = ps.executeUpdate();

            if (i > 0) {
                // out.println("Data inserted successfully.");
                // Redirect to autosellimg.jsp
                RequestDispatcher rd = request.getRequestDispatcher("autosellimg.jsp");
                rd.include(request, response);
            }

            // Rearrange serial number
            Statement smt = cn.createStatement();
            smt.executeUpdate("SET @newSerial:=0");
            smt.executeUpdate("UPDATE autosell SET id = @newSerial:=@newSerial+1 ORDER BY id");

        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    private void autosellimg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession hs = request.getSession();

        File file;
        int maxFileSize = 5000 * 1024;

        String filePath = "C:\\Users\\neera\\OneDrive\\Documents\\NetBeansProjects\\Vehicle Valley\\web\\assests\\images\\autosell\\";

        String contentType = request.getContentType();

        if (contentType != null && contentType.indexOf("multipart/form-data") >= 0) {
            try {
                // Create the connection
//                try (Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiclevalley", "root", ""); Statement smt = cn.createStatement()) {
                try (Connection cn = CreateConnection.getConnection(); Statement smt = cn.createStatement()) {

                    int vid = 1;
                    ResultSet rs = smt.executeQuery("SELECT MAX(id) FROM autosell");
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

                            String fn = "img" + vid + "." + ext;
                            file = new File(filePath + fn);
                            fi.write(file);

                            int ii = smt.executeUpdate("UPDATE autosell SET image_name='" + fn + "' WHERE id=" + vid);
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
