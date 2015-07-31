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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hiren Patel
 */
@WebServlet(name = "NewAccount", urlPatterns = {"/NewAccount"})
public class NewAccount extends HttpServlet {

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
            out.println("<title>Servlet NewAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewAccount at " + request.getContextPath() + "</h1>");
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
        newAccount(request, response);
    }

    public void newAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accountName;
        String userEmail;
        String accountBalance;
        String accountDate;

        PrintWriter writer = response.getWriter();

        accountName = request.getParameter("txtAccountName");
        userEmail = request.getParameter("userEmail");
        accountBalance = request.getParameter("txtAccountBalance");
        accountDate = request.getParameter("txtAccountDate");

        if (accountName.isEmpty() || userEmail.isEmpty() || accountBalance.isEmpty() || accountDate.isEmpty()) {
            response.sendRedirect("new-account.jsp?error=please enter all details");
        } else {
            int intAccountBalance = 0;
            boolean isDigit = true;
            for (int i = 0; i < accountBalance.length(); i++) {

                char ch = accountBalance.charAt(i);
                if (!Character.isDigit(ch)) {
                    isDigit = false;
                }
            }
            if (isDigit == false) {
                response.sendRedirect("new-account.jsp?error=please enter valid balance");
            } else {
                    
                intAccountBalance=Integer.parseInt(accountBalance);
                try {
                    Connection conn = Credential.getConnection();
                    if (conn != null) {
                        writer.println("database connection successful.");

                    }

                    String query = "insert into accounts(account_name,account_amount,account_date,user_email) values (?,?,?,?)";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, accountName);
                    pstmt.setInt(2, intAccountBalance);
                    pstmt.setString(3, accountDate);
                    pstmt.setString(4, userEmail);
                    pstmt.execute();
                    conn.close();
                    
                    
                    response.sendRedirect("home.jsp?success=New Account successfully inserted.");
                } catch (SQLException ex) {
                    Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                    writer.println(ex.getMessage());
                }
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
