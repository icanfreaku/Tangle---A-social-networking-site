<%-- 
    Document   : groups
    Created on : Jan 25, 2015, 3:39:01 PM
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
         <link rel="stylesheet" type="text/css" href="grpmess.css">
         <style type="text/css" >
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
    width: 500px;
    overflow-y: scroll;
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
    margin: -28 px -28px 0 0;
    
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
        int loggeduid=(Integer) ses.getAttribute("loggeduid");
        int groupid=Integer.parseInt(request.getParameter("gid"));
        PreparedStatement pst=con.prepareStatement("select * from groups where group_id="+groupid);
        ResultSet res=pst.executeQuery();
        res.first();
        String grpname=res.getString("group_name");
        int admin=res.getInt("created_by");
        %>
        <section id="container">
            <br><br><br>
        <h1><%=grpname%></h1>
        <title><%=grpname%></title>
        <br>
        <nav class="cbp-spmenu" id="cbp-spmenu-s1">
	<h3>Participants</h3>
        <br><h4>
        <%
        PreparedStatement pst1=con.prepareStatement("select userid from group_relation where group_id="+groupid);
        ResultSet res1=pst1.executeQuery();
        while(res1.next()) {
            int userid=res1.getInt("userid");
            PreparedStatement pst2=con.prepareStatement("select fname,lname,dp from user where userid="+userid);
            ResultSet res2=pst2.executeQuery();
            res2.first();
                String dp=res2.getString("dp");
                String fname=res2.getString("fname");
                String lname=res2.getString("lname");
                %>
                <a href="hood.jsp?uid=<%=userid%>"><img src="<%=dp%>" width="30" height="30">&nbsp;<%=fname%>&nbsp;<%=lname%></a>
                <%
                }
        if(loggeduid==admin) {
            %>
                <br><br><a href="#login-box" class="login-window">add participant +</a>
            <div id="login-box" class="login-popup">
<a href="groups.jsp?gid=<%=groupid%>" class="close"><img src="img/close.png" class="btn_close" title="Close Window" alt="Close" /></a>
<%
PreparedStatement pst5=con.prepareStatement("select * from relation where userid="+loggeduid);
       ResultSet res5=pst5.executeQuery();
       while(res5.next()) {          
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
            out.println("<div id=user><h4><td width='400px' style='padding : 15px; background-color: #f7c7c9'><a href=add_participant?uid="+userid+"&gid="+groupid+"><img src="+fdp+" width=50 height=50>"+ffname+" "+flname+"");
            out.println("<p>"+fgender+" "+fage+"</p></a></td></div>");
          }          
        }       
%>
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
        <%
}
        %>

          <header class="top-bar"><div class="left"></div></header>
           <section class="module"><ol id="discussion" class="discussion">         
        <%
        PreparedStatement pst3=con.prepareStatement("select * from grp_messages where toid="+groupid+" order by time");
        ResultSet rs=pst3.executeQuery();
        while(rs.next()) {
            String msg=rs.getString("message");
            int fromid=Integer.parseInt(rs.getString("fromid"));
            int toid=Integer.parseInt(rs.getString("toid"));
            String time=rs.getString("time");
              String fname=rs.getString("fname");
            String lname=rs.getString("lname");
              if(fromid!=loggeduid) {
              out.println("<li class='other'>");
            }
            else {
              out.println("<li class='self'>");
                  }
            out.println("<div class='messages'><p>"+msg+"</p><time class='time'>"+time+"</time><time class='time' style='float:right'>"+fname+" "+lname+"</time></div></li>");
         }
        %>
                   </ol> </h4></section>
              <script type="text/javascript">
                   var objDiv = document.getElementById("discussion");
                   objDiv.scrollTop = objDiv.scrollHeight;
               </script>
     <footer class="msgg" style="margin-left: 480px; width: 350px"><form method="post" action="sendgrpmessage"><input type="hidden" name="toid" value="<%=groupid%>"><textarea class="msg"  name="msg" id="msg" placeholder="Enter your message here " required></textarea><input type="submit" value="Send" class="sendButton"></form><br>
        </footer>
     
    </body>
</html>
