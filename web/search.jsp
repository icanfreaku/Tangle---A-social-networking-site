<%-- 
    Document   : search
    Created on : Jun 30, 2014, 11:23:13 PM
    Author     : sumitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" src="login.css">
        <link rel="stylesheet" type="text/css" href="css.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="searchbox.css"/>

<link rel="stylesheet" type="text/css" href="login.css">
        <title>tangle.com | Search</title>
        <style type="text/css">
            span {
                color  : red;
                
}
            #searchres {

                width: 500px;
                padding: 10px;
                border:1px solid #f7c7c9;
               margin-left: 120px;
               margin-top: -20px;
                -webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.3);
}
#res {
	margin-left: 5px;
        color: #222;
	font: 20px 'LeagueGothicRegular';
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
       %>
        <div id="searchres">
            <%
        String search=request.getParameter("search");
        %>    	
        <font size="5">Search for "<%=search%>"</font>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        PreparedStatement pst=con.prepareStatement("SELECT userid,fname,lname,dp,age,gender FROM USER WHERE lname LIKE '%"+search+"%';");
        ResultSet res=pst.executeQuery();
        PreparedStatement  pst2=con.prepareStatement("select * from user where fname LIKE '%"+search+"%' OR lname LIKE '%"+search+"%'");
       ResultSet res2=pst2.executeQuery();
       
        while(res2.next()) {
            int userid=Integer.parseInt(res2.getString("userid"));
            String fdp=res2.getString("dp");
            String ffname=res2.getString("fname");
            String flname=res2.getString("lname");
            String fgender=res2.getString("gender");
            int fage=Integer.parseInt(res2.getString("age"));
            String fdob=res2.getString("dob");
            %>
           <div id="res" style=' width: 400px; padding : 15px; background-color: #f7c7c9'>
               <a href="hood.jsp?uid=<%=userid%>">
                   <img src="<%=fdp%>" width=50 height=50>
                   <h3><%out.println(ffname+" "+flname);%></h3>
                   <p><%out.println(fgender+" "+fage);%></p>
               </a>
           </div><br>
               <%
          }
       if(!res2.first()) {
           out.println("<br><br><font size=4 color=#999999>Sorry no results</font>");
       }

        %>

        <script type="text/javascript" src="js/jquery-1.11.0.min.js">
            $('#res').each(function(){
            var search = $(this).text().replace(/ar /g,"<span>ar </span>");
            $(this).html(search);
           });
        </script>
        
        </div>
    </body>
</html>
