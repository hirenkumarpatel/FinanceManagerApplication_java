/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hiren Patel
 */
public class Credential {
     public static Connection getConnection() {
        Connection conn = null;
        try {
          /*  Class.forName("com.mysql.jdbc.Driver");
            String jdbc = "jdbc:mysql://localhost/financemanager";
            String user = "root";
            String pass = "";
          */  
           
            
           Class.forName("com.mysql.jdbc.Driver");
            String jdbc = "jdbc:mysql://127.11.61.130:3306/financemanager";
            String user = "adminmPTYnAH";
            String pass = "NFCyQxDAMCHS";
                  
            
            conn = (Connection) DriverManager.getConnection(jdbc, user, pass);
            

        }
        catch (ClassNotFoundException ex)
        {
            System.err.println("No class found Exception" + ex.getMessage());
        }
        catch(SQLException ex)
        {
          System.err.println("SQL Exception" + ex.getMessage()); 
          System.out.println("SQL State:"+ex.getSQLState());
        }
        return conn;
    }
}
