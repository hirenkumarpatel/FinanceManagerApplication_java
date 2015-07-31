<%-- 
    Document   : home
    Created on : 27-Jul-2015, 10:26:04 PM
    Author     : Hiren Patel
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Database.Credential"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String userEmail = (String) session.getAttribute("user");%>



<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Finance Manager</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="stylesheet" href="css/style.css" media="screen">
        <link rel="stylesheet" href="css/bootswatch.min" media="screen">

    </head>
    <body>
        <div class="navbar navbar-default navbar-fixed-top center-block">
            <div class="container">
                <div class="navbar-header">
                    <a href="home.jsp" class="navbar-brand">Finance Manager</a>

                </div>
                <div class="navbar-collapse collapse" id="navbar-main">
                    <ul class="nav navbar-nav">

                        <li>
                            <a href="new-account.jsp">Account</a>
                        </li>
                        <li>
                            <a href="new-category.jsp">Category</a>
                        </li>
                        <li>
                            <a href="new-transaction.jsp">Transaction</a>
                        </li>
                        
                        

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Logout"><%=userEmail%> (logout)</a></li>
                        </ul>

                </div>
            </div>
        </div>


        <div class="container">





            <!-- Forms
            ================================================== -->
            <div class="bs-docs-section">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Navs
               ================================================== -->
                        <div class="bs-docs-section">



                            <div class="row">


                                <div class="col-lg-12">
                                    <h2 id="nav-breadcrumbs">Breadcrumbs</h2>
                                    <div class="bs-component">
                                        <ul class="breadcrumb">
                                            <li><a href="home.jsp">Home</a></li>
                                            <li class="active"><a href="#">Accounts</a></li>
                                            
                                        </ul>
                                    </div>

                                </div>
                            </div>



                        </div>


                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="bs-component">
                            <div class="list-group">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="active"><a href="">Accounts</a></li>
                                </ul>
                                <%

                                    if (userEmail.isEmpty()) {
                                        response.sendRedirect("index.jsp?error=Please login to access Finance Manager.");
                                    } else {

                                        try {
                                            Connection conn = Credential.getConnection();
                                            if (conn != null) {
                                                //writer.println("database connection successful.");

                                            }

                                            String query = "select account_id,account_name from accounts where user_email=? ";
                                            PreparedStatement pstmt = conn.prepareStatement(query);
                                            pstmt.setString(1, userEmail);

                                            ResultSet result = pstmt.executeQuery();

                                            while (result.next()) {
                                 %>
                                <a href="view-account-detail.jsp?account=<%=result.getInt(1)%>" class="list-group-item ">
                                    <%= result.getString(2)%>
                                </a>
                                <%
                               

                                            }

                                            conn.close();

                                        } catch (SQLException ex) {
                                            //Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                                        }

                                    }


                                %>

                            </div>
                        </div>
                    </div>
                    
                   <!--  
                     
                     Inserting error or success msg here
                     
                     -->   
                     
                     <%
                  String msg = request.getParameter("error");
                if (msg == null) {
                    msg = "";
                } else {
                    msg = "<div class='col-lg-8'>"
                            + "<div class='bs-component'>"
                            + " <div class='alert alert-dismissible alert-danger'>"
                            + "<strong>Congrats!</strong> " + msg
                            + "</div></div></div>";
                }
                
                String successmsg = request.getParameter("success");
                if (successmsg == null) {
                    successmsg = "";
                } else {
                    successmsg = "<div class='col-lg-8'>"
                            + "<div class='bs-component'>"
                            + " <div class='alert alert-dismissible alert-success'>"
                            + "<strong>Congrats!</strong> " + successmsg
                            + "</div></div></div>";
                }

                    %>
                    <%=msg%>
                    <%=successmsg%>
                                
                    <div class="col-lg-8">


                        <div class="bs-component">
                            <table class="table table-striped table-hover ">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Description</th>
                                        <th>Category</th>
                                        <th>Inflow</th>
                                        <th>outflow</th>
                                    </tr>
                                </thead>
                                <tbody>


                                    <%
                                    double inflow=0,outflow=0;
                                    if (userEmail.isEmpty()) {
                                            //response.sendRedirect("index.jsp?error=Please login to access Finance Manager.");
                                        } else {

                                            try {
                                                Connection conn = Credential.getConnection();
                                                if (conn != null) {
                                                    //writer.println("database connection successful.");

                                                }
                                                SimpleDateFormat dateFormat
                                                        = new SimpleDateFormat("yyyy-MM-dd ");

                                                String query = "select t.*,c.category_name from transactions t, categories c where t.user_email=? and t.category_id=c.category_id";
                                                PreparedStatement pstmt = conn.prepareStatement(query);
                                                pstmt.setString(1, userEmail);

                                                ResultSet result = pstmt.executeQuery();

                                                while (result.next()) {
                                    %>
                                    <tr>
                                        <td><%=dateFormat.format(result.getDate(3))%></td>
                                        <td><%=result.getString(2)%></td>
                                        <td><%=result.getString(9)%></td>
                                        <%
                                            if (result.getString(6).equals("I")) {
                                                inflow+=result.getInt(4);
                                        %>
                                        <td>$<%=result.getString(4)%></td> 
                                        <td></td>
                                        <%
                                        } else {
                                                outflow+=result.getInt(4);
                                        %>
                                        <td></td>
                                        <td>$<%=result.getString(4)%></td> 

                                        <%
                                            }
                                        %>

                                    </tr>
                                    <%
                                                }

                                                conn.close();

                                            } catch (SQLException ex) {
                                                //Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                                            }

                                        }


                                    %>

                                            
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3">Total</th>
                                        <th>$<%=inflow%></th>
                                        <th>$<%=outflow%></th>
                                    </tr>
                                </tfoot>
                            </table> 
                        </div><!-- /example -->
                    </div>

                </div>
            </div>




            <footer>


            </footer>


        </div>


        <script src="js/jquery-1.10.2.min.js"></script>
       
        <script src="js/bootswatch.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>

