/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Database.Credential;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hiren Patel
 */
@WebServlet(name = "RegisterUser", urlPatterns = {"/RegisterUser"})
public class RegisterUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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

        String userName;
        String userEmail;
        String userPassword;
        String userConPassword;

        PrintWriter writer = response.getWriter();

        userName = request.getParameter("txtUserName");
        userEmail = request.getParameter("txtEmailAddress");
        userPassword = request.getParameter("txtPassword");
        userConPassword = request.getParameter("txtConfirmPassword");

        if (userName.isEmpty() || userEmail.isEmpty() || userPassword.isEmpty() || userConPassword.isEmpty()) {
            response.sendRedirect("user-register.jsp?error=please enter all details");
        } else if (!userPassword.equals(userConPassword)) {
            writer.print("password not match");
            response.sendRedirect("user-register.jsp?error=Your Password and confirm Password does not match.");
        } else {

            writer.print("<h2>Name: </h2>" + userName + "<br>"
                    + "<h2>Email: </h2>" + userEmail + "<br>"
                    + "<h2>Password: </h2>" + userPassword + "<br>"
                    + "<h2>conPassword: </h2>" + userConPassword + "<br>");

            try {
                Connection conn = Credential.getConnection();
                if (conn != null) {
                    writer.println("database connection successful.");

                }

                String query = "insert into users(user_name,user_email,user_password) values (?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, userName);
                pstmt.setString(2, userEmail);
                pstmt.setString(3, userPassword);
                pstmt.execute();
                conn.close();
                System.out.println("User Inserted");
            } catch (SQLException ex) {
                Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

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
