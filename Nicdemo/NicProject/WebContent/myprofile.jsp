<%@page import="bean.UserBean"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>My profile</title>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Home</title>
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
<script>
var pdfdoc = new jsPDF();

$(document).ready(function(){
$("#generatepdf").click(function(){
pdfdoc.fromHTML($('#pdfdiv').html(), 10, 10, {
'width': 200,

});
pdfdoc.save('report.pdf');
});});
</script>
  
  
  
  </head>


<body>
 <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import ="bean.UserBean"%> 
 <%@ include file="nav-bar-profile.jsp" %>
 <%
if(session.getAttribute("username")==null)
{response.sendRedirect("login.jsp");}
  
//System.out.println(session.getAttribute("isloggedin")+"myprofile");

 
 Connection conn=null;
 
 try
	{
 Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nicdb","root","root");
	System.out.println("Connected..");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
 UserBean ub=new UserBean();
 try {	
		
		PreparedStatement ps=conn.prepareStatement("select *  from user where username=? and password=?");
	    ps.setString(1,(String)session.getAttribute("username"));  
	    ps.setString(2,(String)session.getAttribute("password"));		    	         
        ResultSet rs=ps.executeQuery();
       boolean status=rs.next();
 	
    ub.setFirstname(rs.getNString("firstname"));
    ub.setAddress(rs.getString("address"));
    ub.setAge(rs.getInt("age"));
    ub.setEmail(rs.getString("username"));
    ub.setGender(rs.getString("gender"));
    ub.setLastname(rs.getString("lastname"));
    
     	
     
	} 
	catch (Exception e) {
		e.printStackTrace();
	}	 
 conn.close();
 
 
// session.setAttribute("ub", ub);
   %>
  
  <div class="container h-100 " id="pdfdiv" style="margin-top:50px;">
    <h1>Your Details</h1>
    <br>
    <a style="float:right;"  class="btn btn-primary btn-customized" href="updatepassword.jsp">Update Password</a>
		
    <div class="row  justify-content-center align-items-center">
        
        <div class="col-10 col-md-4 col-lg-10">
        
        <div >
        <label for="firstname" style="font-size:20px; font-weight: 500;">First Name : </label>
        <%= ub.getFirstname() %></div>
        <div >
        <label for="lastname" style="font-size:20px; font-weight: 500;">Last Name : </label>
        <%= ub.getLastname()%>
        
        </div>
        
        
        <div>
        <label for="email" style="font-size:20px; font-weight: 500;" >Email Address : </label>
        <%= ub.getEmail()%>
        </div>
        <div>
        <label for="gender" style="font-size:20px; font-weight: 500;">Gender : </label>
        <%= ub.getGender()%>
        </div>
        <div>
        <label for="age" style="font-size:20px; font-weight: 500;">Age : </label>
        <%= ub.getAge()%>
        </div>
        <div>
        <label for="address"  style="font-size:20px; font-weight: 500;">Address : </label>
        <%= ub.getAddress() %>
        </div>
          
        </div>
        </div>
        
        
        <button style="float:right;"  class="btn btn-primary btn-customized" id="generatepdf">Generate PDF</button>
		</div>
		
</body>
</html>