<%-- 
    Document   : home
    Created on : Jan 20, 2015, 9:19:57 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
         <link rel="stylesheet" type="text/css" href="login.css">
         <link rel="stylesheet" type="text/css" href="searchbox.css"/>
        <title>Story board</title>
        <style type="text/css">
            
            body {
                background-color: white;
}
.post-heading {
    position: relative;
    border-bottom: 3px solid #666;
}

.post-title {
    font-size: 24px;
    font-weight: bold;
	color: black;
	-webkit-transition: 200ms linear 0s;
    -moz-transition: 200ms linear 0s;
    -o-transition: 200ms linear 0s;
    transition: 200ms linear 0s;
    outline: 0 none;
	text-decoration : none;

    }
    .post-title:hover,a.title:focus{
    color : rgb(0,0,0);
    text-shadow: -1px 1px 10px rgb(255,255,255), 1px -1px 10px rgb(255,255,255);
}

.post-date {
    position: absolute;
    right: 0px;
    bottom: 0px;
    color: black;

}
.post-by {
position: absolute;
    color: black;
text-decoration: none;
}

.post-content {
}

.post {
    margin-left : 0%;
    margin-right : 5%;
    width : 100%;
    height : auto;
    padding : 10px 25px 25px 15px;
    word-wrap: break-word;
	background-color :#FAEBD7;
    position : relative;
    box-shadow : 0 2px 4px black;
    background-clip : padding-box;
    position: relative;
    font-family: Helvetica, Arial, sans-serif;
    font-size: 16px;
	color: black;
	
	}
        #content {
            position:relative ;
            margin-top: 30px;

        }
        .upload {
          }

    .login-popup {
    display: none;
    background: #e54040;
    padding: 10px;
    border: 2px solid #ddd;
    float: left;
    height: 150px;
    width: 500px;
    font-size: 1.2em;
    position: fixed;
    top: 50%;
    left: 50%;
    z-index: 99999;
    box-shadow: 0px 0px 20px #999;
    /* CSS3 */
        -moz-box-shadow: 0px 0px 20px #999;
    /* Firefox */
        -webkit-box-shadow: 0px 0px 20px #999;
    /* Safari, Chrome */
	border-radius: 3px 3px 3px 3px;
    -moz-border-radius: 3px;
    /* Firefox */
        -webkit-border-radius: 3px;
    /* Safari, Chrome */;
}

img.btn_close {
    Position the close button
	float: right;
    margin: -28px -28px 0 0;
}

fieldset {
    border: none;
}

form.signin .textbox label {
    display: block;
    padding-bottom: 7px;
}

form.signin .textbox span {
    display: block;
}

form.signin p, form.signin span {
    color:white;
    font-size: 14px;
    line-height: 28px;
}

form.signin .textbox input {
    background: white;
    border-bottom: 1px solid #333;
    border-left: 1px solid #000;
    border-right: 1px solid #333;
    border-top: 1px solid #000;
    color: black;
    border-radius: 3px 3px 3px 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    font: 13px Arial, Helvetica, sans-serif;
    padding: 6px 6px 4px;
    width: 400px;
}

form.signin input:-moz-placeholder {
    color: #999;
    text-shadow: 0 0 2px #000;
}

form.signin input:-webkit-input-placeholder {
    color: #999;
    text-shadow: 0 0 2px #000;
}

.button {
    background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
    background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#dddddd));
    background: -o-linear-gradient(top, #f3f3f3, #dddddd);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3', EndColorStr='#dddddd');
    border-color: #000;
    border-width: 1px;
    border-radius: 4px 4px 4px 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    color: #333;
    cursor: pointer;
    display: inline-block;
    padding: 6px 6px 4px;
    margin-top: 10px;
    font: 12px;
    width: 214px;
}

.button:hover {
    background: #ddd;
}

a.login-window, a.login-window2 {
      float:right;
            margin-top: 25px;
            width: 130px;
            height:45px;
            color: white;
            text-align: center;
            font-size: large;
            position: relative;
            background-color: #EB7E10;
}
a.login-window:hover {
    background-color: #fdc750;
}
a.post-link {
      float:right;
            margin-top: 25px;
            margin-right: 20px;
            width: 160px;
            height:45px;
            color: white;
            text-align: center;
            font-size: large;
            position: relative;
            background-color: #EB7E10;
}
a.post-link:hover {
    background-color: #fdc750;
}
}

        </style>
    </head>
    <body>
         <div align="right" style="position: relative; top:-70px; background-color: black">
             <form class="form-wrapper cf" action="search.jsp" method="get">
                         <input name="search" type="text" placeholder="Search tangle" required>
                            <button type="submit">Search</button>
               </form></div>
        <div class="tanglelogo"> <img src="images/logo.PNG" width="180" height="80" alt="logo"></div>
        
<section id="container">
    <br>
          <%
       HttpSession ses=request.getSession();
       String email=(String) ses.getAttribute("emailid");
       %>
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
       int loggeduid = (Integer) session.getAttribute("loggeduid");
%>
<div class="nav" style="margin-top:25px; position: absolute; font-size: medium">
    <a href="home.jsp" class="navi" style="text-decoration:overline">Posts</a> | <a href="photos.jsp">Photos</a>
</div>
              <a href="#login-box" class="login-window"><br>Upload</a>&nbsp;&nbsp;
                       <a href="newpost.jsp" class="post-link"><br>&nbsp;Post your mind</a>
  <div class="upload" style="">
             <div id="login-box" class="login-popup">
<a href="" class="close"><img src="img/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
<form method="post" action="UploadPhoto.jsp" enctype="multipart/form-data">
       <tr><td><textarea style="height:20px; width:470px;" name="caption" placeholder="Caption your photo "  required></textarea></td></tr>
       <br><br><tr><td class="label"><input type="file" name="photo" value=" Choose photo " size="50"/><br><br>
               <input style="font-size: medium; cursor: pointer" type="submit" value=" Upload Photo ">
</td></tr>
</form>
             </div>

   <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
$('a.login-window').click(function() {

            //Getting the variable's value from a link
    var loginBox = $(this).attr('href');

    //Fade in the Popup
    $(loginBox).fadeIn(300);

    //Set the center alignment padding + border see css style
    var popMargTop = ($(loginBox).height() + 24) / 2;
    var popMargLeft = ($(loginBox).width() + 24) / 2;

    $(loginBox).css({
        'margin-top' : -popMargTop,
        'margin-left' : -popMargLeft
    });

    // Add the mask to body
    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);

    return false;
});

// When clicking on the button close or the mask layer the popup closed
$('a.close, #mask').live('click', function() {
  $('#mask , .login-popup').fadeOut(300 , function() {
    $('#mask').remove();
});
return false;
});
});
        </script>
             </div><br><br><br>
<br><br>
          <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        //String query="select * from user where emailid="+email;
        Statement st=con.createStatement();
        PreparedStatement pst1=con.prepareStatement("select * from posts where userid in(select fid from relation where userid="+loggeduid+") order by created_time DESC");
        ResultSet res1=pst1.executeQuery();
            if(res1.first()) {
                while(res1.next()) {
                    int uid=res1.getInt("userid");
            String subject=res1.getString("subject");
            String post=res1.getString("post");
            String created_time=res1.getString("created_time");
            int post_id=res1.getInt("post_id");
            PreparedStatement pst2=con.prepareStatement("select fname,lname,dp from user where userid="+uid);
            ResultSet res2=pst2.executeQuery();
            res2.first();
            String fname=res2.getString("fname");
            String lname=res2.getString("lname");
            String dp=res2.getString("dp");

            %>
                          <section id="content">                           
            <div class="post">
                 <div class="post-heading">

                   <img src="<%=dp%>" width="50px" height="50px" style="float:left">
                   <h3><a href="post.jsp?pid=<%=post_id%>">&nbsp;<%=subject%></a></h3>
                <div class="post-date">
                   Posted on <%=created_time%>
                </div>
                </div>
                <div class="post-by" style="position: relative">&nbsp;Posted by <a href="hood.jsp?uid=<%=uid%>"><%=fname+" "+lname%></a></div>
                <div class="post-content">
                    <br><%=post%>
                </div>
            </div>
            </section>
<%
            }
            }

       %>
    </body>
</html>
