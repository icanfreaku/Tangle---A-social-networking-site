<%-- 
    Document   : f_req
    Created on : Dec 10, 2014, 10:57:13 PM
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
        String loggeduid=request.getParameter("luid");
        String uid=request.getParameter("fuid");
        Statement st=con.createStatement();
        st.executeUpdate("insert into frequest(userid,fid) values ("+loggeduid+","+uid+")");
        response.sendRedirect("hood.jsp?uid="+uid); %>
       </body>
</html>
