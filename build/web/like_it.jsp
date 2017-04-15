<%-- 
    Document   : like_it
    Created on : Feb 2, 2015, 7:32:07 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
         HttpSession ses=request.getSession();
        int loggeduid=(Integer) ses.getAttribute("loggeduid");
         String post_id=request.getParameter("post_id");
        Statement st=con.createStatement();
        st.executeUpdate("insert into thumbs_up(userid,post_id) values ("+loggeduid+","+post_id+")");
        response.sendRedirect("photos.jsp?"); %>

       %>

    </body>
</html>
