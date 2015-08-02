/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import static Database.Credential.getConnection;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObjectBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;

/**
 * REST Web Service
 *
 * @author Hiren Patel
 */
@Path("transactions")
public class TransactionsReports {

    JsonObjectBuilder json = Json.createObjectBuilder();
    JsonArrayBuilder transactionJsonArray = Json.createArrayBuilder();
    
    @Context
    private UriInfo context;

    /**
     * Creates a new instance of TransactionsReports
     */
    public TransactionsReports() {
    }

    /**
     * Retrieves representation of an instance of classes.TransactionsReports
     *
     * @return an instance of java.lang.String
     */
    /*  @GET
     @Produces("application/json")
     public String getJson() {
     //TODO return proper representation object
     return "jax rs called";
     // throw new UnsupportedOperationException();
     }
    
     */
    /**
     * Retrieves representation of an instance of classes.TransactionsReports
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Path("/account")
    @Produces("application/json")
    public String getTransactions(@Context HttpServletRequest reqest) throws SQLException {
        Connection conn = getConnection();
        if (conn == null) {
            //return "database connection error";
        }
        
        HttpSession session=reqest.getSession();
        String userEmail=(String) session.getAttribute("user");

        String query = "select t.account_id,c.category_name, sum(t.tran_amount)as \"amount\" from transactions t, categories c where t.user_email=? and t.category_id=c.category_id and t.tran_flow='I' and t.account_id=2 group by c.category_id";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userEmail);

        ResultSet result = pstmt.executeQuery();

        while (result.next()) {
            json = Json.createObjectBuilder()
                    .add("categoryName", result.getString("category_name"))
                    .add("amount", result.getString("amount"));
                  transactionJsonArray.add(json);

        }
        conn.close();
        String transactionJsonString = transactionJsonArray.build().toString();
        return transactionJsonString;
    }

    /**
     * PUT method for updating or creating an instance of TransactionsReports
     *
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("application/json")
    public void putJson(String content) {
    }
}
