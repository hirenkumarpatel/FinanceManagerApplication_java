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

                        <li class="active">
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
                                            <li><a href="#">Accounts</a></li>
                                            <li class="active">New Account</li>
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
                    <% 
                        String msg = request.getParameter("error");
                        String successmsg = request.getParameter("success");
                        if (msg == null) {
                            msg = "";
                        } else {
                            msg = "<div class='col-lg-8'>"
                                    + "<div class='bs-component'>"
                                    + " <div class='alert alert-dismissible alert-danger'>"
                                    + "<strong>Error!</strong> " + msg
                                    + "</div></div></div>";

                        }
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





                        <div class="well bs-component">
                            <form class="form-horizontal" method="post" action="NewAccount">
                                <fieldset>
                                    <legend>New Account</legend>
                                    <div class="form-group">
                                        <label for="txtAccountName" class="col-lg-4 control-label">Account Name</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtAccountName" placeholder="Acount Name" name="txtAccountName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtAccountBalance" class="col-lg-4 control-label">Initial Balance</label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="txtAccountBalance" placeholder="Initial Balance" name="txtAccountBalance">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtAccountDate" class="col-lg-4 control-label">Date</label>
                                        <div class="col-lg-6">
                                            <input type="date" class="form-control" id="txtAccountDate" name="txtAccountDate" >
                                        </div>
                                        <input type="hidden" name="userEmail" value="<%=userEmail%>">
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

