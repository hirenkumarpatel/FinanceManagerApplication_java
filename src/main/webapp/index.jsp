<%-- 
    Document   : index
    Created on : 28-Jul-2015, 12:54:36 AM
    Author     : Hiren Patel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session=request.getSession();
    /*if(!session.isNew())
    {
        RequestDispatcher dispatcher= request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
        
        
    }
            */
    
%>


<!DOCTYPE HTML>
<html>
    <head>
        <title>Login| Finance manager</title>
        <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
        <link href="css/login_style.css" rel="stylesheet" type="text/css" media="all" />
        
         
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 

    </head>
    <body>
        <!-- contact-form -->	
        <div class="message warning"> 
            <%
                String msg = request.getParameter("error");
                if (msg == null) {
                    msg = "";
                } else {
                    msg = "<div class='error-msg'><h3>" + msg + "</h3></div>";
                }
            %>
            <div class="inset">
                <%=msg%>
                <div class="login-head">
                    <h1>Login Form</h1>
                    <div class="alert-close"> </div> 			
                </div>
                <form method="post" action="UserLogin">
                    <ul>
                    <li>
                        <input type="text" class="text" placeholder="Email Address" name="txtEmailAddress" ><a href="#" class=" icon user"></a>
                    </li>
                    </ul>
                    <div class="clear"> </div>
                    <ul>
                    <li>
                        <input type="password" Placeholder="Password" name="txtPassword"> <a href="#" class="icon lock"></a>
                    </li>
                    </ul>
                    <div class="clear"> </div>
                    <div class="submit">
                        <input type="submit"  value="Sign in" >
                        <h4><a href="user-register.jsp" >New User</a></h4>
                        <div class="clear">  </div>
                    </div>

                </form>
            </div>	

        </div>


        <div class="clear"> </div>

        <!--- footer --->
        <div class="footer">

        </div>
    </body>
</html>
