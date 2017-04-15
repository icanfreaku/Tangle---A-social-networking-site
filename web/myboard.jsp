<%-- 
    Document   : myboard
    Created on : Jan 21, 2015, 1:55:24 PM
    Author     : sumitha
--%>


<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
     <link rel="stylesheet" type="text/css" href="login.css">
<link rel="stylesheet" type="text/css" href="searchbox.css"/>
<link rel="stylesheet" type="text/css" href="css/details.css"/>

     <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,300,800,700,400italic|PT+Serif:400,400italic"/>
       <script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/lightbox.min.js"></script>
        <link href="css/lightbox.css" rel="stylesheet" />

        <title>Your hood </title>
        <style type="text/css">
            #fullname {
               color: #f95252;
               float: right;
               margin-right: 185px;
               font-family: sans-serif;
               font-size: 25px;
               font-weight: bolder;
}
#det2 {
    color: black;
    font-family: sans-serif;
    font-size: 16px;
    float: right;
    margin-top: -165px;
    margin-right: 95px;
}
#head {
    width: 500px;
    padding: 20px 20px;
    border-style: dotted;
    border-color: purple;
    background-color: thistle;
}
   #users {
        width: 400px;
    border: 4px solid red;
    padding: 20px;
    overflow: hidden;
}
#users img {
    margin-right: 15px;
    float: left;
}
.post-heading {
    position: relative;
    border-bottom: 3px solid #666;
}

.post-title {
    font-size: 24px;
    font-weight: bold;
	color: white;
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
    margin-left : 15%;
    margin-right : 5%;
    width : 650px;
    height : auto;
    padding : 10px 25px 25px 15px;
    word-wrap: break-word;
	background-color :tomato;
    position : relative;
    box-shadow : 0 2px 4px black;
    background-clip : padding-box;
    position: relative;
    font-family: Helvetica, Arial, sans-serif;
    font-size: 16px;
	color: white;

	}
         #content {
            position:relative ;
            margin-top: 30px;
           

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
        <a class="tanglelogo" href="home.jsp" style="color: white; font-size: medium;margin-left: 200px; margin-top: 9px;border:3px solid;border-bottom-color: #1595ea"><img src="images/storyboard-logo.jpg"  width="150px"></a>
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

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        //String query="select * from user where emailid="+email;
        Statement st=con.createStatement();
        Statement st2=con.createStatement();
        PreparedStatement pst=con.prepareStatement("select * from user where emailid='"+email+"'");
        ResultSet res=pst.executeQuery();
        res.first();
        int loggeduid=Integer.parseInt(res.getString("userid"));
        session.setAttribute("loggeduid",loggeduid);
        String dp=res.getString("dp");
        String fname=res.getString("fname");
        String lname=res.getString("lname");
        String gender=res.getString("gender");
        int age=Integer.parseInt(res.getString("age"));
        String  dob=res.getString("dob");
        String aboutme=res.getString("about_me");
        String education=res.getString("education");
        String relationship=res.getString("relationship");
        String other_profiles=res.getString("other_profiles");

        %>

        <section id="container">
			<header>
            	<!-- Logo -->
            	<div id="logo">
                	<h2><%out.println(fname+" "+lname);%></h2>
                    <h4>GRAPHIC & WEB DESIGNER</h4>
                </div>
                <!-- /Logo -->

                </header>
            <!-- /Header -->

            <!-- Content -->
            <section id="content" >

                <!-- Profile -->
                <div id="profile">
                 	<!-- About section -->
                	<div class="about">
                    	<div class="photo-inner">
                            <ul>
                                <li><a href="<%=dp%>" data-lightbox="<%=loggeduid%>" data-title="<%=fname%>"><img src=<%=dp%> height="186" width="153" /></a></li>

                                <form method="post" action="UploadFile.jsp" enctype="multipart/form-data">
                                    <input type="hidden" name="uid" value="<%=loggeduid%>"><input type="file" name="photo" value="Choose photo" size="50"/><br><input style="font-size: small" type="submit" value="Set Profile picture">
                                </form>

                           </ul>
                        </div>
                        <h1><%out.println(fname+" "+lname);%></h1>
                        <h3><%out.println(gender+", "+age+"yrs");%></h3>
                        <br><a class="messb" href="messages.jsp?">Messages</a>
                        <br><br><h3 style="text-decoration: underline"><a href="newpost.jsp">Make a new Post</a></h3>
                        </div>
                     <!-- /About section -->

                    <!-- Personal info section -->
                	<ul class="personal-info">
						<li><label>Name</label><span><%out.println(fname+" "+lname);%></span></li>
                        <li><label>Birthday</label><span><%out.println(dob);%></span></li>
                        <li><label>Address</label><span>Melbourne Victoria 3000 Australia</span></li>
                        <li><label>Email</label><span class="word-wrap">Anderson.smith@gmail.com</span></li>
                        <li><label>Phone</label><span>+123 456 789 111</span></li>
                    </ul>
                    <!-- /Personal info section -->
                </div>
                <!-- /Profile -->

                <!-- Menu -->
                <div class="menu">
                	<ul class="tabs">
                        <li class="tmenu"><a href="#profile" class="tab-profile"><i>&#x43;</i>Profile</a></li>
                        <li class="tmenu"><a href="#resume"><i>&#x3a;</i>Resume</a></li>
                        <li class="tmenu"><a href="#portfolio"><i>&#x38;</i>Portfolio</a></li>
                        <li class="tmenu"><a href="#contact"><i>&#x21;</i>Contact</a></li>
                    </ul>
                    <a class="prev" id="menu-prev" href="#">&#xe073;</a>
                    <a class="next" id="menu-next" href="#">&#xe076;</a>
                </div>
                <table><tr>
    <%
    PreparedStatement pst3=con.prepareStatement("select userid from frequest where fid='"+loggeduid+"'");
        ResultSet res3=pst3.executeQuery();
        while(res3.next()) {
            int uid=Integer.parseInt(res3.getString("userid"));
            PreparedStatement pst4=con.prepareStatement("select fname,lname from user where userid="+uid);
            ResultSet res4=pst4.executeQuery();
            while(res4.next()){
                String name1=res4.getString("fname");
            out.println("<h4 style='background-color: #33cc77'>"+name1+" "+res4.getString("lname")+" sent you a request to be your friend");
               %>
                    <div class="addbutton"><form id="frendform" method="post" action="f_accept"><input type="hidden" name="luid" value="<%=loggeduid%>"><input type="hidden" name="fuid" value="<%=uid%>"><input style="background-color:coral; cursor: pointer" type="submit" name="addbutton" value="Accept+" onclick="alert('<%=name1%> added as your friend')">
                 <br></h4>
                    </form></div>
                 <br>
                    <%
            }
            }
        %>
       
        <%
          PreparedStatement pst1=con.prepareStatement("select * from posts where userid="+loggeduid+" order by created_time DESC");
        ResultSet res1=pst1.executeQuery();
            while(res1.next()) {
                int post_id=res1.getInt("post_id");
                String subject=res1.getString("subject");
                String post=res1.getString("post");
                String created_time=res1.getString("created_time");
                
                %>
                <div id="content">
                <div class="post">
                 <div class="post-heading">
                     <h3><a href="post.jsp?pid=<%=post_id%>"><%=subject%></a></h3>
                <div class="post-date">
                   Posted on <%=created_time%>
                </div>
                </div>
                <div class="post-by">Posted by <a href="hood.jsp?uid=<%=loggeduid%>"><%=fname+" "+lname%>(You)</a></div>
                <div class="post-content">
                    <br><%=post%>
                </div>
            </div>
                </div>
<%
            }        
        %>
       