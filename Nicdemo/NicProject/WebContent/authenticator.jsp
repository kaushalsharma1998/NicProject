
<%@page import="dba.DBconfig"%>
<%@page import="controller.Validator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->

    
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

  
</head>
<body>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>

  <% 
  if(session.getAttribute("isloggedin")!=null&&(Integer)session.getAttribute("isloggedin")==1)
  {  //System.out.println("helloauth");
	  response.sendRedirect("myprofile.jsp"); }
  int rss=0;
Captcha captcha = Captcha.load(request, "exampleCaptcha");
          // when the form is submitted
          
            // validate the Captcha to check we're not dealing with a bot
             
            boolean ishuman= captcha.validate(request.getParameter("captchaCode"));
            
            
  
  
  if(ishuman==true){
     String username=request.getParameter("username"); 
     String password=request.getParameter("password");
     int block;
     int rs=0;
    rs= new Validator().validator(username, password);
    
     if(rs==10){
	  
 	  session.setAttribute("username", username);
 	  session.setAttribute("password", password);    
	  session.setAttribute("isloggedin", 1);
	  //System.out.println((Integer)session.getAttribute("isloggedin"));
	  //System.out.println("helloauth");
 	  response.sendRedirect("myprofile.jsp");
    	}
    	else if(rs==20||rs>0){
    	
    	if(rs==20)
    	  {
    	  session.setAttribute("auth", 20);
    	  response.sendRedirect("login.jsp");
    	  }
    	 else{
    		 
        	  session.setAttribute("auth", rs);
        	  response.sendRedirect("login.jsp");
        	  
    	  } 
    	}
     
    	else if(rs==-2){
      	  
      	  session.setAttribute("auth", -2);
      	  response.sendRedirect("login.jsp");
      	}
  } 
  else 
  {
	  String username=request.getParameter("username"); 
	     String password=request.getParameter("password");
	     int block;
	     int rs=0;
	    rs= new Validator().captchaattempts(username);
	    
	  
    	  
	  
	   
	    session.setAttribute("ishuman", ishuman);
	    {
	    	
	    	if(rs==20)
	    	  {
	    	  session.setAttribute("auth", 20);
	    	  }
	    	 else{
	    		  
	        	  
	    		  session.setAttribute("auth", rs);
	        	  
	    	  } 
	    	}
	    response.sendRedirect("login.jsp");
	    
  } 		
  
  
  %>




















\</body>
</html>