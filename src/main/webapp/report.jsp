<%-- 
    Document   : report
    Created on : 1-Aug-2015, 10:23:39 PM
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/transaction-ajax.js"></script>
       

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
                        <li>
                            <a href="report.jsp">Reports</a>
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
                                            <li class="active"><a href="#">Report</a></li>
                                            
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
                                    <li class="active"><a href="">Reports</a></li>
                                </ul>
                                <a href="#" class="list-group-item " id="account">
                                    Account Report
                                </a>
                                <a href="#" class="list-group-item " id="date-report">
                                    Date Report
                                </a>
                                
                                

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


                        <div class="bs-component" id="ajax-div">
                            <table class="table table-striped table-hover " >
                                <thead id="ajax-table-head">
                                    
                                </thead>
                                <tbody id="ajax-table-body">


                                    
                                            
                                </tbody>
                                <tfoot id="ajax-table-footer">
                                    
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

