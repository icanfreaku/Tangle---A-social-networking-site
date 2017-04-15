<%-- 
    Document   : signup
    Created on : Nov 27, 2014, 7:30:57 PM
    Author     : sumitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style type="text/css">
             body {
}

.form {
    font-family: "Varela Round", Arial, Helvetica, sans-serif;
	font-size: 16px;
    margin-left : 15%;
    margin-right : 5%;
    width : 45%;
    height : auto;
    padding : 10px 25px 25px 15px;
	background-color : #F5ECCE;
    position : relative;
    box-shadow : 0 2px 4px black;
    background-clip : padding-box;
	line-height: 1.5em;
}

input,textarea{
	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
	border:2px solid #456879;
	border-radius:10px;

	}
@import url(http://fonts.googleapis.com/css?family=Capriola);

#login {
	margin: 50px auto;
	width: 1000px;
}

#login h2 {
	background-color: #f95252;
	-webkit-border-radius: 20px 20px 0 0;
	-moz-border-radius: 20px 20px 0 0;
	border-radius: 20px 20px 0 0;
	color: #fff;
	font-size: 28px;
	padding: 20px 26px;
}

#login h2 span[class*="fontawesome-"] {
	margin-right: 14px;
}

#login input {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#login input input[type="email"], #login input input[type="password"]  {
	background-color: #eee;
	color: #777;
	padding: 4px 10px;
	width: 328px;
}
textarea{
	background-color: #eee;
	color: #777;
	padding: 4px 10px;

}
fieldset{
    border: none;
}
#login fieldset input[type="submit"]  {
	background-color: #33cc77;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 150px;

}

#login fieldset input[type="submit"] :hover {
	background-color: #28ad63;

}


        </style>
    </head>
    <body>
        <img src="images/logo.PNG" alt="logo" height="100" width="210"><br>
        Connect and get tangled with your friends.
                <table><tr><td>
        <div id="login">
            <div class="form">
        <h2>Sign Up</h2>
        <form name="regform" action="regconfirm.jsp" method="post">
        <table>
            <tr>
                <td class="label">First name : </td><td><input type="text" name="fname" required></td>
            </tr>
            <tr>
                <td class="label">Last name : </td><td><input type="text" name="lname" required></td>
            </tr>
            <tr>
                <td class="label">Email id : </td><td><input type="text" name="emailid" required></td>
            </tr>
            <tr>
                <td class="label">Create Password : </td><td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td class="label">Gender : </td><td><select name="gen"><option>Male</option><option>Female</option></select>
            </tr>
            <tr>
                <td class="label">Age : </td><td><input type="text" name="age" required></td>
            </tr>
            <tr>
                <td class="label">Date of birth : </td><td><input type="text" name="dob" placeholder="yyyy-mm-dd" required></td>
            </tr>
               <tr><td>
                    <fieldset>
                <input type="submit" value="Create Account">
                    </fieldset>
        </td>
            <td> <a class="signup" href="index.jsp">Already have an account? Log in</a></td>
            </tr></table>
        </form></div></div><td style="position: absolute; left: 680px; top: 10px"><img src="images/sign.jpg" width="600px"></td></tr></table>
    </body>
</html>
