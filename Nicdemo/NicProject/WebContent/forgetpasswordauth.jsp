<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("username")==null||session.getAttribute("token")==null)
{ response.sendRedirect("forgetpassword.jsp");
	}
else{
	int otp=Integer.parseInt(request.getParameter("otp"));
	String username=(String)session.getAttribute("username");
	int token=(Integer)session.getAttribute("token");
	String newpassword=request.getParameter("password");
	
	if(otp!=token)
	{session.setAttribute("isotp", false);
	response.sendRedirect("forgotpasswordotp.jsp");}	
	else{
	int rs= new controller.Forgotpassword().updatepassword(username, newpassword);
	session.setAttribute("isupdated", rs);
	response.sendRedirect("forgotpasswordotp.jsp");
	}
	
	
	 	
		
	
	
}
%>

</body>
</html>