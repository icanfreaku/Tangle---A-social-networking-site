<%-- 
    Document   : UploadPhoto
    Created on : Feb 1, 2015, 12:41:48 AM
    Author     : sumitha
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
 HttpSession ses=request.getSession();
 int uid= (Integer) ses.getAttribute("loggeduid");
 String caption=null;
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/tangledb","root","admin");
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = "C:/Users/sumitha/Documents/NetBeansProjects/tangle/web/images/photos/";

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("C:/Users/sumitha/Documents/NetBeansProjects/tangle/web/images/photos/"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>Photo upload</title>");
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () )
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath +
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath +
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            out.println("Uploaded Filename: " + filePath +
            fileName + "<br>");
            String photo_src="images/photos/"+fileName;
            Statement st=con.createStatement();
            st.executeUpdate("insert into photos(photo_src,caption,created_by) values ('"+photo_src+"','"+caption+"',"+uid+")");

            }
            else if(fi.isFormField()) {
                String name=fi.getFieldName();
                caption=fi.getString();
                }

      }
         out.println("</body>");
         out.println("</html>");
         response.sendRedirect("photos.jsp");

      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("</head>");
      out.println("<body>");

      out.println("<p>No file uploaded</p>"+caption);
      out.println("</body>");
      out.println("</html>");
      response.sendRedirect("myhood.jsp");
   }

%>
