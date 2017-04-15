<%--
    Document   : hood
    Created on : Nov 27, 2014, 10:21:04 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
        <title>hood </title>
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
.addbutton {
   color: #f7f7f7;
   font-size: 14px;
   font-family: Georgia, Serif;
   width: 50px;
   height: 10px;
   }
   .photo-inner {
  -webkit-transition: all 0.5s ease;
     -moz-transition: all 0.5s ease;
       -o-transition: all 0.5s ease;
      -ms-transition: all 0.5s ease;
          transition: all 0.5s ease;
}

.photo-inner:hover {
  -webkit-transform: rotate(-10deg);
     -moz-transform: rotate(-10deg);
       -o-transform: rotate(-10deg);
      -ms-transform: rotate(-10deg);
          transform: rotate(-10deg);
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
        int uid=Integer.parseInt(request.getParameter("uid"));
        //out.println("uid"+uid);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        Statement st=con.createStatement();
        String query="select * from user where emailid="+email;
        PreparedStatement pst=con.prepareStatement("select userid,emailid from user where emailid='"+email+"'");
        ResultSet res=pst.executeQuery();
        res.first();
        int loggeduid=Integer.parseInt(res.getString("userid"));
         //out.println("loggduid"+loggeduid);
        PreparedStatement friend=con.prepareStatement("select userid,fid from relation where userid="+loggeduid+" and fid="+uid);
        ResultSet frnd=friend.executeQuery();
        PreparedStatement freq=con.prepareStatement("select userid,fid from frequest where userid="+loggeduid+" and fid="+uid);
        ResultSet frequest=freq.executeQuery();
        PreparedStatement pst2=con.prepareStatement("select * from user where userid="+uid);
        ResultSet res2=pst2.executeQuery();
        res2.first();
        String emailid=res2.getString("emailid");
        String dp=res2.getString("dp");
        String fname=res2.getString("fname");
        String lname=res2.getString("lname");
        String gender=res2.getString("gender");
        int age=Integer.parseInt(res2.getString("age"));
        String dob=res2.getString("dob");
        String aboutme=res2.getString("about_me");
        String education=res2.getString("education");
        String relationship=res2.getString("relationship");
        String other_profiles=res2.getString("other_profiles");
        %>
        <section id="container" style="height: auto">
			<header>
            	<!-- Logo -->
            	<div id="logo">
                    <h2 style="text-transform: capitalize"><%out.println(fname+" "+lname);%></h2>
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
                                <li><a href="<%=dp%>" data-lightbox="<%=uid%>" data-title="<%=fname%>"><img src=<%=dp%> height="186" width="153" /></a></li>
                                <%=dp%>
                           </ul>
                        </div>
                                <h1 style="text-transform: capitalize"><%out.println(fname+" "+lname);%></h1>
                        <h3><%out.println(gender+", "+age+"yrs");%></h3>

                       <%
                       if(uid==loggeduid) {
                           out.println("<h4>You can't add yourself as friend</h4>");
                           }
                       else if(frnd.first()) {
                           %>
                           <br><h4>You are already friends</h4><br>
                           <a class="messb" href="messages.jsp?uid=<%=uid%>">Send message</a>
                           <%
                           }
                        else if(frequest.first()) {
                            %>
                            <br><h4>Friend request sent!</h4>
                            <%
                            }
                        else
                            {
                       %>
                       <br><form id="addbutton" method="post" action="f_req.jsp"><input type="hidden" name="luid" value="<%=loggeduid%>"><input type="hidden" name="fuid" value="<%=uid%>"><input style="cursor: pointer; font-size: larger; font-weight: bold " type="submit" name="addbutton" value="Add Friend+" onclick="alert('Friend request sent!')">
                               </form>
                        <% }%>
                        </div>
                         <!-- /About section -->

                    <!-- Personal info section -->
                	<ul class="personal-info" style="font-size: medium">
		       <li><label>Name</label><span><%out.println(fname+" "+lname);%></span></li>
                        <li><label>Birthday</label><span><%out.println(dob);%></span></li>
                        <li><label>Address</label><span>Melbourne Victoria 3000 Australia</span></li>
                        <li><label>Email</label><span class="word-wrap"><%=emailid%></span></li>
                        <li><label>Phone</label><span>+123 456 789 111</span></li>
                    </ul>
                    <!-- /Personal info section -->
                </div>
                <!-- /Profile -->
                
                <!-- Menu -->
                <div class="menu" style="width: 700px">
                	<ul class="tabs">
                        <li class="tmenu"><a href="#profile" class="tab-profile"><i>&#x43;</i>Profile</a></li>
                        <li class="tmenu"><a href="#resume"><i>&#x3a;</i>Resume</a></li>
                        <li class="tmenu"><a href="#portfolio"><i>&#x38;</i>Portfolio</a></li>
                        <li class="tmenu"><a href="#contact"><i>&#x21;</i>Contact</a></li>
                    </ul>
                    <a class="prev" id="menu-prev" href="#">&#xe073;</a>
                    <a class="next" id="menu-next" href="#">&#xe076;</a>

                </div>
<%
while(request.getParameter("freq")!=null) {
        if(request.getParameter("freq").equals("requestsent")) {
             %>
             f_req();
          <%
                 }
        }

        %>
    <div class="abouts">
           <h3> About me </h3>
           <div id="about" class="about" style="font-size: medium; word-wrap:break-word; width: 420px;">
                <% if(aboutme==null) {
                    out.println("<font color='#737373'>No details about "+fname+" available</font>");
                    }
                   else {
                   out.println(aboutme);
                   }
                    %>
            </div>
             <div class="box6_corner_lf"></div>
             <div class="box6_corner_rt"></div>
        </div>
        <div class="info">
            <h3> Basic information </h3>
            <div id="basic" class="basic" style="font-size: medium; word-wrap:break-word; width: 420px;">
                <dl>
                    <dt><label style="font-weight:bold; color: #262626">Education </label></dt>
                    <dd><%if(education==null) {
                    out.println("<font color='#737373'>No education details to show</font>");
                    }
                   else {
                   out.println(education);
                   } %></dd><br/>
                    <dt><label style="font-weight:bold;color: #262626">Relationship</label></dt>
                    <dd><%if(relationship==null) {
                    out.println("<font color='#737373'>No relationship info to show</font>");
                    }
                   else {
                   out.println(relationship);
                   } %>
                    </dd><br/>
                    <dt><label style="font-weight:bold;color: #262626">Other profiles</label></dt>
                    <dd><% if(other_profiles==null) {
                    out.println("<font color='#737373'>No additional links to show</font>");
                    }
                   else {
                   %>
                   <a href="http://<%=other_profiles%>" style="color:#427fed"><%=other_profiles%></a>
                    <% } %>
                    </dd><br/>
                </dl>
            </div>
        </div>
              
        <br><h3 style="margin-left: 15px">Friends >></h3> <table cellspacing="1px" style="margin-left: 5px;border-collapse: separate;  border-spacing: 10px;"><tr style="">
       <%
       PreparedStatement pst5=con.prepareStatement("select * from relation where userid="+uid);
       ResultSet res5=pst5.executeQuery();
       int rowno=1;
       while(res5.next()) {
            if(rowno%2!=0) {
                out.println("<tr>");
                }
         String fid=res5.getString("fid");
       pst2=con.prepareStatement("select * from user where userid="+fid);
        res2=pst2.executeQuery();       
        while(res2.next()) {
            int userid=Integer.parseInt(res2.getString("userid"));
            String fdp=res2.getString("dp");
            String ffname=res2.getString("fname");
            String flname=res2.getString("lname");
            String fgender=res2.getString("gender");
            int fage=Integer.parseInt(res2.getString("age"));
            String fdob=res2.getString("dob");
            out.println("<div id=user><td width='400px' style='padding : 15px; background-color: #f7c7c9'><a href=hood.jsp?uid="+userid+"><img src="+fdp+" width=50 height=50><h3>"+ffname+" "+flname+"</h3>");
            out.println("<p>"+fgender+" "+fage+"</p></a></td></div>");
          }
           if(rowno%2==0) {
                out.println("</tr>");
                }
            rowno++;
           
        }

        %>
           </table>
           </body>
</html>
