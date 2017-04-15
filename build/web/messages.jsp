<%-- 
    Document   : messages
    Created on : Dec 14, 2014, 4:52:17 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
     <link rel="stylesheet" type="text/css" href="login.css">
      <link rel="stylesheet" type="text/css" href="mess.css">
<link rel="stylesheet" type="text/css" href="searchbox.css"/>
     <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,300,800,700,400italic|PT+Serif:400,400italic"/>

        <title>Messages</title>
        <style type="text/css">
            .bgimg {
                position: absolute;
                margin-top: -130px;
                margin-left: 581px;
                width: 400px;
                height: 350px;
                       z-index: -1;
}
        </style>
    </head>
    <body>
       
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
       %> 
        <table>
            <tr>
                <td>
        <!-- body has the class "cbp-spmenu-push" -->
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        int loggeduid = (Integer) session.getAttribute("loggeduid");
        Enumeration<String> param=request.getParameterNames();
        int uid;
        if(!param.hasMoreElements()) {
           uid=0;
            }
        else {
        uid=Integer.parseInt(request.getParameter("uid"));
        }
        %>
        <nav class="cbp-spmenu" id="cbp-spmenu-s1">
	<h3>Friends</h3>
        <%
        
        String fcheck="check";
        PreparedStatement flist=con.prepareStatement("select * from relation where userid="+loggeduid+" order by last_activity desc");
        ResultSet fres=flist.executeQuery();
        while(fres.next()) {
         int fid=Integer.parseInt(fres.getString("fid"));
       PreparedStatement pst2=con.prepareStatement("select * from user where userid="+fid);
       ResultSet res3=pst2.executeQuery();
       if(uid==0) {           
           res3.first();
                uid=Integer.parseInt(res3.getString("userid"));
                }
        ResultSet res2=pst2.executeQuery();
        while(res2.next()) {
            int userid=Integer.parseInt(res2.getString("userid"));          
            String fdp=res2.getString("dp");
            String ffname=res2.getString("fname");
            String flname=res2.getString("lname");          
             if((userid==uid)) {
                fcheck="checked";
        %>
        <a class="fselected" href="messages.jsp?uid=<%=userid%>"><img src="<%=fdp%>" width="30" height="30">&nbsp;<%=ffname%>&nbsp;<%=flname%></a>
	<% }
            else { %>
        <a href="messages.jsp?uid=<%=userid%>"><img src="<%=fdp%>" width="30" height="30">&nbsp;<%=ffname%>&nbsp;<%=flname%></a>
	<%
        }

        }
        }
        if(fcheck=="check") {
            response.sendRedirect("hood.jsp?uid="+uid);
        }

        %>
</nav>
        </td><td>
       <div class="mess-content">
         <%
        Statement st=con.createStatement();
        PreparedStatement pst=con.prepareStatement("select fname,lname,dp from user where userid="+uid);
        ResultSet res=pst.executeQuery();
        res.first();
        String fname=res.getString("fname");
        String lname=res.getString("lname");
        String fdp=res.getString("dp");
        PreparedStatement pst2=con.prepareStatement("select fname,lname,dp from user where userid="+loggeduid);
        ResultSet res2=pst2.executeQuery();
        res2.first();
        String mfname=res2.getString("fname");
        String mlname=res2.getString("lname");
        String mydp=res2.getString("dp");
        %>

           <header class="top-bar"><div class="left"><h1><%=fname%> <%=lname%></h1></div></header>
           <section class="module"><ol id="discussion" class="discussion">
         <%
        PreparedStatement pst1=con.prepareStatement("select * from messages where (fromid='"+loggeduid+"' or fromid='"+uid+"') and (toid='"+loggeduid+"' or toid='"+uid+"') order by time");
        ResultSet rs=pst1.executeQuery();
        while(rs.next()) {
            String msg=rs.getString("msg");
            int fromid=Integer.parseInt(rs.getString("fromid"));
            int toid=Integer.parseInt(rs.getString("toid"));
            String time=rs.getString("time");
            String avatar;
            if(fromid==uid) {
                avatar=fdp;
              out.println("<li class='other'>");
            }
            else {
                avatar=mydp;
              out.println("<h3><li class='self'>");
                  }
             out.println("<div class='avatar'><img src="+avatar+" width=40 height=40/></div> "
                     +"<div class='messages'><p>"+msg+"</p><time class='time'>"+time+"</time></div></li>");
      
            }
               %>
               </ol></section>
                <img class="bgimg" src="images/message.jpg">
               <script type="text/javascript">
                   var objDiv = document.getElementById("discussion");
                   objDiv.scrollTop = objDiv.scrollHeight;
               </script>
             <!--  <div style="float: right"><img src="images/message.jpg" alt="message"></div> -->
        <footer class="msgg"><form method="post" action="sendmessage"><input type="hidden" name="toid" value="<%=uid%>"><textarea class="msg"  name="msg" id="msg" placeholder="Enter your message here "></textarea><input type="submit" value="Send" class="sendButton"></form><br>
        </footer></div>
       </td></tr></table>
    </body>
</html>
