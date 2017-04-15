<%-- 
    Document   : detail_updation
    Created on : Dec 29, 2014, 5:55:51 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>detail updation</title>
    </head>
    <body>
        <%
        HttpSession ses=request.getSession();
        int loggeduid= (Integer) ses.getAttribute("loggeduid");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        Statement st=con.createStatement();
        String about_me=request.getParameter("aboutme");
        String edu=request.getParameter("education");
        String rel=request.getParameter("relationship");
        String oprofile=request.getParameter("other_profile");
        String det=request.getParameter("detail");
        if(det.equals("about")) {
            st.executeUpdate("update user set about_me='"+about_me+"' where userid="+loggeduid);
            response.sendRedirect("myhood.jsp");
            }
        else if(det.equals("basic")) {
            st.executeUpdate("update user set education='"+edu+"',relationship='"+rel+"',other_profiles='"+oprofile+"' where userid="+loggeduid);
            response.sendRedirect("myhood.jsp");
            }
        else {
        %>
        <script type="text/javascript">
            alert('Update failed!<%=det%>')
        </script>
        <%
        
        }
        %>
    </body>
</html>
