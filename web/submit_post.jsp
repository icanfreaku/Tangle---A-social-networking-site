<%-- 
    Document   : submit_post
    Created on : Jan 21, 2015, 7:27:27 AM
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
        String subject=request.getParameter("subject");
        String post=request.getParameter("content");
        %>
        <script type="text/javascript" src="js/jquery-1.11.0.min.js">
            function htmlEncode(value){
                if (value) {
                    return jQuery("<div />").text(value).html();
                }
                else {
                    return ;
                }
            }
       <%
        Statement st=con.createStatement();
        st.executeUpdate("insert into posts(subject,post,userid) values ('"+subject+"','"+post+"',"+loggeduid+")");
        response.sendRedirect("home.jsp");

       %>
                  alert(htmlEncode('<%=post%>'));
        </script>
     
    </body>
</html>
