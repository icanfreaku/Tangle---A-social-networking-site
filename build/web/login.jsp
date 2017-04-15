<%-- 
    Document   : login
    Created on : Nov 27, 2014, 9:16:02 PM
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
        <script type="text/javascript" language="javascript">
        <%
        try {
            String email=request.getParameter("emailid");
            String pass=request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
            String query="select emailid,password from user";
            PreparedStatement pst=con.prepareStatement(query);
            ResultSet res=pst.executeQuery();
            while(res.next()) {
                String e=res.getString("emailid");
                String p=res.getString("password");
                if(e.equals(email)&& p.equals(pass)) {
                    HttpSession ses=request.getSession();
                    session.setAttribute("emailid",email);
                    response.sendRedirect("myhood.jsp");
                }
                }
            %>
                            alert("Email or Password incorrect!"); 
        <%
        response.sendRedirect("index.jsp");
            }
       
catch(Exception e) {
    %>
        alert("Login failed!")
    </script>
        <%
                    }
        %>
    </body>
</html>
