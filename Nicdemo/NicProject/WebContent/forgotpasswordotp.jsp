

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
</head>
<body>
<%
if(session.getAttribute("username")==null)
{ response.sendRedirect("forgotpassword.jsp");

}
%>
<%@ include file="nav-bar.jsp" %>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row  justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" action="forgetpasswordauth.jsp" method="post">
  <h1>Forget  Password</h1>
    <div class="form-group">
    <label for="otp">Enter OTP</label>
    <input type="number" class="form-control"  name="otp"  id="otp" placeholder="Enter otp" required="required">
  	<%if(session.getAttribute("isotp")!=null&&(Boolean)session.getAttribute("isotp")==false) 
  		out.print("<div style='color:#ff0000'>Incorrect OTP</div>");
  		session.removeAttribute("isotp");
  		%>
  </div>
  
  <div class="form-group">
    <label for="password"> New  Password</label>
    <input type="password"  name="password" class="form-control" id="password" placeholder="Password" required="required">
  </div>
  <div class="form-group">
    <label for="rpassword"> Retype  New Password</label>
    <input type="password"  name="rpassword" class="form-control" id="rpassword" placeholder=" Retype Password" required="required">
  </div>
  
 <!--  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="rememberme">
    <label class="form-check-label" for="rememberme">Remember me </label>
  </div> --><br>
<div id="isupdated"></div>  
  <button type="submit"  name="submit" id="submit" class="btn btn-primary btn-customized">Submit</button>
   <button type="reset" class="btn btn-primary btn-customized">Reset </button>
</form>

</div>

  </div>
  </div>
<%
if(session.getAttribute("isupdated")!=null&&(Integer)session.getAttribute("isupdated")==-20)
{ session.removeAttribute("isupdated");
%>
<script>
document.getElementById("isupdated").innerHTML ="New Password Cannot Be Same As Last Three Paawords";
document.getElementById("isupdated").style.color = "#ff0000";
</script>
<% }
if(session.getAttribute("isupdated")!=null&&(Integer)session.getAttribute("isupdated")==1)
{
	session.removeAttribute("isupdated");
%>
<script>
alert("Succesfully Updated Password, Redirecting to login");

setTimeout(function(){window.location = 'login.jsp';}, 0); 
</script>

<%

}

%>



















</body>
</html>