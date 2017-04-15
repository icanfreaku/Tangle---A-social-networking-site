package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;

public final class myhood_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/reset.css\"/>\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\"/>\n");
      out.write("     <link rel=\"stylesheet\" type=\"text/css\" href=\"login.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"searchbox.css\"/>\n");
      out.write("     <link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=Open+Sans:400,600,300,800,700,400italic|PT+Serif:400,400italic\"/>\n");
      out.write("\n");
      out.write("        <title>Your hood </title>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            #fullname {\n");
      out.write("               color: #f95252;\n");
      out.write("               float: right;\n");
      out.write("               margin-right: 185px;\n");
      out.write("               font-family: sans-serif;\n");
      out.write("               font-size: 25px;\n");
      out.write("               font-weight: bolder;\n");
      out.write("}\n");
      out.write("#det2 {\n");
      out.write("    color: black;\n");
      out.write("    font-family: sans-serif;\n");
      out.write("    font-size: 16px;\n");
      out.write("    float: right;\n");
      out.write("    margin-top: -165px;\n");
      out.write("    margin-right: 95px;\n");
      out.write("}\n");
      out.write("#head {\n");
      out.write("    width: 500px;\n");
      out.write("    padding: 20px 20px;\n");
      out.write("    border-style: dotted;\n");
      out.write("    border-color: purple;\n");
      out.write("    background-color: thistle;\n");
      out.write("}\n");
      out.write("   #users {\n");
      out.write("        width: 400px;\n");
      out.write("    border: 4px solid red;\n");
      out.write("    padding: 20px;\n");
      out.write("    overflow: hidden;\n");
      out.write("}\n");
      out.write("#users img {\n");
      out.write("    margin-right: 15px;\n");
      out.write("    float: left;\n");
      out.write("}\n");
      out.write("        </style>\n");
      out.write("        <script src=\"js/jquery-1.11.0.min.js\" type=\"text/javascript\">\n");
      out.write("                $(\"#textarea, #textarea-ok\").hide(); // or you can have hidden w/ CSS\n");
      out.write("    $(\"#showarea\").click(function(){\n");
      out.write("        $(\"#textarea, #textarea-ok\").show();\n");
      out.write("    });\n");
      out.write("    $(\"#textarea-ok\").click(function(){\n");
      out.write("        $(\"#textarea, #textarea-ok\").hide();\n");
      out.write("    });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <div align=\"right\" style=\"position: relative; top:-70px; background-color: black\">\n");
      out.write("             <form class=\"form-wrapper cf\" action=\"search.jsp\" method=\"get\">\n");
      out.write("                         <input name=\"search\" type=\"text\" placeholder=\"Search tangle\" required>\n");
      out.write("                            <button type=\"submit\">Search</button>\n");
      out.write("               </form></div>\n");
      out.write("        <div class=\"tanglelogo\"> <img src=\"images/logo.PNG\" width=\"180\" height=\"80\" alt=\"logo\"></div>       \n");
      out.write("        ");

        HttpSession ses=request.getSession();
        String email=(String) ses.getAttribute("emailid"); 
      out.write("\n");
      out.write("              <div class=\"login-area\">\n");
      out.write("           ");

       if(email==null){
           
      out.write("\n");
      out.write("           <script type=\"text/javascript\">\n");
      out.write("               alert(\"Please login to continue\");\n");
      out.write("               window.location=\"index.jsp\";\n");
      out.write("           </script>\n");
      out.write("           ");

           }
       else {
           out.println("<a class=login-link href=myhood.jsp>"+email+"</a> | ");
           
      out.write("\n");
      out.write("           <a class=\"login-link\" href=\"index.jsp\">Logout</a></div>\n");
      out.write("                   ");

           }

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
        //String query="select * from user where emailid="+email;
        Statement st=con.createStatement();
        Statement st2=con.createStatement();
        PreparedStatement pst=con.prepareStatement("select * from user where emailid='"+email+"'");
        ResultSet res=pst.executeQuery();
        res.first();
        int loggeduid=Integer.parseInt(res.getString("userid"));
        session.setAttribute("loggeduid",loggeduid);
        String dp=res.getString("dp");
        String fname=res.getString("fname");
        String lname=res.getString("lname");
        String gender=res.getString("gender");
        int age=Integer.parseInt(res.getString("age"));
        String  dob=res.getString("dob");
        
        
      out.write("\n");
      out.write("\n");
      out.write("        <section id=\"container\">\n");
      out.write("\t\t\t<header>\n");
      out.write("            \t<!-- Logo -->\n");
      out.write("            \t<div id=\"logo\">\n");
      out.write("                \t<h2>");
out.println(fname+" "+lname);
      out.write("</h2>\n");
      out.write("                    <h4>GRAPHIC & WEB DESIGNER</h4>\n");
      out.write("                </div>\n");
      out.write("                <!-- /Logo -->\n");
      out.write("\n");
      out.write("                </header>\n");
      out.write("            <!-- /Header -->\n");
      out.write("\n");
      out.write("            <!-- Content -->\n");
      out.write("            <section id=\"content\" >\n");
      out.write("\n");
      out.write("                <!-- Profile -->\n");
      out.write("                <div id=\"profile\">\n");
      out.write("                 \t<!-- About section -->\n");
      out.write("                \t<div class=\"about\">\n");
      out.write("                    \t<div class=\"photo-inner\">\n");
      out.write("                            <ul>\n");
      out.write("                                <li><img src=");
      out.print(dp);
      out.write(" height=\"186\" width=\"153\" /></li>\n");
      out.write("                                <form method=\"post\" action=\"UploadFile.jsp\" enctype=\"multipart/form-data\">\n");
      out.write("                                    <input type=\"hidden\" name=\"uid\" value=\"");
      out.print(loggeduid);
      out.write("\"><input type=\"file\" name=\"photo\" value=\"Choose photo\" size=\"50\"/><br><input style=\"font-size: small\" type=\"submit\" value=\"Set Profile picture\">\n");
      out.write("                                </form>\n");
      out.write("\n");
      out.write("                           </ul>\n");
      out.write("                        </div>\n");
      out.write("                        <h1>");
out.println(fname+" "+lname);
      out.write("</h1>\n");
      out.write("                        <h3>");
out.println(gender+", "+age+"yrs");
      out.write("</h3>\n");
      out.write("                        <br><a class=\"messb\" href=\"messages.jsp?\">Messages</a>\n");
      out.write("                        </div>\n");
      out.write("                     <!-- /About section -->\n");
      out.write("\n");
      out.write("                    <!-- Personal info section -->\n");
      out.write("                \t<ul class=\"personal-info\">\n");
      out.write("\t\t\t\t\t\t<li><label>Name</label><span>");
out.println(fname+" "+lname);
      out.write("</span></li>\n");
      out.write("                        <li><label>Birthday</label><span>");
out.println(dob);
      out.write("</span></li>\n");
      out.write("                        <li><label>Address</label><span>Melbourne Victoria 3000 Australia</span></li>\n");
      out.write("                        <li><label>Email</label><span class=\"word-wrap\">Anderson.smith@gmail.com</span></li>\n");
      out.write("                        <li><label>Phone</label><span>+123 456 789 111</span></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <!-- /Personal info section -->\n");
      out.write("                </div>\n");
      out.write("                <!-- /Profile -->\n");
      out.write("\n");
      out.write("                <!-- Menu -->\n");
      out.write("                <div class=\"menu\">\n");
      out.write("                \t<ul class=\"tabs\">\n");
      out.write("                        <li class=\"tmenu\"><a href=\"#profile\" class=\"tab-profile\"><i>&#x43;</i>Profile</a></li>\n");
      out.write("                        <li class=\"tmenu\"><a href=\"#resume\"><i>&#x3a;</i>Resume</a></li>\n");
      out.write("                        <li class=\"tmenu\"><a href=\"#portfolio\"><i>&#x38;</i>Portfolio</a></li>\n");
      out.write("                        <li class=\"tmenu\"><a href=\"#contact\"><i>&#x21;</i>Contact</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <a class=\"prev\" id=\"menu-prev\" href=\"#\">&#xe073;</a>\n");
      out.write("                    <a class=\"next\" id=\"menu-next\" href=\"#\">&#xe076;</a>\n");
      out.write("                </div>\n");
      out.write("             \n");
      out.write("                <table><tr>\n");
      out.write("    ");

    PreparedStatement pst3=con.prepareStatement("select userid from frequest where fid='"+loggeduid+"'");
        ResultSet res3=pst3.executeQuery();
        while(res3.next()) {
            int uid=Integer.parseInt(res3.getString("userid"));
            PreparedStatement pst4=con.prepareStatement("select fname,lname from user where userid="+uid);
            ResultSet res4=pst4.executeQuery();
            while(res4.next()){
                String name1=res4.getString("fname");
            out.println("<h4 style='background-color: #33cc77'>"+name1+" "+res4.getString("lname")+" sent you a request to be your friend");
               
      out.write("\n");
      out.write("                    <div class=\"addbutton\"><form id=\"frendform\" method=\"post\" action=\"f_accept\"><input type=\"hidden\" name=\"luid\" value=\"");
      out.print(loggeduid);
      out.write("\"><input type=\"hidden\" name=\"fuid\" value=\"");
      out.print(uid);
      out.write("\"><input style=\"background-color:coral; cursor: pointer\" type=\"submit\" name=\"addbutton\" value=\"Accept+\" onclick=\"alert('");
      out.print(name1);
      out.write(" added as your friend')\">\n");
      out.write("                 <br></h4>\n");
      out.write("                            </form></div>\n");
      out.write("                 <br>\n");
      out.write("                    ");

            }
            }
        
      out.write("\n");
      out.write("        <button id=\"showarea\" name=\"showarea\" type=\"button\">Show Textarea</button>\n");
      out.write("<textarea id=\"textarea\" name=\"text\"></textarea>\n");
      out.write("<button id=\"textarea-ok\" name=\"ok\" type=\"button\">Ok</button>\n");
      out.write("\n");
      out.write("                    ");

PreparedStatement pst5=con.prepareStatement("select userid from relation where fid=");
        PreparedStatement pst2=con.prepareStatement("select * from user");
        ResultSet res2=pst2.executeQuery();
        int rowno=1;
        while(res2.next()) {
            if(rowno%2!=0) {
                out.println("<tr>");
                }
            int userid=Integer.parseInt(res2.getString("userid"));
            String fdp=res2.getString("dp");
            String ffname=res2.getString("fname");
            String flname=res2.getString("lname");
            String fgender=res2.getString("gender");
            int fage=Integer.parseInt(res2.getString("age"));
            String fdob=res2.getString("dob");
            out.println("<div id=user><td><a href=hood.jsp?uid="+userid+"><img src="+fdp+" width=50 height=50><h3>"+ffname+" "+flname+"</h3>");
            out.println("<p>"+fgender+" "+fage+"</p></a></td></div>");
            if(rowno%2==0) {
                out.println("</tr>");
                }
            rowno++;
            }
            
        
      out.write("\n");
      out.write("           </table>\n");
      out.write("       \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
