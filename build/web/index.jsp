<%-- 
    Document   : index
    Created on : Nov 27, 2014, 6:26:41 PM
    Author     : sumitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Tangle</title>
                <style type="text/css">
                    .rightcorn {
                        margin: 10px 30px auto;
}
#login {
        margin: 10px 10px auto;
	width: 400px;
        height: 500px;
}

#login h2 {
	background-color: #f95252;
	-webkit-border-radius: 20px 20px 0 0;
	-moz-border-radius: 20px 20px 0 0;
	border-radius: 20px 20px 0 0;
	color: #fff;
	font-size: 28px;
	padding: 20px 26px;
        width: 357px;
}

#login h2 span[class*="fontawesome-"] {
	margin-right: 14px;
}

#login fieldset {
	background-color: #F5ECCE;
	-webkit-border-radius: 0 0 20px 20px;
	-moz-border-radius: 0 0 20px 20px;
	border-radius: 0 0 20px 20px;
	padding: 20px 26px;
}

#login fieldset p {
	color: #777;
	margin-bottom: 14px;
}

#login fieldset p:last-child {
	margin-bottom: 0;
}

#login fieldset input {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#login fieldset input[type="text"], #login fieldset input[type="password"] {
	background-color: #eee;
	color: #777;
	padding: 4px 10px;
	width: 328px;
}

#login fieldset input[type="submit"]  {
	background-color: #33cc77;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 100px;
}

#login fieldset input[type="submit"] :hover {
	background-color: #28ad63;
}

#login fieldset input[type="button"]{
	background-color: #33cc77;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 100px;
	text-decoration: none;


}

#login fieldset input[type="button"]:hover {
	background-color: #28ad63;
	display: block;
	text-decoration: none;

}
.det {
    margin-top: -180px;
}
.leftcorn {

}
        </style>

        </head>
    <body>
        <img src="images/logo.PNG" alt="logo" height="100" width="210">
        <div class="rightcorn">
        <%
        HttpSession ses=request.getSession();
        ses.invalidate();
        %>
        <div id="login">
        <h2><span class="fontawesome-lock"></span>Login</h2>
        <form action="login.jsp" method="post">
            <fieldset>
        Email id <input type="text" name="emailid" required>&nbsp;&nbsp;
        Password <input type="password" name="password" required><br>
        <input type="submit" value="Login"><br>
        <a class="signup" href="signup.jsp">New User? Register now to get tangled</a>
            </fieldset>
        </form>
        </div>
        <div class="det"><img src="images/bg.jpg" alt="social">
        </div>        
        </div>
        <div class="leftcorn">
            <img src="images/sign.jpg" width="600px" style="position: absolute; left: 620px; top: 30px">
        </div>
    </body>
</html>
    </body>
</html>
