<%-- 
    Document   : regconfirm
    Created on : Nov 27, 2014, 7:54:34 PM
    Author     : sumitha
--%>

<%@page import="java.sql.*;"%>
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
           try {
            String email=request.getParameter("emailid");
            Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        Statement st=con.createStatement();
            st.executeUpdate("insert into user(fname,lname,emailid,password,gender,age,dob)values('"+request.getParameter("fname")+"','"+request.getParameter("lname")+"','"+request.getParameter("emailid")+"','"+request.getParameter("password")+"','"+request.getParameter("gen")+"','"+Integer.parseInt(request.getParameter("age"))+"','"+request.getParameter("dob")+"')");
                %>
                <script type="text/javascript">
                            alert("Registration Successful!");
                            window.location="index.jsp";
                                            </script>

                <%
    
        }
           catch(Exception e) {
               response.sendRedirect("signup.jsp");
               }


        %>
    </body>
</html>
