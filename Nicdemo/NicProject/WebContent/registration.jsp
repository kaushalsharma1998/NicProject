<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
<script>
function my_func(rs){
	if(rs>0)
	{	alert("Succesfully registered now login")
		document.write("Redirecting to the login in 3 seconds..."); 
        setTimeout(function(){window.location ="login.jsp";} , 3000); 
		
	}
		else 
		{	alert("Could not register , email already in use please use different email or login")
		document.write("Redirecting to the regsitration in 3 seconds..."); 
        setTimeout(function(){window.location = "index.jsp";}, 3000); 
	}
} </script>

 <jsp:useBean id="sample" class="bean.UserBean" scope="page">
   <jsp:setProperty name="sample" property="*"/>
   </jsp:useBean>
   <%!int rs; %>
   <%rs=sample.insert();%>
   
<script>my_func(<%=rs%>)</script>


</body>
</html>