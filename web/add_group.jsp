<%-- 
    Document   : add_group
    Created on : Jan 24, 2015, 1:10:09 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Group</title>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        HttpSession ses=request.getSession();
        int loggeduid=(Integer) ses.getAttribute("loggeduid");
        String grpname=request.getParameter("grpname");
        Statement st=con.createStatement();
        st.executeUpdate("insert into groups(group_name,created_by) values('"+grpname+"','"+loggeduid+"')");
        PreparedStatement pst=con.prepareStatement("select group_id from groups where created_by="+loggeduid+" and created_time=( select MAX(created_time) from groups where created_by="+loggeduid+")");
        ResultSet res=pst.executeQuery();
        res.first();
        int group_id=res.getInt("group_id");
        st.executeUpdate("insert into group_relation(userid,group_id) values("+loggeduid+","+group_id+")");
        response.sendRedirect("myhood.jsp");


        %>
</body>
</html>
