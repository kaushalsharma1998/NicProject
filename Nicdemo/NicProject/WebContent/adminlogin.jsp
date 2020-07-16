<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<%@ include file="nav-bar.jsp" %>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<body>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" id="form" action="adminauthenticator.jsp" method="post">
  <h1> Admin Login </h1>
  
  <div class="form-group">
    <label for="username">Admin Username</label>
    <input type="text" class="form-control" name="username"id="email" placeholder="Admin/Username" required="required">
  </div>
   
  <div class="form-group">
    <label for="password"> Admin Password</label>
    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required="required">
  </div>
   <div id="isblocked"></div>
  
  
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
            	out.print("<span class=\"correct\" style='color:red;'> Incorrect  code</span>");
				              
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
<% 
 if((session.getAttribute("isincorrect")!=null&&(Boolean)session.getAttribute("isincorrect")==true)) { %>  

<script>

document.getElementById("isblocked").innerHTML ="Incorrect Password";
document.getElementById("isblocked").style.color = "#ff0000";

</script>

<% 
}
session.removeAttribute("isincorrect");
session.removeAttribute("ishuman");
%>
  
</body>
</html>