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

            #mask {
    display: none;
    background: #000;
    position: fixed;
    left: 0;
    top: 0;
    z-index: 10;
    width: 100%;
    height: 100%;
    opacity: 0.8;
    z-index: 999;
}

.login-popup {
    display: none;
    background: #e54040;
    padding: 10px;
    border: 2px solid #ddd;
    float: left;
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
#grp_det {
    text-decoration: underline;
    margin-left: 550px;
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
                        <li class="tmenu"><a href="myboard.jsp"><i><h2>My Posts</h2></i></a></li>
                        <li class="tmenu"><a href="#portfolio"><i>&#x38;</i>Portfolio</a></li>
                        <li class="tmenu"><a href="#contact"><i>&#x21;</i>Contact</a></li>
                        <li class="tmenu"><a href="#login-box" class="login-window">Create group</a></li>
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
                 <br>
                    </form></div>
                 <br>
                    <%
            }
            }
        %>
        <script type="text/javascript">
               function hideshow(which){
if (!document.getElementById)
return
if (which.style.display=="block") {
which.style.display="none"
document.getElementById('about').style.display="block"
}
else {
which.style.display="block"
document.getElementById('about').style.display="none"
}
               }

function tog(which){
if (!document.getElementById)
return
if (which.style.display=="table") {
which.style.display="none"
document.getElementById('basic').style.display="block"
}
else {
which.style.display="table"
document.getElementById('basic').style.display="none"
}
               }


        </script>
       
        <div class="abouts">
           <h3> About me <sup><a style="text-decoration: underline; color: #258ecd" href="javascript:hideshow(document.getElementById('adiv'))">Edit</a></sup></h3>
            <div id="adiv" style="font:24px bold; display: none">
                <form method="post" action="detail_updation.jsp">
                    <textarea name="aboutme" id="aboutme" rows="5" cols="50" maxlength="300" wrap="hard"><%=aboutme%></textarea>
                    <input type="hidden" id="detail" name="detail" value="about">
                    <input style="background: darkorchid; font-size: smaller; color: white" type="submit" value=" Update " style="cursor: pointer">
                </form>
            </div>
            <div id="about" class="about" style="font-size: medium; word-wrap:break-word; width: 420px;">
                <% if(aboutme==null) {
                    out.println("<font color='#737373'>Add details about you</font>");
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
            <h3> Basic information <sup><a style="text-decoration: underline; color: #258ecd" href="javascript:tog(document.getElementById('binfo'))">Edit</a></sup></h3>
            <div id="binfo" style="font:24px bold; display: none">
                <form method="post" action="detail_updation.jsp"><br/>
                    <label style="font-size:large; font-weight:lighter">Education</label><input type="text" name="education" value="<%=education%>"><br/><br/>
                    <label style="font-size:large; font-weight:lighter">Relationship</label><input type="text" name="relationship" value="<%=relationship%>"><br/><br/>
                    <label style="font-size:large; font-weight:lighter">Other profiles</label><input type="text" name="other_profile" value="<%=other_profiles%>"><br/><br/>
                    <input type="hidden" id="detail" name="detail" value="basic">
                    <input style="background: darkorchid; font-size: smaller; color: white" type="submit" value=" Update " style="cursor: pointer">
                </form>
            </div>
            <div id="basic" class="basic" style="font-size: medium; word-wrap:break-word; width: 420px;">
                <dl>
                    <dt><label style="font-weight:bold; color: #262626">Education </label></dt>
                    <dd><%if(education==null) {
                    out.println("<font color='#737373'>Add your education details</font>");
                    }
                   else {
                   out.println(education);
                   } %></dd><br/>
                    <dt><label style="font-weight:bold;color: #262626">Relationship</label></dt>
                    <dd><%if(relationship==null) {
                    out.println("<font color='#737373'>Add your relationship status</font>");
                    }
                   else {
                   out.println(relationship);
                   } %>
                    </dd><br/>
                    <dt><label style="font-weight:bold;color: #262626">Other profiles</label></dt>
                    <dd><% if(other_profiles==null) {
                    out.println("<font color='#737373'>Add links to your other profiles</font>");
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
       PreparedStatement pst5=con.prepareStatement("select * from relation where userid="+loggeduid);
       ResultSet res5=pst5.executeQuery();
       int rowno=1;
       while(res5.next()) {
            if(rowno%2!=0) {
                out.println("<tr>");
                }
         String fid=res5.getString("fid");
      PreparedStatement  pst2=con.prepareStatement("select * from user where userid="+fid);
       ResultSet res2=pst2.executeQuery();
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
       out.println("<h3 style='float:right'>Groups >></h3><br><br><br>");
     
      PreparedStatement pst6=con.prepareStatement("select group_id from group_relation where userid="+loggeduid);
       ResultSet res6=pst6.executeQuery();
       while(res6.next()) {
           int group_id=res6.getInt("group_id");
           PreparedStatement pst7=con.prepareStatement("select * from groups where group_id="+group_id);
           ResultSet res7=pst7.executeQuery();
           res7.first();
           String grpname=res7.getString("group_name");
           int created_by=res7.getInt("created_by");

        %>
           <div id="grp_det">
               <br><a href="groups.jsp?gid=<%=group_id%>"><h3><%=grpname%></h3></a>
           </div>
           <%
            }
           %>
                             </table>
           <div id="login-box" class="login-popup">
<a href="myhood.jsp" class="close"><img src="close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
  <form method="post" class="signin" action="add_group.jsp">
        <fieldset class="textbox">
        <label class="username">
        <span>Group name</span>
        <input id="grpname" name="grpname" value="" type="text" autocomplete="on" placeholder="Group name">
        </label>
        <label class="dp">
        <span>Group icon</span>
        <input id="password" name="password" value="" type="password" placeholder="">
        </label>
            <input type="submit" value="Create">
        </fieldset>
  </form>
</div>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
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
     
    </body>
</html>
