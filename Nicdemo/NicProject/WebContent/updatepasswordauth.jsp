<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
if(session.getAttribute("username")==null||session.getAttribute("password")==null)
{
	response.sendRedirect("login.jsp");
}

String newpassword=request.getParameter("password");
String oldpassword=request.getParameter("current_password");
String  op=(String)session.getAttribute("password");
System.out.println(op);
System.out.println(oldpassword);
System.out.println(oldpassword.equals(op));
if(oldpassword.equals(op)==false)
{
	session.setAttribute("isupdated", -10);
	response.sendRedirect("updatepassword.jsp"); 	
}	
else{
String username=(String)session.getAttribute("username");

int rs= new controller.Updatepassword().updatepassword(username, newpassword, oldpassword);
if(rs>0)
	session.setAttribute("password", newpassword);

 session.setAttribute("isupdated", rs);
 response.sendRedirect("updatepassword.jsp"); 	
	
}
%>

</body>
</html>