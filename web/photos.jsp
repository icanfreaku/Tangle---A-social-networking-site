<%-- 
    Document   : photos
    Created on : Feb 1, 2015, 1:50:02 AM
    Author     : sumitha
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
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
         <script src="js/jquery-1.11.0.min.js"></script>
         <script src="js/lightbox.min.js"></script>
        <link href="css/lightbox.css" rel="stylesheet" />
        
    
        <title>JSP Page</title>
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
	color:black;

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
hr.fancy-line {
    border: 0;
    height: 3px;

}
hr.fancy-line:before {
    top: -0.5em;
    height: 1em;
}
hr.fancy-line:after {
    content:'';
    height: 0.5em;
    top: 1px;
}

hr.fancy-line:before, hr.fancy-line:after {
    content: '';
    position: absolute;
    width: 100%;
}

hr.fancy-line, hr.fancy-line:before {
    background: radial-gradient(ellipse at center, rgba(1,1,0,0.1) 0%,rgba(0,0,0,0) 75%);
}
a.login-window {
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
        </style>
   
    </head>
    <body>
           <div align="right" style="position: relative; top:-70px; background-color: black">
             <form class="form-wrapper cf" action="search.jsp" method="get">
                         <input name="search" type="text" placeholder="Search tangle" required>
                            <button type="submit">Search</button>
               </form></div>
        <div class="tanglelogo"> <img src="images/logo.PNG" width="180" height="80" alt="logo"></div>

<section id="container" style="width:1000px">
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
             <div class="upload" style=" ">
                 <a href="#login-box" class="login-window"><br>Upload</a>
             <div id="login-box" class="login-popup">
<a href="" class="close"><img src="img/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
<form method="post" action="UploadPhoto.jsp" enctype="multipart/form-data" >
    <input type="text" style="height:20px; width:470px;" name="caption" placeholder="Caption your photo "  required>
       <br><br><td class="label"><input type="file" name="photo" value=" Choose photo " size="50"/><br><br>
               <input style="font-size: medium; cursor: pointer" type="submit" value=" Upload Photo ">
</td>
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
             </div>
<br><br>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        //String query="select * from user where emailid="+email;
        PreparedStatement pst=con.prepareStatement("select fid from relation where userid="+loggeduid);
        ResultSet res=pst.executeQuery();     
        ArrayList fid=new ArrayList();
        while(res.next()) {
            int id=res.getInt("fid");
            fid.add(id);
            }
int[] fids=new int[fid.size()];
for(int i=0;i<fid.size();i++) {
    fids[i]=(Integer) fid.get(i);
    }
out.println("<br<br><br><br><br>"+fid);
        Statement st=con.createStatement();
        String ids = fid.toString();
        ids = ids.substring(1, ids.length()-1);
        PreparedStatement pst1=con.prepareStatement("select * from photos where created_by IN("+ids+") order by created_time DESC");
        ResultSet res1=pst1.executeQuery();
            //if(res1.first()) { %>
            <table cellpadding="5px" cellspacing="7px">
<%
       // out.println("<table><tr>");
        int count=0;
                    %>

<%                 
                        while(res1.next()) {
                             if(count==0) {
                                %>
                                <tr>
                                    <%
                            }

                            if(count>=3) {

                                %>
                </tr>
<%
                              count=0;
                            }
                           
                       %>
                       <td style="padding:35px">
<%
                     int created_by=res1.getInt("created_by");
                     String caption=res1.getString("caption");
                     String photo_src=res1.getString("photo_src");
                     Timestamp created_time=res1.getTimestamp("created_time");
                     int post_id=res1.getInt("post_id");
            PreparedStatement pst2=con.prepareStatement("select fname,lname,dp from user where userid="+created_by);
            ResultSet res2=pst2.executeQuery();
            res2.first();
            String fname=res2.getString("fname");
            String lname=res2.getString("lname");
            String dp=res2.getString("dp");
            
                %>                            
                                             <div class="post">
                 <div class="post-heading">
                   <img src="<%=dp%>" width="50px" height="50px" style="float:left">
                   <h3><a href="hood.jsp?uid=<%=created_by%>">&nbsp;<%=fname+" "+lname%></a></h3>
               <!-- <div class="post-date">
                   Posted on <%=created_time%>
                </div> -->
                </div>
                <div class="post-by" style="position: relative"><br>&nbsp;&nbsp;<a href="post.jsp?pid=<%=post_id%>"><%=caption%></a></div>
                <div class="post-content">
                    <br><center><a href="<%=photo_src%>" data-lightbox="<%=caption%>" data-title="<%=caption%>"><img src="<%=photo_src%>" width="250px" height="250px" alt="Photo not available"></a>
                    </center></div>
                <br>
                <%
                PreparedStatement like=con.prepareStatement("select COUNT(*) from thumbs_up where post_id="+post_id);
                ResultSet likeres=like.executeQuery();
                likeres.first();
                int likes=likeres.getInt("count");                
                    int userid=likeres.getInt("userid");
                %>
                <div id="like">
                    <center><form action="like_it.jsp" method="post">
                        <input type="hidden" name="post_id" value="<%=post_id%>">
                        <input type="image" name="submit" src="images/super.png" width="50px" height="50px">
                        </form>
                        <a href="#like-ppl"><h5><%=likes%> people gave a thumbs up</h5></a>
                        <div id="like-ppl">

                        </div>
                    </center>
                </div>
                                  </div>
                           </td>
<%
         count++;
                        }
             %>
            </table>
            <%
           
            if(!res1.first()) {
                out.println("<center><h3 style='color:#b9b9b9;letter-spacing:1.5px;'>No photos to show <br><br> Check back soon<br><hr class='fancy-line'></h3></center>");
                }

       %>
    </body>
</html>
