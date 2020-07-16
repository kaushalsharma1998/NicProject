<%@page import="bean.UserAdmin"%>
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

    <title>Admin Page</title>
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
<script src="jstable.js"></script>
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
  
<link rel="stylesheet" href="csstable.css">

  
  
  </head>


<body>
<%@ page import="java.util.ArrayList"   %> 
<%@ include file="nav-bar-profile.jsp" %>
<%@ page import ="bean.UserAdmin" %>
<%@ page import ="bean.UserAdminBean" %>
 
<% 
 
if(session.getAttribute("adminu")==null ||session.getAttribute("adminp")==null)
	{
	response.sendRedirect("adminlogin.jsp");	}

 ArrayList<UserAdminBean>list= new UserAdmin().getAllusers();

 %>
     <h1  style="margin:40px" align="center">Admin Panel</h1>

 <div class="container">
  <h2>Users</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
        <th>Address</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Attempts</th>
        
      </tr>
    </thead>
    
    <tbody id="myTable">
      <%for(int i=0;i<list.size();i++)
    	{ UserAdminBean u=list.get(i);%>
      <tr>
        <td><%=u.getFirstname() %></td>
        <td><%=u.getLastname() %></td>
        <td><%=u.getUsername() %></td>
        <td><%=u.getGender() %></td>
      	<td><%=u.getAge()%></td>
      	<td><%=u.getAddress() %></td>
      	<td><%=u.getAttempts()  %> <a  style="margin-right:10px" href='resetattempts.jsp?uname=<%=u.getUsername()%>'>  Reset </a></td>
      </tr>
      <%} %>
      </tbody>
  </table>
  <a style="float:left;"  class="btn btn-primary btn-customized" href="updateusernamead.jsp">Update Username</a>			 
 <a style="float:right;"  class="btn btn-primary btn-customized" href="updatepasswordad.jsp">Update Password</a>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>


</body>
</body>
</html>