<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="bean.Resetattempts" %>
<%
int rs=0;
String username=request.getParameter("uname");

	
if(username!=null||session.getAttribute("adminu")!=null){
rs= new Resetattempts().resetattempts(username);}
if(rs<0)
{	
%>
<script>
alert("Some error occured");
</script>
<%
}

response.sendRedirect("admin.jsp");

%>
</body>
</html>