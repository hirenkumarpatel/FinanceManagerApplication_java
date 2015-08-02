<%-- 
    Document   : new-transaction
    Created on : 30-Jul-2015, 1:58:49 PM
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
                        <li class="active">
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
                                            <li><a href="#">Transaction</a></li>
                                            <li class="active">New Transaction</li>
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
                    <%                        String msg = request.getParameter("error");
                        if (msg == null) {
                            msg = "";
                        } else {
                            msg = "<div class='col-lg-8'>"
                                    + "<div class='bs-component'>"
                                    + " <div class='alert alert-dismissible alert-danger'>"
                                    + "<strong>Error!</strong> " + msg
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

                    <%=successmsg%>
                    <%=msg%>
                    <div class="col-lg-8">





                        <div class="well bs-component">
                            <form class="form-horizontal" method="post" action="NewTransaction">
                                <fieldset>
                                    <legend>New Transaction</legend>
                                    <div class="form-group">
                                        <label for="txtTransactionDesc" class="col-lg-4 control-label">Transaction Desc</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtTransactionDesc" placeholder="Transaction Description" name="txtTransactionDesc">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtTransactionAmount" class="col-lg-4 control-label">Transaction Amount</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtTransactionAmount" placeholder="Transaction Amount" name="txtTransactionAmount">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtTransactionDate" class="col-lg-4 control-label">Date</label>
                                        <div class="col-lg-6">
                                            <input type="date" class="form-control" id="txtTransactionDate" name="txtTransactionDate" >
                                        </div>
                                        <input type="hidden" name="userEmail" value="<%=userEmail%>">
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-4 control-label">Transaction Flow</label>
                                        <div class="col-lg-6">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="transactionFlow" id="optionsRadios1" value="I" >
                                                    InFlow
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="transactionFlow" id="optionsRadios2" value="E" checked="">
                                                    OutFlow
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="sltAccount" class="col-lg-4 control-label">Select Account</label>
                                        <div class="col-lg-6">
                                            <select class="form-control" id="sltAccount" name="sltAccount">

                                                <%
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
                                                <option value="<%=result.getInt(1)%>" selected='selected'><%=result.getString(2)%></option>
                                                <%
                                                        }
                                                        conn.close();
                                                    } catch (SQLException ex) {
                                                        //Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                                                    }

                                                %>


                                            </select>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="sltCategory" class="col-lg-4 control-label">Select Category</label>
                                        <div class="col-lg-6">
                                            <select class="form-control" id="sltCategory" name="sltCategory">

                                                <%                                                    try {
                                                        Connection conn = Credential.getConnection();
                                                        if (conn != null) {
                                                            //writer.println("database connection successful.");

                                                        }

                                                        String query = "select category_id,category_name from categories where user_email=? ";
                                                        PreparedStatement pstmt = conn.prepareStatement(query);
                                                        pstmt.setString(1, userEmail);

                                                        ResultSet result = pstmt.executeQuery();

                                                        while (result.next()) {
                                                %>
                                                <option value="<%=result.getInt(1)%>" selected='selected' ><%=result.getString(2)%></option>
                                                <%
                                                        }
                                                        conn.close();
                                                    } catch (SQLException ex) {
                                                        //Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
                                                    }

                                                %>


                                            </select>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-4">
                                            <button type="reset" class="btn btn-default">Cancel</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
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

