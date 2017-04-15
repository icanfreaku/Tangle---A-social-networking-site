<%-- 
    Document   : test
    Created on : Dec 29, 2014, 12:51:38 PM
    Author     : sumitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    

   
        <title>JSP Page</title>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="">
                  $("#showarea").click(function(){
        $("#textarea, #textarea-ok").show();
    });
    $("#textarea-ok").click(function(){
        $("#textarea, #textarea-ok").hide();
    });
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
              
   <button id="showarea" name="showarea" type="button">Show Textarea</button>
<textarea id="textarea" name="text"></textarea>
<button id="textarea-ok" name="ok" type="button">Ok</button>
 About me<sup><a href="javascript:hideshow(document.getElementById('adiv'))">Edit</a></sup>
      
    </body>
</html>
