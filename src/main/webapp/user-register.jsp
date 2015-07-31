<%-- 
    Document   : user-register
    Created on : 28-Jul-2015, 12:50:56 AM
    Author     : Hiren Patel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>






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
        <!-- register-form -->	

        <%
            String msg = request.getParameter("error");
            if (msg == null) {
                msg="";
            }
            else
            {
                msg="<div class='error-msg'><h3>"+msg+"</h3></div>";
            }
        %>



        <div class="message warning">
          <%=msg%>
            <div class="inset">
                <div class="login-head">
                    <h1>Register Form</h1>
                    <div class="alert-close"> </div> 			
                </div>
                <form method="post" action="RegisterUser">
                    <li>
                        <input type="text" class="text" placeholder="User Name" name="txtUserName"><a href="#" class=" icon user"></a>
                    </li>
                    <li>
                        <input type="text" class="text" placeholder="Email Address" name="txtEmailAddress" ><a href="#" class=" icon user"></a>
                    </li>
                    <div class="clear"> </div>
                    <li>
                        <input type="password" Placeholder="Password" name="txtPassword"> <a href="#" class="icon lock" ></a>
                    </li>

                    <li>
                        <input type="password" Placeholder="Confirm Password" name="txtConfirmPassword"> <a href="#" class="icon lock"></a>
                    </li>
                    <div class="clear"> </div>
                    <div class="submit">
                        <input type="submit"  value="Register" >

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
