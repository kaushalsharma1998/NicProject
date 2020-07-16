<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

  
</head>
<body>
<script>
	function myFunction() {
	    var x = document.getElementById("password");
	    if (x.type === "password") {
	        x.type = "text";
	    } else {
	        x.type = "password";
	    }
	}
	
	
		
</script>
<%
//response.sendRedirect("myprofile.jsp");
//System.out.println(request.getAttribute("isloggedin"));

if(session.getAttribute("isloggedin")!=null&& (Integer)session.getAttribute("isloggedin")==1)
{   //System.out.println("hellologin");
	response.sendRedirect("myprofile.jsp");
	}

else{
	
%>
<%@ include file="nav-bar.jsp" %>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row  justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" id="form" action="authenticator.jsp" method="post">
  <h1>Login Here</h1>
  
  <div class="form-group">
    <label for="username">Username/Email</label>
    <input type="text" class="form-control" name="username"id="email" placeholder="Email/Username" required="required">
  </div>
   
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required="required">
  <a  href="forgotpassword.jsp" >Forgot Password?</a>
  </div>
  <div id="isblocked"></div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" onclick="myFunction();" id="showpassword">
    <label class="form-check-label" for="showpassword">Show Password </label>
     
</div>
  
  <div class="form-check">
    <input type="checkbox" class="form-check-input"  id="rememberme">
    <label class="form-check-label" for="rememberme">Remember me </label>
  
  </div> 
 
  <div>
       <label for="captchaCode">Retype the characters from the picture:</label>

      <!-- Adding BotDetect Captcha to the page -->
      <%
        Captcha captcha = Captcha.load(request, "exampleCaptcha");
        captcha.setUserInputID("captchaCode");
        String captchaHtml = captcha.getHtml();
        out.write(captchaHtml);
      %>

      <div class="validationDiv">
        <input name="captchaCode" type="text" id="captchaCode" required="required" />
        
     
  
        
          <%
          // when the form is submitted
          
            // validate the Captcha to check we're not dealing with a bot
            if((session.getAttribute("ishuman")!=null&&(Boolean)session.getAttribute("ishuman")==false)){
            	out.print("<span class=\"correct\" style='color:red;'> Incorrect  code </span>");
				              
            	// Captcha validation failed, show error message
             
              
           // } else if((session.getAttribute("ishuman")!=null&&(Boolean)session.getAttribute("ishuman")==true)) {
              // Captcha validation passed, perform protected action
             // out.print("<span class=\"correct\">Correct code</span>");
              //out.print("<script>$(document).ready(function(){var $submitBtn = $('#submit1');$submitBtn.removeAttr('disabled');});</script>");
            }
            
        session.removeAttribute("ishuman");
          
        %>
   </div>
  </div>
  
  <button type="submit"  name="submit1" style="margin-top:10px;" id="submit1"  form="form" class="btn btn-primary btn-customized" >Submit</button>   
  </form>  
  
  </div>
  
  </div>
  
  
   </div>
  
  
  
  
  
  
  
  
 <% if((session.getAttribute("auth")!=null&&(Integer)session.getAttribute("auth")==20)){ %>  
   
<script>

document.getElementById("isblocked").innerHTML ="User Blocked , Please Contact admin";
document.getElementById("isblocked").style.color = "#ff0000";

</script>
<% } if((session.getAttribute("auth")!=null&&(Integer) session.getAttribute("auth")>0&&(Integer) session.getAttribute("auth")!=20)){%>
<script>
document.getElementById("isblocked").innerHTML ="Wrong Password/Capctha, Attempts remaining " + "<%=(Integer)session.getAttribute("auth")%>";
document.getElementById("isblocked").style.color = "#ff0000";


</script>
 
 <% }if((session.getAttribute("auth")!=null&&(Integer) session.getAttribute("auth")==-2)){%>
<script>
document.getElementById("isblocked").innerHTML ="User Not registered, pls click on register";
document.getElementById("isblocked").style.color = "#ff0000";
//setTimeout(function(){window.location = "index.jsp";}, 3000);
</script>
	<%
	
 
 
 }
session.removeAttribute("auth");
session.removeAttribute("isblocked");
}%>	





 























 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>