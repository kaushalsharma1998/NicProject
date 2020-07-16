<%@page import="controller.Validateadmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Username</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>


  
</head>


<body>
<%@ include file="nav-bar-profile.jsp" %>
<% //if(session.getAttribute("adminu")==null||session.getAttribute("adminp]")==null) 
	//response.sendRedirect("adminlogin.jsp");


%>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row  justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" action="updateusernamead.jsp" method="post">
  <h1>Update Username</h1>
    <div class="form-group">
    <label for="Username"> New Username</label>
    <input type="text" class="form-control"  name="nusername"  id="nusername" placeholder="Enter  new username" required="required">
 </div>
  <br>
<div id="isupdated"></div>  
  <button type="submit"  name="submit" id="submit" class="btn btn-primary btn-customized">Submit</button>
   <button type="reset" class="btn btn-primary btn-customized">Reset </button>
</form>

</div>

  </div>
  </div>
  <% if(request.getParameter("nusername")!=null )
  {
	   int rs= new  Validateadmin().updateusername(request.getParameter("nusername"));
	  if(rs==1)
	  { session.setAttribute("adminu", request.getParameter("nusername") );
	    out.println("<script>alert('Username Succesfullly Updated'); window.location.href = 'admin.jsp';</script>");
	  }
	  else{
		  out.println("<script>alert('Something went wrong, try again !'); </script>");
	  }
  
  }
  
  %>
  
</body>
</html>