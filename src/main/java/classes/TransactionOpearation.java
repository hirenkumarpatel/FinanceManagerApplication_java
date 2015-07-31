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
@WebServlet(name = "TransactionOpearation", urlPatterns = {"/TransactionOpearation"})
public class TransactionOpearation extends HttpServlet {

    ArrayList<Transaction> transactionList = new ArrayList<Transaction>();

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
            out.println("<title>Servlet TransactionOpearation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactionOpearation at " + request.getContextPath() + "</h1>");
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
        int accountId = Integer.parseInt(request.getParameter("account"));
        getTransactionsByAccount(request, response, accountId);
    }

    public ArrayList getTransactionsByAccount(HttpServletRequest request, HttpServletResponse response, int accountId) throws IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("user");

        PrintWriter writer = response.getWriter();
        writer.println(userEmail);
        String resultString;
        try {
            Connection conn = Credential.getConnection();
            if (conn != null) {
                //writer.println("database connection successful.");

            }

            String query = "select t.*,c.category_name from transactions t, categories c where t.user_email=? and t.category_id=c.category_id and t.account_id=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userEmail);
            pstmt.setInt(2, accountId);

            ResultSet result = pstmt.executeQuery();

            while (result.next()) {

                Transaction transaction = new Transaction(result.getInt("tran_id"), result.getString("tran_desc"), result.getString("tran_date"), result.getInt("tran_amount"), result.getInt("category_id"), result.getString("tran_flow"), result.getInt("category_id"), result.getString("user_email"));
                transactionList.add(transaction);

            }

            conn.close();
            RequestDispatcher dispatcher = request.getRequestDispatcher("reports.jsp");
            request.setAttribute("transactionList", transactionList);
            dispatcher.forward(request, response);

        } catch (SQLException ex) {
            //return ex.getMessage();
        } catch (Exception ex) {
            //return ex.getMessage();
        }

        return transactionList;

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
