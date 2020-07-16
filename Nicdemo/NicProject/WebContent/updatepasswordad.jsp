<%@page import="controller.Validateadmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    
 
  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>


  
</head>
<script>
  $(document).ready(function(){
      var $submitBtn = $("#submit");
      var $passwordBox = $("#password");
      var $confirmBox = $("#rpassword");
      var $currentBox = $('#current_password');
      var $errorMsg =  $('<span id="error_msg" style="color:red">Passwords do not match.</span>');
      var $errorMsg2 =  $('<span id="error_msg2" style="color:red">New password cannot be same as old password</span>');
      var $errorMsg3 =  $('<span id="error_msg3" style="color:red">Enter correct password</span>');

	
      // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
      $submitBtn.removeAttr("disabled");

      function checkMatchingPasswords(){
          if($confirmBox.val() != "" && $passwordBox.val != ""){
              if( $confirmBox.val()!= $passwordBox.val() ){
                  $submitBtn.attr("disabled", "disabled");
                  $errorMsg.insertAfter($confirmBox);
              }
          }
      }

      function resetPasswordError(){
          $submitBtn.removeAttr("disabled");
          var $errorCont = $("#error_msg");
          if($errorCont.length > 0){
              $errorCont.remove();
          }  
      }


      $("#rpassword, #password")
           .on("keydown", function(e){
              /* only check when the tab or enter keys are pressed
               * to prevent the method from being called needlessly  */
              if(e.keyCode == 13 || e.keyCode == 9) {
                  checkMatchingPasswords();
              }
           })
           .on("blur", function(){                    
              // also check when the element looses focus (clicks somewhere else)
              checkMatchingPasswords();
          })
          .on("focus", function(){
              // reset the error message when they go to make a change
              resetPasswordError();
          })


          function checkMatchingPasswords2(){
    	  
              if($currentBox.val() != "" && $passwordBox.val != ""){
                  if($currentBox.val()==$passwordBox.val() ){
                      $submitBtn.attr("disabled", "disabled");
                      $errorMsg2.insertAfter($passwordBox);
                  }
              }
          }

          function resetPasswordError2(){
              $submitBtn.removeAttr("disabled");
              var $errorCont = $("#error_msg2");
              if($errorCont.length > 0){
                  $errorCont.remove();
              }  
          }


          $("#current_password, #password")
               .on("keydown", function(e){
                  /* only check when the tab or enter keys are pressed
                   * to prevent the method from being called needlessly  */
                  if(e.keyCode == 13 || e.keyCode == 9) {
                      checkMatchingPasswords2();
                  }
               })
               .on("blur", function(){                    
                  // also check when the element looses focus (clicks somewhere else)
                  checkMatchingPasswords2();
              })
              .on("focus", function(){
                  // reset the error message when they go to make a change
                  resetPasswordError2();
              })

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  });
  
  
</script>

<body>
<%@ include file="nav-bar-profile.jsp" %>
<% if(session.getAttribute("adminu")==null||session.getAttribute("adminp")==null) 
	response.sendRedirect("adminlogin.jsp");


%>
  <div class="container h-100 "  style="margin-top:50px;">
    <div class="row  justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
  <form name="form" action="updatepasswordad.jsp" method="post">
  <h1>Update Password</h1>
    <div class="form-group">
    <label for="password"> Current Password</label>
    <input type="password" class="form-control"  name="current_password"  id="current_password" placeholder=" Current Password" required="required">
  </div>
  <div class="form-group">
    <label for="rpassword"> New  Password</label>
    <input type="password"  name="password" class="form-control" id="password" placeholder="Password" required="required">
  </div>
  <div class="form-group">
    <label for="rpassword"> Retype  New Password</label>
    <input type="password"  name="rpassword" class="form-control" id="rpassword" placeholder=" Retype Password" required="required">
  </div>
  
 <!--  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="rememberme">
    <label class="form-check-label" for="rememberme">Remember me </label>
  </div> -->
<div id="isupdated"></div>  
  <button type="submit"  name="submit" id="submit" class="btn btn-primary btn-customized">Submit</button>
   <button type="reset" class="btn btn-primary btn-customized">Reset </button>
</form>

</div>

  </div>
  </div>
<%
if(request.getParameter("current_password")!=null &&request.getParameter("rpassword")!=null&&request.getParameter("password")!=null)
{   String adminp=(String)session.getAttribute("adminp");
	if(session.getAttribute("adminp")!=null&&adminp.equals(request.getParameter("current_password"))==false)
	
{   //System.out.println((String)session.getAttribute("adminp"));
//System.out.println((request.getParameter("current_password")));
//System.out.println(adminp.equals(request.getParameter("current_password")));
out.println("<script>document.getElementById('isupdated').innerHTML ='Current password didnt match';document.getElementById('isupdated').style.color = '#ff0000';</script>");
	}
else{
	int rs=  new Validateadmin().updatepasssword(request.getParameter("current_password"),request.getParameter("password"));
	if(rs==1)
	  { session.setAttribute("adminp", request.getParameter("password") );
	    out.println("<script>alert('Username Succesfullly Updated'); window.location.href = 'admin.jsp';</script>");
	  }
	else if(rs==-1)
	{
		out.println("<script>document.getElementById('isupdated').innerHTML ='New  password cannot be same as old password';document.getElementById('isupdated').style.color = '#ff0000';</script>");
	}
}
}

%>

</body>
</html>