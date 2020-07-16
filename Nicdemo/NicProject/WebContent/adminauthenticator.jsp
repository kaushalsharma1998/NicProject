<%@page import="controller.Validateadmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
</head>
<body>
<% 
Captcha captcha = Captcha.load(request, "exampleCaptcha");
         // when the form is submitted
         
           // validate the Captcha to check we're not dealing with a bot
            
           boolean ishuman= captcha.validate(request.getParameter("captchaCode"));
           
if(!ishuman)
{ session=request.getSession(true);
  session.setAttribute("ishuman", false);
  response.sendRedirect("adminlogin.jsp");	
}
else{
String adminuu=request.getParameter("username");
String  adminpu=request.getParameter("password");
if(adminuu==null||adminpu==null)  
	{response.sendRedirect("adminlogin.jsp");} 
boolean rs=new Validateadmin().validate(adminuu, adminpu);
if(!rs)
{	
	session= request.getSession();
  	session.setAttribute("isincorrect", true);
  	response.sendRedirect("adminlogin.jsp");
  	 
}
else{
session=request.getSession(true);
session.setAttribute("adminu", adminuu);
session.setAttribute("adminp", adminpu);
response.sendRedirect("admin.jsp");
}
}
%>
</body>
</html>