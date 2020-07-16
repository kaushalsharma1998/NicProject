<%@page import="controller.Sendmail"%>
<%@page import="controller.Forgotpassword"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
</head>
<body>

<%@ include file="nav-bar.jsp" %>

<body>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" id="form" action="forgotpassword.jsp" method="post">
  <h1>Forgot Password</h1>
  
  <div class="form-group">
    <label for="username">Enter your username</label>
    <input type="text" class="form-control" name="username"id="email" placeholder="Username" required="required">
  </div>
  <div id="iscorrect"></div>  
  
  <button type="submit"  name="submit1" style="margin-top:10px;" id="submit1"  form="form" class="btn btn-primary btn-customized" >Submit</button>   
  </form>    
  </div>
  </div>
  
  
   </div>
   <%
String username= request.getParameter("username");
int result=0;
   if(username!=null)   
 result= new Forgotpassword().forgotpassworduservalidate(username);
if(result==0&&username!=null)
{
%>
<script>
document.getElementById("iscorrect").innerHTML ="User not registered";
document.getElementById("iscorrect").style.color = "#ff0000";
</script>
	
<%}

if(result==2&&username!=null)
{
%>
<script>
document.getElementById("iscorrect").innerHTML ="You are blocked please contact admin";
document.getElementById("iscorrect").style.color = "#ff0000";
</script>
	
<%}




if(username!=null&&result==1)
{
session.setAttribute("username", username);
Sendmail sm=new Sendmail();
boolean issent =sm.sendmail(username);
int  token=sm.gettoken();
session.setAttribute("token", token);
if(issent==true){
%>

<script>
alert("Sending email , Enter otp on next page");
setTimeout(function(){window.location = 'forgotpasswordotp.jsp';}); 
</script>

<%

}}

%>
</body>
</html>