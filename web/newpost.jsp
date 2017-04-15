<%-- 
    Document   : newpost
    Created on : Jan 20, 2015, 7:46:40 PM
    Author     : sumitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

     <link rel="stylesheet" type="text/css" href="login.css">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <style type="text/css">
            body {
            background-color: white;
}
.form {
    font-family: "Varela Round", Arial, Helvetica, sans-serif;
	font-size: 16px;
    margin-left : 15%;
    margin-right : 5%;
    width : 45%;
    height : auto;
    padding : 10px 25px 25px 15px;
	 background-color: #FAEBD7;
    position : relative;
    box-shadow : 0 2px 4px black;
    background-clip : padding-box;
	line-height: 1.5em;
}

input,textarea {
	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
	border:2px solid #456879;
	border-radius:10px;

	}
@import url(http://fonts.googleapis.com/css?family=Capriola);

#login {
	margin: 50px auto;
	width: 600px;
}

.sub {
	background-color: #f95252;
	-webkit-border-radius: 20px 20px 0 0;
	-moz-border-radius: 20px 20px 0 0;
	border-radius: 20px 20px 0 0;
	color: #fff;
	font-size: 20px;
	padding: 20px 26px;
}

#login h2 span[class*="fontawesome-"] {
	margin-right: 14px;
}

        </style>
    </head>
    <body>
         <div class="tanglelogo"> <img src="images/logo.PNG" width="180" height="80" alt="logo"></div>
        <%
        HttpSession ses=request.getSession();
        String email=(String) ses.getAttribute("emailid"); %>
              <div class="login-area">
           <%
       if(email==null){
           %>
           <script type="text/javascript">
               alert("Please login to continue");
               window.location="index.jsp";
           </script>
           <%
           }
       else {
           out.println("<a class=login-link href=myhood.jsp>"+email+"</a> | ");
           %>
           <a class="login-link" href="index.jsp">Logout</a></div>
                   <%
           }
%>
            <div id='login' style="margin-left:140px; margin-top: 80px;">
                <div class="form" style="width:750px;">
                    <h2 style="background-color:#f95252;width: 300px; padding: 8px;color: white; ">Make your post</h2>
                         <form method="post" action="submit_post.jsp">
                             <table><tr><td class="label">Subject</td>
                                 <td><input type="text" name="subject" required></td></tr>
                                 <tr><td class="label">Post Content</td>
                                 <td><textarea style="	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
	border:2px solid #456879;
	border-radius:10px;

" name="content" cols="75" rows="7" required></textarea></td></tr>
                             <tr><td><fieldset><input type="submit" value=" Post " style="cursor: pointer;"></fieldset></td></tr>
                             </table>
                         </form>
                </div>
            </div>
    </body>
</html>
