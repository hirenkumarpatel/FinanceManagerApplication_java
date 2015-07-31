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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "NewTransaction", urlPatterns = {"/NewTransaction"})
public class NewTransaction extends HttpServlet {

   

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
            out.println("<title>Servlet NewTransaction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewTransaction at " + request.getContextPath() + "</h1>");
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
       //String jsonString= getTransactionsByAccount(request, response);
       
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
        newTransaction(request, response);
    }

    public void newTransaction(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int accountId;
        String transactionDesc;
        int categoryId;
        String userEmail;
        String transactionAmount;
        String transactionDate;
        String transactionFlow;

        PrintWriter writer = response.getWriter();

        transactionDesc = request.getParameter("txtTransactionDesc");
        userEmail = request.getParameter("userEmail");
        transactionAmount = request.getParameter("txtTransactionAmount");
        transactionDate = request.getParameter("txtTransactionDate");
        accountId = Integer.parseInt(request.getParameter("sltAccount"));
        transactionFlow = request.getParameter("transactionFlow");
        categoryId = Integer.parseInt(request.getParameter("sltCategory"));

        writer.println(transactionDesc + " " + userEmail + " " + transactionAmount + " " + transactionDate + " " + accountId + " " + transactionFlow + " " + categoryId);

        if (transactionDesc.isEmpty() || userEmail.isEmpty() || transactionAmount.isEmpty() || transactionDate.isEmpty()) {
            response.sendRedirect("new-transaction.jsp?error=please enter all details");
        } else {
            int intTransactionBalance = 0;
            boolean isDigit = true;
            for (int i = 0; i < transactionAmount.length(); i++) {

                char ch = transactionAmount.charAt(i);
                if (!Character.isDigit(ch)) {
                    isDigit = false;
                }
            }
            if (isDigit == false) {
                response.sendRedirect("new-transaction.jsp?error=please enter valid amount");
            } else {

                intTransactionBalance = Integer.parseInt(transactionAmount);
                try {
                    Connection conn = Credential.getConnection();
                    if (conn != null) {
                        writer.println("database connection successful.");

                    }

                    String query = "insert into transactions(tran_desc,tran_amount,tran_date,account_id,tran_flow,category_id,user_email) values (?,?,?,?,?,?,?)";

                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, transactionDesc);
                    pstmt.setInt(2, intTransactionBalance);
                    pstmt.setString(3, transactionDate);
                    pstmt.setInt(4, accountId);
                    pstmt.setString(5, transactionFlow);
                    pstmt.setInt(6, categoryId);
                    pstmt.setString(7, userEmail);
                    pstmt.execute();
                    conn.close();

                    response.sendRedirect("home.jsp?success=New Transaction successfully inserted.");
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
