/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import Database.Credential;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hiren Patel
 */
@WebServlet(name = "UserLogin", urlPatterns = {"/UserLogin"})
public class UserLogin extends HttpServlet {

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
            out.println("<title>Servlet UserLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserLogin at " + request.getContextPath() + "</h1>");
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

        
        String userEmail=null;
        String userPassword=null;
        

        PrintWriter writer = response.getWriter();

        
        userEmail = request.getParameter("txtEmailAddress");
        userPassword = request.getParameter("txtPassword");
        
        

        if ( userEmail.isEmpty() || userPassword.isEmpty()) {
            response.sendRedirect("index.jsp?error=please enter all details");
        }
        else {


            try {
                Connection conn = Credential.getConnection();
                if (conn != null) {
                    writer.println("database connection successful.");

                }
                else
                {
                    writer.println("database connection failed.");
                }

               String query = "select user_email from users where user_email=? and user_password=?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, userEmail);
                pstmt.setString(2, userPassword);
                ResultSet result = pstmt.executeQuery();
               
                String  newUserEmail=null;
                while (result.next()) {
                   
                    newUserEmail = result.getString(1);
                     writer.println("new user email in result :"+newUserEmail);
                }
              
                if ( newUserEmail.equals(userEmail)) {
                    writer.println("new user email :"+newUserEmail);
                    HttpSession session = request.getSession();
                    session.setAttribute("user",newUserEmail);
                    //response.sendRedirect("home.jsp");
                    RequestDispatcher dispatcher= request.getRequestDispatcher("home.jsp");
                    dispatcher.forward(request, response);
                }
                else
                {
                    writer.println("Invalid user name or password");
                    //response.sendRedirect("index.jsp?error=Invalid Email Address or password!");
                }
              conn.close();  

            } catch (SQLException ex) {
                 writer.println("sql error"+ex.getMessage());
                Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
            }
            catch(Exception ex)
            {
                writer.println("other exception"+ex.getMessage());
                
            }
            writer.close();
            
        };
  
        

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
