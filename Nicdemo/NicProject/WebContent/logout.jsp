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
session=request.getSession(false);
session.removeAttribute("isloggedin");
session.removeAttribute("auth");
session.removeAttribute("ishuman");
session.removeAttribute("username");
session.removeAttribute("password");
if(session.getAttribute("adminu")!=null||session.getAttribute("adminp")!=null)
{session.removeAttribute("adminu");
session.removeAttribute("adminp");
}
session.invalidate();

response.sendRedirect("login.jsp");%>
</body>
</html>